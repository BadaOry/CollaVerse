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
		
		// 문화 프로모션 가져오기
		List<Promotion> clist = service.selectCulture();
		// 문화 상품 가져오기
		List<Product> cpro = service.selectCproduct();
		
		// 정상적으로 가져오는지 확인
		log.info(clist.toString());
		log.info(cpro.toString());
		
		model.addObject("clist", clist);
		model.addObject("cpro", cpro);
		model.setViewName("/collabo/category/culture/cultureList");
		
		return model;
	}
	
	// 식품 카테고리
	@GetMapping("/collabo/category/food/foodList")
	public ModelAndView foodList(ModelAndView model) {
		
		// 식품 프로모션 가져오기
		List<Promotion> flist = service.selectFood(); 
		// 식품 상품 가져오기
		List<Product> fpro = service.selectFproduct();
		
		// 정상적으로 가져오는지 확인
		log.info(flist.toString());
		log.info(fpro.toString());
		
		model.addObject("flist", flist);
		model.addObject("fpro", fpro);
		model.setViewName("/collabo/category/food/foodList");
		
		return model;
	}
	
	// 전자제품 카테고리
	@GetMapping("/collabo/category/tech/techList")
	public ModelAndView techList(ModelAndView model) {
		
		// 전자제품 프로모션 가져오기
		List<Promotion> tlist = service.selectTech();
		// 전자제품 상품 가져오기
		List<Product> tpro = service.selectTproduct();
		
		// 정상적으로 가져오는지 확인
		log.info(tlist.toString());
		log.info(tpro.toString());
		
		model.addObject("tlist", tlist);
		model.addObject("tpro", tpro);
		model.setViewName("/collabo/category/tech/techList");
		
		return model;
	}
	
	// 패션 카테고리
	@GetMapping("/collabo/category/fashion/fashionList")
	public ModelAndView fashionList(ModelAndView model) {
		
		// 패션 프로모션 가져오기
		List<Promotion> fslist = service.selectFashion();
		// 패션 상품 가져오기
		List<Product> fspro = service.selectFsproduct();
		
		// 정상적으로 가져오는지 확인
		log.info(fslist.toString());
		log.info(fspro.toString());
		
		model.addObject("fslist", fslist);
		model.addObject("fspro", fspro);
		model.setViewName("/collabo/category/fashion/fashionList");
		
		return model;
	}
	
}
