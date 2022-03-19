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

	// 프로모션 조회
	@Override
	public List<Promotion> selectAll() {
		
		return mapper.selectAll();
	}

	// 브랜드 전체 조회
	@Override
	public List<Brand> selectBrand() {
		
		return mapper.selectBrand();
	}

	// 알파벳별 브랜드 조회
	@Override
	public List<Brand> selectBrandDetail(String alphabet) {
		
		return mapper.selectBrandDetail2(alphabet);
	}



}
