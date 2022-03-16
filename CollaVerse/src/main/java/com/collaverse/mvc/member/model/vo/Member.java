package com.collaverse.mvc.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private int no;
	
	private String role;
	
	private String id;
	
	private String password;
	
	private String email;
	
	private String phone;
	
	private String nickname;
	
	private String profile_img;
	
	private String business_no;
	
	private String business_name;
	
	private Date enrollDate;
	
	private Date modifyDate;
	
	private String status;
	
	private int age;
	
	private String gender;
	
	private String profile_basic;

	public Member(String id, String password) {
		this.id = id;
		this.password = password;
	}

}
