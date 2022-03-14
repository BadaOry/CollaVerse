package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.collaverse.mvc.collabo.model.dao.CollaboMapper;
import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;
import com.collaverse.mvc.collabo.model.vo.WritePromotion;
import com.collaverse.mvc.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PromotionServiceImpl implements PromotionService {
	@Autowired
	private CollaboMapper mapper;

	/*
	@Override
	public List<Promotion> pmtMainList() {
		
		return mapper.pmtMainList();
	}
	*/


	@Override
	public List<Promotion> selectAll() {
		
		return mapper.selectAll();
	}


	/*
	@Override
	public Promotion selectAll() {
		
		return mapper.selectAll();
	}
	*/

/*
	@Override
	public int getPromotionCount() {

		return mapper.getPromotionCount();
	}

	@Override
	public List<Promotion> getPromotionList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return mapper.selectAll(rowBounds);
	}
*/
	
/*
	@Override
	public Promotion findPromotionByNo(int no) {
		
		return mapper.selectPromotionByNo(no);
	}
*/
	
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


//	@Override
//	@Transactional
//	public int promotionsave(WritePromotion writepromotion) {
//		int result = 0;
//		
//		if (writepromotion.getRenamedFileName() != null) {
//			// update
//		} else {
//			// insert
//			result = mapper.insertPromotion(writepromotion);
//		}
//		
//		return result;
//	}


	// [ Promotion 에 save 하는 메소드 ]
	@Override
	public int promotionSave(Promotion promotionVo) {

		log.info("[ServiceImpl] vo 객체가 잘 전달되었는지 확인 : {}", promotionVo);
		
		return mapper.promotionSave(promotionVo);
	}

}
