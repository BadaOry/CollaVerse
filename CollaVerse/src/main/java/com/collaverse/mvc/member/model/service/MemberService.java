package com.collaverse.mvc.member.model.service;

import com.collaverse.mvc.member.model.vo.Member;

public interface MemberService {
	
	//로그인
	Member login(String id, String password);

	//회원가입
	int save(Member member);

	Member findMemberById(String id);

	// 아이디 중복확인
	Boolean isDuplicateID(String userId);

	// 회원탈퇴
	int delete(int no);


}