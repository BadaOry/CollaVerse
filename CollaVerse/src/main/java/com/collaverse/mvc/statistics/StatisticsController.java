package com.collaverse.mvc.statistics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.collaverse.mvc.member.model.service.MemberService;

@Controller
public class StatisticsController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/statistics")
	public String getStatistics(Model model) {
		
		int womenCount = service.getWomenCount();
  		int menCount = service.getMenCount();

  		model.addAttribute("womenCount", womenCount);
  		model.addAttribute("menCount", menCount);
		
		return "/statistics/statistics";
	}
}
