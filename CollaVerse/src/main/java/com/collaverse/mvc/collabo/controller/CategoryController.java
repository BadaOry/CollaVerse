package com.collaverse.mvc.collabo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CategoryController {

	@GetMapping("/collabo/category/living/livingList")
	public String livingList() {
		
		return "/collabo/category/living/livingList";
		
	}
	
	@GetMapping("/collabo/category/culture/cultureList")
	public String cultureList() {
		
		return "/collabo/category/culture/cultureList";
	}
	
	@GetMapping("/collabo/category/food/foodList")
	public String foodList() {
		
		return "/collabo/category/food/foodList";
		
	}
	
	@GetMapping("/collabo/category/tech/techList")
	public String techList() {
		
		return "/collabo/category/tech/techList";
		
	}
	
	@GetMapping("/collabo/category/fashion/fashionList")
	public String fashionList() {
		
		return "/collabo/category/fashion/fashionList";
	}
	
	@GetMapping("/collabo/brand/brand")
	public String brand() {
		return "/collabo/brand/brand";
	}
	
}
