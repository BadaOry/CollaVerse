package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.collabo.model.dao.CollaboMapper;
import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CollaboMapper mapper;

	// 카테고리별 Promotion 조회
	@Override
	public List<Promotion> selectLiving() {
		
		return mapper.selectLiving();
	}

	@Override
	public List<Promotion> selectCulture() {
		return mapper.selectCulture();
	}

	@Override
	public List<Promotion> selectFood() {

		return mapper.selectFood();
	}

	@Override
	public List<Promotion> selectTech() {

		return mapper.selectTech();
	}

	@Override
	public List<Promotion> selectFashion() {
		
		return mapper.selectFashion();
	}

	// 카테고리별 Product 조회
	@Override
	public List<Product> selectLproduct() {
		
		return mapper.selectLproduct();
	}

	@Override
	public List<Product> selectCproduct() {
		
		return mapper.selectCproduct();
	}

	@Override
	public List<Product> selectFproduct() {
		
		return mapper.selectFproduct();
	}

	@Override
	public List<Product> selectTproduct() {
		
		return mapper.selectTproduct();
	}

	@Override
	public List<Product> selectFsproduct() {
		
		return mapper.selectFsproduct();
	}

}
