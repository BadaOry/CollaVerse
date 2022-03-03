package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.collabo.model.dao.CollaboMapper;
import com.collaverse.mvc.collabo.model.vo.Promotion;
import com.collaverse.mvc.common.util.PageInfo;

@Service
public class PromotionServiceImpl implements PromotionService {
	@Autowired
	private CollaboMapper mapper;

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

		return null;
	}
	*/

	
/*	@Override
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

}
