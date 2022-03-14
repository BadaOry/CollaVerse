package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import com.collaverse.mvc.collabo.model.vo.Brand;
import com.collaverse.mvc.collabo.model.vo.Promotion;

public interface BrandService {

	List<Promotion> selectAll();

	List<Brand> selectBrand();

}
