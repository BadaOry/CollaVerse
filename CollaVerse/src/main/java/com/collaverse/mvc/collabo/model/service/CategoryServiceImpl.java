package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.collabo.model.dao.CollaboMapper;
import com.collaverse.mvc.collabo.model.vo.Promotion;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CollaboMapper mapper;

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

}
