package com.collaverse.mvc.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private int memberNo;
	
	private String memberRole;
	
	private String id;
	
	private String password;
	
	private String email;
	
	private String phone;
	
	private String nickname;
	
	private String profileImg;
	
	private String businessNo;
	
	private String businessName;
	
	private Date enrollDate;
	
	private Date modifyDate;
	
	private String memberStatus;
	
	private int memberAge;
	
	private String memberGender;

	public Member(String id, String password) {
		this.id = id;
		this.password = password;
	}

}
