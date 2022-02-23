package com.collaverse.mvc.mypage_p_collection.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CollectionTO {
	
	private String no;
	private String subject;
	private String content;
	private String writer;
	private String wdate;
	
	private String profile;
	private String nick;
	
	private int startRowNum;
	private int endRowNum;
	private int rowCount;

	public void setStartRowNum(int startRowNum) {
		// TODO Auto-generated method stub
		
	}

	public void setEndRowNum(int endRowNum) {
		// TODO Auto-generated method stub
		
	}

	public void setRowCount(int rowCount) {
		// TODO Auto-generated method stub
		
	}

}
