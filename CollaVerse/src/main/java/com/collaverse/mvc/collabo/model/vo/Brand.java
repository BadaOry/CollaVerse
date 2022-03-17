package com.collaverse.mvc.collabo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Brand {
	private int brMemberNo;
	
	private String brName;
	
	private String brContent;
	
	private String brImgPath;
	
	private int brPmtNo;
	
}
