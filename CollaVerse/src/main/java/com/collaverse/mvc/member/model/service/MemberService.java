package com.collaverse.mvc.member.model.service;

import com.collaverse.mvc.member.model.vo.Member;

public interface MemberService {
	
	Member login(String id, String password);

	int save(Member member);

}