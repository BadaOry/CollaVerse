package com.collaverse.mvc.member.cotroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
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
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
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
	

	// 회원 정보 수정
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
			model.addObject("msg", "회원정보 수정을 완료했습니다.");
			model.addObject("location", "/member/myPage");
		} else {
			model.addObject("msg", "회원정보 수정에 실패했습니다.");
			model.addObject("location", "/member/myPage");
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
			model.addObject("msg", "정상적으로 탈퇴되었습니다.");
			model.addObject("location", "/logout");
		} else {
			model.addObject("msg", "회원 탈퇴에 실패하였습니다.");
			model.addObject("location", "/member/myPage");			
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
}


