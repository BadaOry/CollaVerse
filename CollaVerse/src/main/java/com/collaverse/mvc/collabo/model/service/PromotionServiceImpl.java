package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.collabo.model.dao.CollaboMapper;
import com.collaverse.mvc.collabo.model.vo.Brand;
import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PromotionServiceImpl implements PromotionService {
	@Autowired
	private CollaboMapper mapper;


	@Override
	public List<Promotion> selectAll() {
		
		return mapper.selectAll();
	}
	
	public int save(Promotion promotion) {
		int result = 0;
		
		if(promotion.getNo() != 0) {
			//update
		} else {
			//insert
//			result = mapper.insertpromotion(promotion);
		}
		
		return result;
	}


	// ▼ 프로모션 번호로 프로모션 정보 조회하는 메소드 (by Crystal)
	@Override
	public Promotion getPromotionInfo(int pmtNo) {
		
		return mapper.getPromotionInfo(pmtNo);
	}

	
	// ▼ 프로모션 번호로 Product 정보 조회하는 메소드 (by Crystal)
	@Override
	public List<Product> getProductInfo(int pmtNo) {
		
		log.info("[ServiceImpl] getProductInfo 를 위해 pmtNo 잘 가져오는지 확인 : {}", pmtNo);
		
		return mapper.getProductInfo(pmtNo);
	}


	// ▼ 프로모션 번호로 하트 중복체크하는 메소드 (by Crystal)
	@Override
	public int heartCheck(int pmtNo, int heartMemNo) {
	
		log.info("[ServiceImpl] heartCheck 를 위해 heartMemNo 잘 가져오는지 확인 : {}", heartMemNo);
	
		return mapper.heartCheck(pmtNo, heartMemNo);
	}


	// [ Promotion 에 save 하는 메소드 ]
	@Override
	public int promotionSave(Promotion promotionVo) {

		log.info("[ServiceImpl] vo 객체가 잘 전달되었는지 확인 : {}", promotionVo);
		
		return mapper.promotionSave(promotionVo);
	}
	
	// [ Product 에 save 하는 메소드]
	@Override
	public int productSave1(Product productVo1) {
		
		log.info("[ServiceImpl] vo 객체가 잘 전달되었는지 확인 : {}", productVo1);
		
		return mapper.productSave(productVo1);
		
	}
	
	@Override
	public int productSave2(Product productVo2) {
		
		log.info("[ServiceImpl] vo 객체가 잘 전달되었는지 확인 : {}", productVo2);
		
		return mapper.productSave(productVo2);
		
	}
	
	@Override
	public int productSave3(Product productVo3) {
		
		log.info("[ServiceImpl] vo 객체가 잘 전달되었는지 확인 : {}", productVo3);
		
		return mapper.productSave(productVo3);
		
	}


	@Override
	public int productUpdate1(Product productVo1) {
		return mapper.productUpdate(productVo1);
	}
	@Override
	public int productUpdate2(Product productVo2) {
		return mapper.productUpdate(productVo2);
	}
	@Override
	public int productUpdate3(Product productVo3) {
		return mapper.productUpdate(productVo3);
	}
  

}
