package com.collaverse.mvc.member.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.member.model.service.MemberService;
import com.collaverse.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//로그인
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model,
			@RequestParam("id") String id, @RequestParam("password") String password) {
		
		log.info("{}, {}", id, password);		
		
		Member loginMember = service.login(id, password); //멤버서비스에 로그인기능을 위임
		
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
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		log.info("status.isComplete() : {}", status.isComplete());

		status.setComplete();
		
		log.info("status.isComplete() : {}", status.isComplete());
		
		return "redirect:/";
	}
	
	@GetMapping("/member/enroll")
	public String enroll() {
		log.info("회원 가입 페이지 요청");
		
		return "member/enroll";
	}
	
	// 회원가입
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
}


