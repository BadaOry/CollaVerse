package com.collaverse.mvc.schedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.collaverse.mvc.member.model.vo.Member;
import com.collaverse.mvc.schedule.model.ScheduleVO;
import com.collaverse.mvc.schedule.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/*")
public class ScheduleController {

	@Autowired
	private ScheduleService service;
	
	@RequestMapping(value = "/calendar/scheduleDetail")
	public String schedule(Model model,
			@SessionAttribute("loginMember") Member loginMember)throws Exception {

		List<ScheduleVO> showSchedule = null;
		int memberNo = loginMember.getNo();
		
		showSchedule = service.showSchedule(memberNo);
		
//		model.addAttribute("showSchedule" , service.showSchedule());
		model.addAttribute("showSchedule" , showSchedule);
		
		log.info("[Contoller] showSchedule : {}", showSchedule);
		
		return "/mypage/calendar/scheduleDetail";
	}
	
	// 일정추가 get
	@RequestMapping(value = "/calendar/scheduleAdd")
	public String schedulePopup() throws Exception {
		
		return "/mypage/calendar/scheduleAdd";
	}
	
	// 일정추가 post
	@ResponseBody
	@RequestMapping(value = "/calendar/addSchedule", method = RequestMethod.POST)
	public Map<Object,Object> addSchedule(@RequestBody ScheduleVO vo,
			@SessionAttribute("loginMember") Member loginMember) throws Exception{
		
		Map<Object,Object>map = new HashMap<Object,Object>();
		
		int memberNo = loginMember.getNo();
		
		vo.setMemberNo(memberNo);
		
		
		service.addSchedule(vo);

		return map;
	}
	
	@GetMapping("/calendar/scheduleModify")
	public String modify(Model model, int no, ScheduleVO scheduleVO) throws Exception {
		log.info("제대로 넘어오긴 하니? {}, {}", no, scheduleVO);
		ScheduleVO vo = null;
		int scheduleNo = 0;
		
		vo = service.getSchedule(no);
		
		scheduleNo = vo.getNo();
		
		log.info("[Controller] vo 정보 출력 : {} ", vo);
		log.info("[Controller] scheduleNo 정보 출력 : {} ", scheduleNo);
		
		model.addAttribute("scheduleNo", scheduleNo);
		model.addAttribute("vo", vo);
		
		return "/mypage/calendar/scheduleModify";
	}
	
	@ResponseBody
	@RequestMapping(value = "/calendar/deleteSchedule", method = RequestMethod.POST)
	public Map<Object,Object> deleteSchedule(int no, ScheduleVO scheduleVO, Model model) throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();

		ScheduleVO vo = null;
		int scheduleNo = 0;
		
		vo = service.getSchedule(no);
		
		scheduleNo = vo.getNo();
		
		model.addAttribute("scheduleNo", scheduleNo);
		model.addAttribute("vo", vo);
		
		service.deleteSchedule(no);

		return map;
	}
	
}
