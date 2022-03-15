package com.collaverse.mvc.follow.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Follower {

	private int followerNo;
	
	private int toMemNo;
	
	private String toMemNick;
	
	private String toMemId;
	
	private int fromMemNo;
	
	private String fromMemNick;
	
	private Date followerCreateDate;
	
	private int followerCheck;
	
	private String profileImg;
	
}
