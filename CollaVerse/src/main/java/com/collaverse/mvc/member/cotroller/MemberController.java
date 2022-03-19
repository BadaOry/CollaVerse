package com.collaverse.mvc.member.cotroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.common.util.FileProcess;
import com.collaverse.mvc.member.model.service.MemberService;
import com.collaverse.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
@SessionAttributes("loginMember")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	// 로그인 페이지로 이동
	@GetMapping("/member/login")
	public String loginpage() {
		log.info("로그인");
		
		return "member/login";
	}
	
	//로그인
	@RequestMapping(value = "member/login", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model,
			@RequestParam("id") String id, @RequestParam("password") String password) {
		
		log.info("[로그인] id : {} , password : {}", id, password);
		
		Member loginMember = service.login(id, password);
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.setViewName("redirect:/");
		} else {
			model.addObject("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}		
		
		return model;
	}
	

	// 로그아웃
	@GetMapping("/member/logout")
	public String logout(SessionStatus status) {
		
		log.info("status.isComplete() : {}", status.isComplete());

		status.setComplete();
		
		log.info("status.isComplete() : {}", status.isComplete());
		
		return "redirect:/";
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/member/enrollPage")
	public String enrollPage() {
		log.info("회원 가입 페이지 이동");
		
		return "member/enrollPage";
	}
	
	// 개인 회원약관 페이지 이동
	@GetMapping("/member/terms")
	public String terms() {
		log.info("개인 회원가입 약관 페이지 이동");
		
		return "member/terms";
	}
	
	// 사업자 회원약관 페이지 이동
	@GetMapping("/member/terms_business")
	public String terms_business() {
		log.info("사업자 회원가입 약관 페이지 이동");
		
		return "member/terms_business";
	}
	
	// 개인 회원가입
	@GetMapping("/member/enroll")
	public String enroll() {
		log.info("회원 가입 페이지 요청");
		
		return "member/enroll";
	}
	
	@PostMapping("/member/enroll")
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
		
		log.info(member.toString());
				
		int result = service.save(member);
		
		if(result > 0) {
			model.addObject("msg", "회원가입 완료");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "회원가입 실패");
			model.addObject("location", "/member/enroll");			
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 사업자 회원가입
	@GetMapping("/member/enroll_business")
	public String enroll_business() {
		log.info("사업자 회원 가입 페이지 요청");
		
		return "member/enroll_business";
	}
	
	@PostMapping("/member/enroll_business")
	public ModelAndView enroll_business(ModelAndView model, @ModelAttribute Member member) {
		
		log.info(member.toString());
				
		int result = service.savebusiness(member);
		
		if(result > 0) {
			model.addObject("msg", "회원가입 완료");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "회원가입 실패");
			model.addObject("location", "/member/enroll_business");			
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// id중복확인
	@GetMapping("/member/jsonTest")
	@ResponseBody
	public Object jsonTest() {
		return new Member("cxrew", "1111");
	}
	
	@PostMapping("/member/idCheck")
	public ResponseEntity<Map<String, Boolean>> idCheck(@RequestParam("newId") String userId) {
		Map<String, Boolean> map = new HashMap<>();
		
		log.info("{}", userId);
		
		map.put("duplicate", service.isDuplicateID(userId));
		
		return new ResponseEntity<Map<String,Boolean>>(map, HttpStatus.OK);
	}

	// 개인 회원 정보 수정
	@GetMapping("/member/myPage")
		public String myPage() {
		
		return "member/myPage";
	}
	
	@PostMapping("/member/update")
	public ModelAndView update(
			ModelAndView model,
			@SessionAttribute(name="loginMember") Member loginMember,
			@ModelAttribute Member member,
			@RequestParam("file") MultipartFile upfile) {
		
		log.info("컨트롤러로 요청 오는지 확인");
		
		int result = 0;
		
		// 프로필 사진 첨부
	
			String originalFileName = upfile.getOriginalFilename();
			boolean upfileIsEmpty = upfile.isEmpty();
			
			log.info("[Controller] originalFileName 확인 : {}", originalFileName);
			log.info("[Controller] upfile is Empty 확인 : {}", upfileIsEmpty);
			
			
		// 파일을 업로드 했는지 확인 후, rename 하여 VO 에 set & 지정 위치에 upfile 저장
			if (upfile != null && !upfile.isEmpty()) {
				String location = null;
				String renamedFileName = null;					
				
				try {
					location = resourceLoader.getResource("resources/upload/profile").getFile().getPath();						
					renamedFileName = FileProcess.save(upfile, location);
					
					log.info("[Controller] FileProcess 에서 가져온 renamedFileName 출력 : {}", renamedFileName);									
					
					if (renamedFileName != null) {
						member.setProfile_img(renamedFileName);
//						member.setRenamedFileName01(renamedFileName);
						
						log.info("[Controller] originalFileName 정보 확인 : {}", originalFileName);
						log.info("[Controller] renamedFileName 정보 확인 : {}", renamedFileName);
						
					}
				} catch (IOException e) {
					System.out.println("renamedFileName 불러오기 실패..");
					e.printStackTrace();
				}
				
			}

			/////
		
		member.setNo(loginMember.getNo());
		
		
		result = service.save(member);
		
		if(result > 0) {
			model.addObject("loginMember", service.findMemberById(loginMember.getId()));
			model.addObject("msg", "회원정보수정 완료");
			model.addObject("location", "/member/myPage");
		} else {
			model.addObject("msg", "회원정보수정 실패");
			model.addObject("location", "/member/myPage");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 사업자 회원 정보 수정
	@GetMapping("/member/myPage_business")
		public String myPage_business() {
		
		return "member/myPage_business";
	}
	
	@PostMapping("/member/update1")
	public ModelAndView update1(
			ModelAndView model,
			@SessionAttribute(name="loginMember") Member loginMember,
			@ModelAttribute Member member,
			@RequestParam("file") MultipartFile upfile) {
				
			log.info("컨트롤러로 요청 오는지 확인");

		int result = 0;
		
		// 프로필 사진 첨부
		
		String originalFileName = upfile.getOriginalFilename();
		boolean upfileIsEmpty = upfile.isEmpty();
		
		log.info("[Controller] originalFileName 확인 : {}", originalFileName);
		log.info("[Controller] upfile is Empty 확인 : {}", upfileIsEmpty);
		
		
	// 파일을 업로드 했는지 확인 후, rename 하여 VO 에 set & 지정 위치에 upfile 저장
		if (upfile != null && !upfile.isEmpty()) {
			String location = null;
			String renamedFileName = null;					
			
			try {
				location = resourceLoader.getResource("resources/upload/profile").getFile().getPath();						
				renamedFileName = FileProcess.save(upfile, location);
				
				log.info("[Controller] FileProcess 에서 가져온 renamedFileName 출력 : {}", renamedFileName);									
				
				if (renamedFileName != null) {
					member.setProfile_img(renamedFileName);
					
					log.info("[Controller] originalFileName 정보 확인 : {}", originalFileName);
					log.info("[Controller] renamedFileName 정보 확인 : {}", renamedFileName);
					
				}
			} catch (IOException e) {
				System.out.println("renamedFileName 불러오기 실패..");
				e.printStackTrace();
			}
			
		}

		/////

		
		member.setNo(loginMember.getNo());
		
		result = service.save(member);
		
		if(result > 0) {
			model.addObject("loginMember", service.findMemberById(loginMember.getId()));
			model.addObject("msg", "회원정보수정 완료");
			model.addObject("location", "/member/myPage_business");
		} else {
			model.addObject("msg", "회원정보수정 실패");
			model.addObject("location", "/member/myPage_business");
		}
		
		model.setViewName("common/msg");
		
		return model;
		
	}
	
	// 회원탈퇴
	@GetMapping("/member/delete")
	public ModelAndView delete(ModelAndView model, 
			@SessionAttribute(name="loginMember") Member loginMember) {
		int result = 0;
		
		result = service.delete(loginMember.getNo());
		
		if(result > 0) {
			model.addObject("msg", "탈퇴 완료");
			model.addObject("location", "/member/logout");
		} else {
			model.addObject("msg", "탈퇴 실패");
			model.addObject("location", "/member/myPage");			
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// id 찾기
	@GetMapping("/member/findId")
	public String findId() {
		
		log.info("아이디 찾기");
		
		return "member/findId";
	}
	
	@PostMapping("/member/findIdResult")
	public ModelAndView findId(ModelAndView model, @RequestParam("email") String email) {
		
		String idfinded = null;
		
		log.info("{}", email);
		
		Member findId = service.findId(email);
		
		log.info("[Cotnroller]serivce가 가져온 Member객체인 findId 출력 : {} ", findId);
		
		idfinded = findId.getId();
		
		log.info("[Cotnroller]serivce가 가져온 id만 출력 : {} ", idfinded);
		
		if(idfinded != null) {
			model.addObject("idfinded", idfinded);
			model.setViewName("/member/findIdResult");
			
		} else {
			model.addObject("msg", "등록된 이메일이 없습니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	// id 찾기 결과
	@GetMapping(value="/member/findIdResult")
	public String findIdResult() {
		
		log.info("아이디 찾기 결과");
		
		return "member/findIdResult";
	}
	
	// pw 찾기
	@GetMapping("/member/findPw")
	public String findPw() {
		
		log.info("비밀번호 찾기");
		
		return "member/findPw";
	}
	
	@PostMapping("/member/findPwResult")
	public ModelAndView findPw(ModelAndView model, @RequestParam("id") String id) {
		
		String pwfinded = null;
		
		log.info("{}", id);
		
		Member findPw = service.findPw(id);
		
		log.info("[Cotnroller]serivce가 가져온 Member객체인 findPw 출력 : {} ", findPw);
		
		pwfinded = findPw.getPassword();
		
		log.info("[Cotnroller]serivce가 가져온 pw만 출력 : {} ", pwfinded);
		
		if(pwfinded != null) {
			model.addObject("pwfinded", pwfinded);
			model.setViewName("/member/findPwResult");
			
		} else {
			model.addObject("msg", "등록된 아이디가 없습니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	// pw 찾기 결과
	@GetMapping(value="/member/findPwResult")
	public String findPwResult() {
		
		log.info("비밀번호 찾기 결과");
		
		return "member/findPwResult";
	}
	
	// 사업자등록번호 중복확인
	@GetMapping("/member/jsonTest1")
	@ResponseBody
	public Object jsonTest1() {
		return new Member("1348107358", "삼성전자");
	}
	
	@PostMapping("/member/businessNoCheck")
	public ResponseEntity<Map<String, Boolean>> businessNoCheck(@RequestParam(value="business_no", required=false) String business_no) {
		Map<String, Boolean> map = new HashMap<>();
		
		log.info("{}", business_no);
		
		map.put("duplicate", service.isDuplicatedBusiness_no(business_no));
		
		return new ResponseEntity<Map<String,Boolean>>(map, HttpStatus.OK);
	}
	
	// 닉네임 중복확인
	@GetMapping("/member/jsonTest2")
	@ResponseBody
	public Object jsonTest2() {
		return new Member("양아쥐", "1111");
	}
	
	@PostMapping("/member/nicknameCheck")
	public ResponseEntity<Map<String, Boolean>> nicknameCheck(@RequestParam(value="nickname", required=false) String nickname) {
		Map<String, Boolean> map = new HashMap<>();
		
		log.info("{}", nickname);
		
		map.put("duplicate", service.isDuplicateNickname(nickname));
		
		return new ResponseEntity<Map<String,Boolean>>(map, HttpStatus.OK);
	}
	
	// 비밀번호 변경(작성중)
	@GetMapping(value="/member/updatePwd")
	public String updatePwd() {
		
		log.info("비밀번호 변경하기");
		
		return "member/updatePwd";
	}
	
	@PostMapping("/member/updatePwd")
	public ModelAndView updatePwd(
			ModelAndView model, // 데이터와 넘길 페이지의 값을 모두 가지고 있는 객체
			@SessionAttribute(name="loginMember") Member loginMember, //model의 정보를 http 세션에 저장해주는 어노
			@ModelAttribute Member member) { //사용자가 요청 시 전달하는 값을 오브젝트 형태로 매핑해주는 어노
		
		int result = 0;
		
		member.setPassword(loginMember.getPassword()); //member의 비밀번호를 가져온다
		
		System.out.println(member); //출력해보니 member의 비밀번호만 가져와서 그것만 뜸. 나머지 null
		
		result = service.save(member);
				
		if(result > 0) {
			model.addObject("loginMember", service.findMemberByPw(loginMember.getPassword()));
			model.addObject("msg", "비밀번호 변경 완료");
			model.addObject("location", "/member/updatePwd");
		} else {
			model.addObject("msg", "비밀번호 변경 실패");
			model.addObject("location", "/member/mypage");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
	
	
	

}


