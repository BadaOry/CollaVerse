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
	
	// id 찾기
	Member findId(String email);
	
	Member findIdResult(String email);
	
	// pw 찾기
	Member findPw(String id, String email);

	Member findPwResult(String email, String id);
	
	// 사업자등록번호 중복확인
	Boolean isDuplicatedBusiness_no(String business_no);

	// 통계용 여 회원정보(테스트중)
	int getWomenCount();
	
	// 통계용 남 회원정보(테스트중)
	int getMenCount();

	


}