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
	
	// 외래키 (Category 참조)
	private String cNo;
	
	private String pmtNo;
	
	private String originalFileName;
	
	private String renamedFileName;
	
}
