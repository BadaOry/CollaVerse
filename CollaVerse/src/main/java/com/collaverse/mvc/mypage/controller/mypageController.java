package com.collaverse.mvc.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mypageController {

	@GetMapping("/mypage/person_mypage")
	public String person() {
		
		return "mypage/person_mypage";
	}
	
	@GetMapping("/mypage/business_mypage")
	public String business() {
		
		return "mypage/business_mypage";
	}
	
	@GetMapping("/mypage/calendar/calendar_detail")
	public String calendar_person() {
		
		return "mypage/calendar/calendar_detail";
	}
	
	@GetMapping("/mypage/calendar/calendar_detail_business")
	public String calendar_business() {
		
		return "mypage/calendar/calendar_detail_business";
	}
}
