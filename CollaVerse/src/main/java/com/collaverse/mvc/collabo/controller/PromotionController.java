package com.collaverse.mvc.collabo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.collabo.model.service.PromotionService;
import com.collaverse.mvc.collabo.model.vo.Promotion;
import com.collaverse.mvc.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PromotionController {
	@Autowired
	private PromotionService service;

/*
	@GetMapping("/collabo/promotion/main")
	public ModelAndView list(ModelAndView model,
			@RequestParam(defaultValue = "1") int page) {
		
		int promotionCount = 0;
		PageInfo pageInfo = null;
		List<Promotion> list = null;
		
		log.info("page number : {}", page);
		
		promotionCount = service.getPromotionCount();
		pageInfo = new PageInfo (page, 5, promotionCount, 3);	
		list = service.getPromotionList(pageInfo);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("/collabo/promotion/main"); // 실제로 전달해줄 View의 이름 
		
		return model;
	}
*/

/*	
	@GetMapping("/collabo/promotion/main")
	public ModelAndView view(ModelAndView model, @RequestParam("no") int no) {
		
		Promotion promotion = service.findPromotionByNo(no);
		
		model.addObject("promotion", promotion);
		model.setViewName("/collabo/promotion/main");
		
		return model;
	}
*/
	
	@GetMapping("/collabo/promotion/main")
	public ModelAndView view(ModelAndView model, @ModelAttribute Promotion promotion) {
		
//		promotion = service.selectAll();
		
//		model.addObject("promotion", promotion);
//		model.setViewName("/collabo/promotion/main");
		
		return model;
	}
	

	@GetMapping("/collabo/promotion/detail")
	public String detail() {
		
		return "/collabo/promotion/detail";
		
	}
}
