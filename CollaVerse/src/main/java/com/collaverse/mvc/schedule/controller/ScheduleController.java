package com.collaverse.mvc.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.collaverse.mvc.schedule.model.ScheduleVO;
import com.collaverse.mvc.schedule.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService service;
	
	@GetMapping("/calendar_detail")
	public String schedule(Model model)throws Exception {

		List<ScheduleVO> showSchedule = null;
		
		showSchedule = service.showSchedule();
		
//		model.addAttribute("showSchedule" , service.showSchedule());
		model.addAttribute("showSchedule" , showSchedule);
		
		log.info("[Contoller] showSchedule : {}", showSchedule);
		
		
		return "/mypage/calendar/calendar_detail";
	}
}
