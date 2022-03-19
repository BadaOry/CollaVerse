package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;

public interface CategoryService {

	// 카테고리별 Promotion 조회
	List<Promotion> selectLiving();

	List<Promotion> selectCulture();

	List<Promotion> selectFood();

	List<Promotion> selectTech();

	List<Promotion> selectFashion();

	// 카테고리별 Product 조회
	List<Product> selectLproduct();

	List<Product> selectCproduct();

	List<Product> selectFproduct();

	List<Product> selectTproduct();

	List<Product> selectFsproduct();


}
