package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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

}
