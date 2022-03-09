package com.collaverse.mvc.collabo.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.collaverse.mvc.collabo.model.vo.Heart;
import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;

@Mapper
public interface CollaboMapper {

//	List<Promotion> pmtMainList(); 

	List<Promotion> selectAll();

	// ▼ 프로모션 번호로 Promotion 정보 조회하는 메소드 (by Crystal)
	Promotion getPromotionInfo(int pmtNo);

	// ▼ 프로모션 번호로 Product 정보 조회하는 메소드 (by Crystal, failed)
	List<Product> getProductInfo(int pmtNo);

	int heartCheck(@Param("pmt_no") int pmtNo, @Param("heart_mem_no") int heartMemNo);

	List<Promotion> selectLiving();

	List<Promotion> selectCulture();

	List<Promotion> selectFood();

	List<Promotion> selectTech();

	List<Promotion> selectFashion();

	// 하트 관련 매퍼
	void insertHeart(@Param("pmt_no") int pmtNo, @Param("heart_mem_no") int heartMemNo);

	void addHeartHit(@Param("pmt_no") int pmtNo);

	void updateHeartCheck(@Param("pmt_no") int pmtNo, @Param("heart_mem_no") int heartMemNo);

	void updateHeartCheckCancel(@Param("pmt_no") int pmtNo, @Param("heart_mem_no") int heartMemNo);

	void minusHeartHit(@Param("pmt_no") int pmtNo);

	void deleteHeart(@Param("pmt_no") int pmtNo, @Param("heart_mem_no") int heartMemNo);


//	Promotion selectAll();

//	int getPromotionCount();

//	List<Promotion> selectAll(RowBounds rowBounds);

//	Promotion selectPromotionByNo(@Param("no") int no);

}
