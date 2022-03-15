package com.collaverse.mvc.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.collaverse.mvc.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	Member findMemberById(@Param("id") String id); // 로그인

	int insertMember(Member member); // 개인 회원가입
	
	int updateMember(Member member); // 개인 회원정보수정
	
	int updateMember_business(Member member); // 사업자 회원정보수정

	int deleteMember(int no); // 회원탈퇴
	
	Member findId(@Param("email") String email); // id 찾기
	
	Member findPw(@Param("id") String id); // pw 찾기

	Object findMemberByBusiness_no(String business_no); // 사업자등록번호 중복확인
	
	Object findMemberByNickname(String nickname); // 닉네임 중복확인
	
	int getWomenCount(@Param("memberNo") int memberNo); // 통계용 여 회원정보
	
	int getMenCount(@Param("memberNo") int memberNo); // 통계용 남 회원정보
	
	int getTeenagerCount(@Param("memberNo") int memberNo); // 통계용 10대 정보
	
	int getTwentiesCount(@Param("memberNo") int memberNo); // 통계용 20대 정보
	
	int getThirtiesCount(@Param("memberNo") int memberNo); // 통계용 30대 정보
	
	int getFortiesCount(@Param("memberNo") int memberNo); // 통계용 40대 정보
	
	int getFiftiesCount(@Param("memberNo") int memberNo); // 통계용 50대 정보
	
	int getEtcCount(@Param("memberNo") int memberNo); // 통계용 그 외 나이 정보
	
	int getTotalCount(@Param("memberNo") int memberNo); // 통계용 토탈 합 정보
		
	int updateBusinessMember(Member member); // 기업 회원가입???
	
	int insertBusinessMember(Member member); // 기업 회원가입

	
	
}