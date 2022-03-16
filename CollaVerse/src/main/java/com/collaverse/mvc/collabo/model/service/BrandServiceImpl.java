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

	@Override
	public List<Brand> selectBrandC() {
		return mapper.selectBrandC();
	}

	@Override
	public List<Brand> selectBrandD() {
		return mapper.selectBrandD();
	}

	@Override
	public List<Brand> selectBrandE() {
		return mapper.selectBrandE();
	}

	@Override
	public List<Brand> selectBrandK() {
		return mapper.selectBrandK();
	}

	@Override
	public List<Brand> selectBrandL() {
		return mapper.selectBrandL();
	}

	@Override
	public List<Brand> selectBrandM() {
		return mapper.selectBrandM();
	}

	@Override
	public List<Brand> selectBrandN() {
		return mapper.selectBrandN();
	}

	@Override
	public List<Brand> selectBrandP() {
		return mapper.selectBrandP();
	}

	@Override
	public List<Brand> selectBrandS() {
		return mapper.selectBrandS();
	}

	@Override
	public List<Brand> selectBrandT() {
		return mapper.selectBrandT();
	}

	@Override
	public List<Brand> selectBrandW() {
		return mapper.selectBrandW();
	}

	@Override
	public List<Brand> selectBrandY() {
		return mapper.selectBrandY();
	}

}
