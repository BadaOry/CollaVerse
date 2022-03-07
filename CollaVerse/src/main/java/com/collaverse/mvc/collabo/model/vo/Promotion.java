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
	
	private Date startDate;
	
	private Date endDate;
	
	private int readCount;
	
	// 외래키 (Category 참조)
	private String cNo;
	
	
	// ▼ 하트 수 표시용 변수
	private int heartHit;
	
	
}
