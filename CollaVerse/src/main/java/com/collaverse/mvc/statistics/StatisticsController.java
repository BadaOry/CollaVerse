package com.collaverse.mvc.statistics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.collaverse.mvc.member.model.service.MemberService;
import com.collaverse.mvc.member.model.vo.Member;

@Controller
public class StatisticsController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/ageGenderStatistics")
	public String getStatistics(Model model,
			@SessionAttribute("loginMember") Member loginMember) {
		
		int memberNo = loginMember.getNo();
		
		int womenCount = service.getWomenCount(memberNo);
  		int menCount = service.getMenCount(memberNo);
  		int teenagerCount = service.getTeenagerCount(memberNo);
  		int twentiesCount = service.getTwentiesCount(memberNo);
  		int thirtiesCount = service.getThirtiesCount(memberNo);
  		int fortiesCount = service.getFortiesCount(memberNo);
  		int fiftiesCount = service.getFiftiesCount(memberNo);
  		int etcCount = service.getEtcCount(memberNo);
  		int totalCount = service.getTotalCount(memberNo);

  		model.addAttribute("womenCount", womenCount);
  		model.addAttribute("menCount", menCount);
  		model.addAttribute("teenagerCount", teenagerCount);
  		model.addAttribute("twentiesCount", twentiesCount);
  		model.addAttribute("thirtiesCount", thirtiesCount);
  		model.addAttribute("fortiesCount", fortiesCount);
  		model.addAttribute("fiftiesCount", fiftiesCount);
  		model.addAttribute("etcCount", etcCount);
  		model.addAttribute("totalCount", totalCount);
		
		return "/statistics/ageGenderStatistics";
	}
}
