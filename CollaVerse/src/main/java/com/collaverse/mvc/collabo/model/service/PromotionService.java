package com.collaverse.mvc.collabo.model.service;

import java.util.List;

import com.collaverse.mvc.collabo.model.vo.Brand;
import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;

public interface PromotionService {

	List<Promotion> selectAll();

	// ▼ 프로모션 번호로 Promotion 정보 조회하는 메소드 (by Crystal)
	Promotion getPromotionInfo(int pmtNo);

	// ▼ 프로모션 번호로 Product 정보 조회하는 메소드 (by Crystal)
	List<Product> getProductInfo(int pmtNo);

	int heartCheck(int pmtNo, int heartMemNo);

	int promotionSave(Promotion promotionVo);

	int productSave1(Product productVo1);
	int productSave2(Product productVo2);
	int productSave3(Product productVo3);

	int productUpdate1(Product productVo1);
	int productUpdate2(Product productVo2);
	int productUpdate3(Product productVo3);
	
	List<Brand> selectBrandIntro();

	List<Brand> selectBrandIntro(int pmtNo);





//	List<Promotion> pmtMainList();

//	Promotion selectAll();

/* int getPromotionCount();

	List<Promotion> getPromotionList(PageInfo pageInfo);
*/


//	Promotion findPromotionByNo(String no);

//	Promotion findPromotionByNo(int no);
	
//	int save(Promotion promotion);

}
