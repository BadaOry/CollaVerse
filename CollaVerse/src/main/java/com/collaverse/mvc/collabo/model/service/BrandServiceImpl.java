package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.collabo.model.dao.CollaboMapper;
import com.collaverse.mvc.collabo.model.vo.Brand;
import com.collaverse.mvc.collabo.model.vo.Promotion;

@Service
public class BrandServiceImpl implements BrandService {
	@Autowired
	private CollaboMapper mapper;

	@Override
	public List<Promotion> selectAll() {
		
		return mapper.selectAll();
	}

	@Override
	public List<Brand> selectBrand() {
		
		return mapper.selectBrand();
	}

	@Override
	public List<Brand> selectBrandB() {
		
		return mapper.selectBrandB();
	}

}
