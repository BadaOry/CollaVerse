package com.collaverse.mvc.collabo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Brand {
	// MEMBER 테이블 참조
	private int brMemberNo;
	
	private String brName;
	
	private String brContent;
	
	private String brImgPath;
	
	// PROMOTION 테이블 참조
	private int brPmtNo;
	
}
