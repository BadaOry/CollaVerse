package com.collaverse.mvc.collabo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int proNo;
	
	private String proName;
	
	private String proPrice;
	
	private String proContent;
	
	private String proQty;
	
	private String proImgpath;
	
	// CATEGORY 테이블 참조
	private String cNo;
	
	// PROMOTION 테이블 참조
	private String pmtNo;
	
	private String originalFileName;
	
	private String renamedFileName;
	
}
