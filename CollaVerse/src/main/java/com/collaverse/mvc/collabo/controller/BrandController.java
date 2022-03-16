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
		List<Brand> blistc = service.selectBrandC();
		List<Brand> blistd = service.selectBrandD();
		List<Brand> bliste = service.selectBrandE();
		List<Brand> blistk = service.selectBrandK();
		List<Brand> blistl = service.selectBrandL();
		List<Brand> blistm = service.selectBrandM();
		List<Brand> blistn = service.selectBrandN();
		List<Brand> blistp = service.selectBrandP();
		List<Brand> blists = service.selectBrandS();
		List<Brand> blistt = service.selectBrandT();
		List<Brand> blistw = service.selectBrandW();
		List<Brand> blisty = service.selectBrandY();
		
		
		// 정상적으로 가져오는지 확인 
/*		log.info(plist.toString());
		log.info(blist.toString());
		log.info(bliste.toString());
		log.info(blistl.toString()); */
		
		model.addObject("plist", plist);
		model.addObject("blist", blist);
		model.addObject("blistb", blistb);
		model.addObject("blistc", blistc);
		model.addObject("blistd", blistd);
		model.addObject("bliste", bliste);
		model.addObject("blistk", blistk);
		model.addObject("blistl", blistl);
		model.addObject("blistm", blistm);
		model.addObject("blistn", blistn);
		model.addObject("blistp", blistp);
		model.addObject("blists", blists);
		model.addObject("blistt", blistt);
		model.addObject("blistw", blistw);
		model.addObject("blisty", blisty);
		
		model.setViewName("/collabo/brand/brand");
		
		return model;
	}
	
}
