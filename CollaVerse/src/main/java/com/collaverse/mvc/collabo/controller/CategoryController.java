package com.collaverse.mvc.collabo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.collabo.model.service.CategoryService;
import com.collaverse.mvc.collabo.model.vo.Promotion;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CategoryController {
	@Autowired
	private CategoryService service;

	// 리빙 카테고리
	@GetMapping("/collabo/category/living/livingList")
	public ModelAndView livingList(ModelAndView model) {
		
		List<Promotion> llist = service.selectLiving(); 
		
		log.info(llist.toString());
		
		model.addObject("llist", llist);
		model.setViewName("/collabo/category/living/livingList");
		
		return model;
		
	}
	
	/*
	 * 
	 * 		@GetMapping("/collabo/promotion/main")
		public ModelAndView list(ModelAndView model) {
			
//			promotion = service.selectAll();
			
//			model.addObject("promotion", promotion);
//			model.setViewName("/collabo/promotion/main");
			
			List<Promotion> list = service.selectAll();
			
			log.info(list.toString());
			
			model.addObject("list", list);
			model.setViewName("/collabo/promotion/main");
			
			return model;
		}
	 */
	
	@GetMapping("/collabo/category/culture/cultureList")
	public ModelAndView cultureList(ModelAndView model) {
		
		List<Promotion> clist = service.selectCulture(); 
		
		log.info(clist.toString());
		
		model.addObject("clist", clist);
		model.setViewName("/collabo/category/culture/cultureList");
		
		return model;
	}
	
	@GetMapping("/collabo/category/food/foodList")
	public ModelAndView foodList(ModelAndView model) {
		
		List<Promotion> flist = service.selectFood(); 
		
		log.info(flist.toString());
		
		model.addObject("flist", flist);
		model.setViewName("/collabo/category/food/foodList");
		
		return model;
	}
	
	@GetMapping("/collabo/category/tech/techList")
	public ModelAndView techList(ModelAndView model) {
		
		List<Promotion> tlist = service.selectTech(); 
		
		log.info(tlist.toString());
		
		model.addObject("tlist", tlist);
		model.setViewName("/collabo/category/tech/techList");
		
		return model;
	}
	
	@GetMapping("/collabo/category/fashion/fashionList")
	public ModelAndView fashionList(ModelAndView model) {
		
		List<Promotion> fslist = service.selectFashion(); 
		
		log.info(fslist.toString());
		
		model.addObject("fslist", fslist);
		model.setViewName("/collabo/category/fashion/fashionList");
		
		return model;
	}
	
	@GetMapping("/collabo/brand/brand")
	public String brand() {
		return "/collabo/brand/brand";
	}
	
}
