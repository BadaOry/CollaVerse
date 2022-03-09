package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;

public interface CategoryService {

	List<Promotion> selectLiving();

	List<Promotion> selectCulture();

	List<Promotion> selectFood();

	List<Promotion> selectTech();

	List<Promotion> selectFashion();

	List<Product> selectLproduct();

	List<Product> selectCproduct();

	List<Product> selectFproduct();

	List<Product> selectTproduct();

	List<Product> selectFsproduct();


}
