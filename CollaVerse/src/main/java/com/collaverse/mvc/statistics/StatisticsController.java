package com.collaverse.mvc.statistics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.collaverse.mvc.member.model.service.MemberService;
import com.collaverse.mvc.member.model.vo.Member;

@Controller
@RequestMapping("/mypage/statistics")
public class StatisticsController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/statisticsCount")
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
  		int yesterday1Count = service.getYesterday1Count(memberNo);
  		int yesterday2Count = service.getYesterday2Count(memberNo);
  		int yesterday3Count = service.getYesterday3Count(memberNo);
  		int yesterday4Count = service.getYesterday4Count(memberNo);
  		int yesterday5Count = service.getYesterday5Count(memberNo);
  		int yesterday6Count = service.getYesterday6Count(memberNo);
  		int yesterday7Count = service.getYesterday7Count(memberNo);

  		model.addAttribute("womenCount", womenCount);
  		model.addAttribute("menCount", menCount);
  		model.addAttribute("teenagerCount", teenagerCount);
  		model.addAttribute("twentiesCount", twentiesCount);
  		model.addAttribute("thirtiesCount", thirtiesCount);
  		model.addAttribute("fortiesCount", fortiesCount);
  		model.addAttribute("fiftiesCount", fiftiesCount);
  		model.addAttribute("etcCount", etcCount);
  		model.addAttribute("totalCount", totalCount);
  		model.addAttribute("yesterday1Count", yesterday1Count);
  		model.addAttribute("yesterday2Count", yesterday2Count);
  		model.addAttribute("yesterday3Count", yesterday3Count);
  		model.addAttribute("yesterday4Count", yesterday4Count);
  		model.addAttribute("yesterday5Count", yesterday5Count);
  		model.addAttribute("yesterday6Count", yesterday6Count);
  		model.addAttribute("yesterday7Count", yesterday7Count);
  		
		return "/mypage/statistics/statisticsCount";
	}
}
