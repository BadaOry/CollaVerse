package com.collaverse.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {

	private int no;
	
	private int rowNum;
	
	private String writer;
	
	private String title;
	
	private String content;
	
	private int readCount;
	
	private Date createDate;
	
	private Date modifyDate;
}
