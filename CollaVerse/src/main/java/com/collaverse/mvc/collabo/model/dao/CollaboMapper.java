package com.collaverse.mvc.collabo.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;

@Mapper
public interface CollaboMapper {

//	List<Promotion> pmtMainList(); 

	List<Promotion> selectAll();

	// ▼ 프로모션 번호로 프로모션 정보 조회하는 메소드 (by Crystal)
	Promotion getPromotionInfo(int pmtNo);

	List<Product> getProductInfo(int pmtNo);

	int heartCheck(int pmtNo, int heartMemNo);

//	Promotion selectAll();

//	int getPromotionCount();

//	List<Promotion> selectAll(RowBounds rowBounds);

//	Promotion selectPromotionByNo(@Param("no") int no);

}
