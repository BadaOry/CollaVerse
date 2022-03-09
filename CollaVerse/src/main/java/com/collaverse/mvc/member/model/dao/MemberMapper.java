package com.collaverse.mvc.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.collaverse.mvc.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	Member findMemberById(@Param("id") String id); //로그인

	int insertMember(Member member); //회원가입
	
	int updateMember(Member member); //회원정보수정
	
	int updateMember_business(Member member); //사업자 회원정보수정

	int deleteMember(int no); //회원탈퇴
	
	Member findId(@Param("email") String email); //id 찾기
	
	Member findPw(@Param("id") String id, String email); //pw 찾기

	Object findMemberByBusiness_no(String business_no); //사업자등록번호 중복확인
	
	int getWomenCount(); // 통계용 여 회원정보(테스트중)
	
	int getMenCount(); // 통계용 남 회원정보(테스트중)
	
	

	
}