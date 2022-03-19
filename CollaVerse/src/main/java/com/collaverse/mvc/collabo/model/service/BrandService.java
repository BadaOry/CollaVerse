package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import com.collaverse.mvc.collabo.model.vo.Brand;
import com.collaverse.mvc.collabo.model.vo.Promotion;

public interface BrandService {

	// 프로모션 조회
	List<Promotion> selectAll();

	// 브랜드 전체 조회
	List<Brand> selectBrand();

	// 알파벳별 브랜드 조회
	List<Brand> selectBrandDetail(String alphabet);



}
