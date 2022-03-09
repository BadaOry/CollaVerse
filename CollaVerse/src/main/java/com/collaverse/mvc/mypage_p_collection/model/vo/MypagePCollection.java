package com.collaverse.mvc.mypage_p_collection.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
public class MypagePCollection {

	private int cltNo;
	
	private int cltNo2;
	
	private int cltMemberNo;
	
	private String cltContent;
	
	private Date cltCreateDate;
	
	private Date cltModifyDate;
	
	private String cltStatus;
	
	private List<Map<String, String>> files;
	
	private String OriginalFileName01;
	
	private String OriginalFileName02;
	
	private String OriginalFileName03;
	
	private String OriginalFileName04;
	
	private String OriginalFileName05;
	
	private String OriginalFileName06;

	private String RenamedFileName01;
	
	private String RenamedFileName02;
	
	private String RenamedFileName03;
	
	private String RenamedFileName04;
	
	private String RenamedFileName05;
	
	private String RenamedFileName06;
	
	private String cltWriterId;
	
	public MypagePCollection() {
		this.files = new ArrayList<Map<String,String>>();
	}

}
