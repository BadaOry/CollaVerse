package com.collaverse.mvc.collabo.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Promotion {
	private int no;
	
	private String title;
	
	private String imgPath;
	
	private String content;
	
	private String status;
	
//	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date startDate;
	
//	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date endDate;
	
	private int readCount;
	
	// CATEGORY 테이블 참조
	private String cNo;
	
	
	// ▼ 하트 수 표시용 변수
	private int heartHit;

	
	private String originalFileName;
	
	private String renamedFileName;
	
	
}
