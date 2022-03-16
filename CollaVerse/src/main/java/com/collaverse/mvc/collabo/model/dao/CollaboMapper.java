package com.collaverse.mvc.collabo.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.collaverse.mvc.collabo.model.vo.Brand;
import com.collaverse.mvc.collabo.model.vo.Heart;
import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;
import com.collaverse.mvc.collabo.model.vo.WritePromotion;

@Mapper
public interface CollaboMapper {
	// 프로모션 전체 조회
	List<Promotion> selectAll();

	// ▼ 프로모션 번호로 Promotion 정보 조회하는 메소드 (by Crystal)
	Promotion getPromotionInfo(int pmtNo);

	// ▼ 프로모션 번호로 Product 정보 조회하는 메소드 (by Crystal, failed)
	List<Product> getProductInfo(int pmtNo);

	int heartCheck(@Param("pmt_no") int pmtNo, @Param("heart_mem_no") int heartMemNo);

	// 카테고리별 프로모션 조회 
	List<Promotion> selectLiving();

	List<Promotion> selectCulture();

	List<Promotion> selectFood();

	List<Promotion> selectTech();

	List<Promotion> selectFashion();
	
	// 카테고리별 상품 조회
	List<Product> selectLproduct();

	List<Product> selectCproduct();

	List<Product> selectFproduct();
	
	List<Product> selectTproduct();

	List<Product> selectFsproduct();

	// 하트 관련 매퍼
	void insertHeart(@Param("pmt_no") int pmtNo, @Param("heart_mem_no") int heartMemNo);

	void addHeartHit(@Param("pmt_no") int pmtNo);

	void updateHeartCheck(@Param("pmt_no") int pmtNo, @Param("heart_mem_no") int heartMemNo);

	void updateHeartCheckCancel(@Param("pmt_no") int pmtNo, @Param("heart_mem_no") int heartMemNo);

	void minusHeartHit(@Param("pmt_no") int pmtNo);

	void deleteHeart(@Param("pmt_no") int pmtNo, @Param("heart_mem_no") int heartMemNo);
	

//	int insertPromotion(WritePromotion writepromotion);

	// Promotion 테이블에 insert 돌릴 메소드 
	int promotionSave(Promotion promotionVo);

	// 브랜드 조회 

	List<Brand> selectBrandIntro();

	List<Brand> selectBrandIntro(int pmtNo);

	List<Brand> selectBrand();

	// 브랜드 정렬 관련 매퍼 
	List<Brand> selectBrandB();

	List<Brand> selectBrandC();
	
	List<Brand> selectBrandD();
	
	List<Brand> selectBrandE();
	
	List<Brand> selectBrandK();
	
	List<Brand> selectBrandL();
	
	List<Brand> selectBrandM();
	
	List<Brand> selectBrandN();
	
	List<Brand> selectBrandP();
	
	List<Brand> selectBrandS();
	
	List<Brand> selectBrandT();
	
	List<Brand> selectBrandW();

	List<Brand> selectBrandY();

}
