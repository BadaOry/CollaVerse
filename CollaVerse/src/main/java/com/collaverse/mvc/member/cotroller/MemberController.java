package com.collaverse.mvc.member.cotroller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.servlet.ModelAndView;

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
	
	//로그인
	@RequestMapping(value = "member/login", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model,
			@RequestParam("id") String id, @RequestParam("password") String password) {
		
		log.info("{}, {}", id, password);
		
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
	
	@GetMapping("/member/login")
	public String loginpage() {
		log.info("로그인");
		
		return "member/login";
	}
	
	// 로그아웃
	@GetMapping("/member/logout")
	public String logout(SessionStatus status) {
		
		log.info("status.isComplete() : {}", status.isComplete());

		status.setComplete();
		
		log.info("status.isComplete() : {}", status.isComplete());
		
		return "redirect:/";
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
				
		int result = service.save(member);
		
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
	public ResponseEntity<Map<String, Boolean>> idCheck(@RequestParam("userId") String userId) {
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
			@ModelAttribute Member member) {
		int result = 0;
		
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
			@ModelAttribute Member member) {
		int result = 0;
		
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
			model.addObject("location", "/logout");
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
	
	@RequestMapping(value = "member/findId", method = {RequestMethod.POST})
	public ModelAndView findId(ModelAndView model, @RequestParam("email") String email) {
		
		log.info("{}", email);
		
		Member findId = service.findId(email);
		
		if(findId != null) {
			model.addObject("findId", findId);
			model.setViewName("redirect:/");
			
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
	
	@RequestMapping(value = "member/findPw", method = {RequestMethod.POST})
	public ModelAndView findPw(ModelAndView model, @RequestParam("email") String email, @RequestParam("id") String id) {
		
		log.info(email, id);
		
		Member findPw = service.findPw(email, id);
		
		if(findPw != null) {
			model.addObject("findPw", findPw);
			model.setViewName("redirect:/");
			
		} else {
			model.addObject("msg", "등록된 이메일/아이디가 없습니다.");
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
	
}


