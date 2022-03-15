package com.collaverse.mvc.follow.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Following {

	private int followingNo;
	
	private int fromMemNo;

	private String fromMemNick;
	
	private int toMemNo;
	
	private String toMemNick;
	
	private String toMemId;
	
	private Date followingCreateDate;
	
	private int followerCheck;
	
	private String profileImg;
	
}
