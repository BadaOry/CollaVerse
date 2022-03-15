package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;
import com.collaverse.mvc.collabo.model.vo.WritePromotion;
import com.collaverse.mvc.common.util.PageInfo;

public interface PromotionService {

	List<Promotion> selectAll();

	// ▼ 프로모션 번호로 Promotion 정보 조회하는 메소드 (by Crystal)
	Promotion getPromotionInfo(int pmtNo);

	// ▼ 프로모션 번호로 Product 정보 조회하는 메소드 (by Crystal)
	List<Product> getProductInfo(int pmtNo);

	int heartCheck(int pmtNo, int heartMemNo);

//	int promotionsave(WritePromotion writepromotion);

	int promotionSave(Promotion promotionVo);

	int productSave(Product productVo);

//	List<Promotion> pmtMainList();

//	Promotion selectAll();

/* int getPromotionCount();

	List<Promotion> getPromotionList(PageInfo pageInfo);
*/


//	Promotion findPromotionByNo(String no);

//	Promotion findPromotionByNo(int no);
	
//	int save(Promotion promotion);

}
