package com.collaverse.mvc.collabo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.collabo.model.service.BrandService;
import com.collaverse.mvc.collabo.model.vo.Brand;
import com.collaverse.mvc.collabo.model.vo.Promotion;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BrandController {
	
	@Autowired
	private BrandService service;

	@GetMapping("/collabo/brand/brand")
	public ModelAndView brand(ModelAndView model) {
		
		// Promotion 정보  
		List<Promotion> plist = service.selectAll();
		// Brand 정보 
		List<Brand> blist = service.selectBrand();
		
		// 정규표현식 사용한 특정 Brand 정보 
		List<Brand> blistb = service.selectBrandB();
		
		// 정상적으로 가져오는지 확인 
		log.info(plist.toString());
		log.info(blist.toString());
		log.info(blistb.toString());
		
		model.addObject("plist", plist);
		model.addObject("blist", blist);
		model.addObject("blistb", blistb);
		model.setViewName("/collabo/brand/brand");
		
		return model;
	}
	
}
