package com.collaverse.mvc.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.collaverse.mvc.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	Member findMemberById(@Param("id") String id); //로그인

	int insertMember(Member member); //회원가입
	
	int updateMember(Member member); //회원정보수정
	
	int updateMember_business(Member member); //사업자회원정보수정

	int deleteMember(int no); //회원탈퇴
	
}