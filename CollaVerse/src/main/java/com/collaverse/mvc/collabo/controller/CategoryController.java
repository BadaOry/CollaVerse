package com.collaverse.mvc.collabo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.collabo.model.service.CategoryService;
import com.collaverse.mvc.collabo.model.vo.Product;
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
		
		// 리빙 프로모션 가져오기
		List<Promotion> llist = service.selectLiving();
		// 리빙 상품 가져오기
		List<Product> lpro = service.selectLproduct();
		
		// 정상적으로 가져오는지 확인 
		log.info(llist.toString());
		log.info(lpro.toString());
		
		model.addObject("llist", llist);
		model.addObject("lpro", lpro);
		model.setViewName("/collabo/category/living/livingList");
		
		return model;
		
	}
	
	// 문화 카테고리
	@GetMapping("/collabo/category/culture/cultureList")
	public ModelAndView cultureList(ModelAndView model) {
		
		List<Promotion> clist = service.selectCulture();
		List<Product> cpro = service.selectCproduct();
		
		log.info(clist.toString());
		log.info(cpro.toString());
		
		model.addObject("clist", clist);
		model.addObject("cpro", cpro);
		model.setViewName("/collabo/category/culture/cultureList");
		
		return model;
	}
	
	@GetMapping("/collabo/category/food/foodList")
	public ModelAndView foodList(ModelAndView model) {
		
		List<Promotion> flist = service.selectFood(); 
		List<Product> fpro = service.selectFproduct();
		
		log.info(flist.toString());
		log.info(fpro.toString());
		
		model.addObject("flist", flist);
		model.addObject("fpro", fpro);
		model.setViewName("/collabo/category/food/foodList");
		
		return model;
	}
	
	@GetMapping("/collabo/category/tech/techList")
	public ModelAndView techList(ModelAndView model) {
		
		List<Promotion> tlist = service.selectTech();
		List<Product> tpro = service.selectTproduct();
		
		log.info(tlist.toString());
		log.info(tpro.toString());
		
		model.addObject("tlist", tlist);
		model.addObject("tpro", tpro);
		model.setViewName("/collabo/category/tech/techList");
		
		return model;
	}
	
	@GetMapping("/collabo/category/fashion/fashionList")
	public ModelAndView fashionList(ModelAndView model) {
		
		List<Promotion> fslist = service.selectFashion();
		List<Product> fspro = service.selectFsproduct();
		
		log.info(fslist.toString());
		log.info(fspro.toString());
		
		model.addObject("fslist", fslist);
		model.addObject("fspro", fspro);
		model.setViewName("/collabo/category/fashion/fashionList");
		
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
	

	
	@GetMapping("/collabo/brand/brand")
	public String brand() {
		return "/collabo/brand/brand";
	}
	
}
