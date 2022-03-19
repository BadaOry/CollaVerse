package com.collaverse.mvc.member.model.service;

import org.apache.ibatis.annotations.Param;

import com.collaverse.mvc.member.model.vo.Member;

public interface MemberService {
	
	// 로그인
	Member login(String id, String password);

	// 개인 회원가입
	int save(Member member);

	Member findMemberById(String id);
	
	// 기업 회원가입
	int savebusiness(Member member);
	
	// 아이디 중복확인
	Boolean isDuplicateID(String userId);

	// 회원탈퇴
	int delete(int no);
	
	// id 찾기
	Member findId(String email);
	
	Member findIdResult(String email);
	
	// pw 찾기
	Member findPw(String id);

	Member findPwResult(String id);
	
	// 사업자등록번호 중복확인
	Boolean isDuplicatedBusiness_no(String business_no);

	// 닉네임 중복확인
	Boolean isDuplicateNickname(String nickname);
	
	// 통계용 여 회원정보
	int getWomenCount(int memberNo);
	
	// 통계용 남 회원정보
	int getMenCount(int memberNo);
	
	// 통계용 10대 정보
	int getTeenagerCount(@Param("memberNo") int memberNo); 
	
	// 통계용 20대 정보
	int getTwentiesCount(@Param("memberNo") int memberNo); 
	
	// 통계용 30대 정보
	int getThirtiesCount(@Param("memberNo") int memberNo); 
	
	// 통계용 40대 정보
	int getFortiesCount(@Param("memberNo") int memberNo); 
	
	// 통계용 50대 정보
	int getFiftiesCount(@Param("memberNo") int memberNo); 
	
	// 통계용 그 외 나이 정보
	int getEtcCount(@Param("memberNo") int memberNo); 
	
	// 통계용 토탈 합 정보
	int getTotalCount(@Param("memberNo") int memberNo);
	
	// 1일 전 팔로우
	int getYesterday1Count(@Param("memberNo") int memberNo);
	
	// 2일 전 팔로우
	int getYesterday2Count(@Param("memberNo") int memberNo); 
	
	// 3일 전 팔로우
	int getYesterday3Count(@Param("memberNo") int memberNo); 
	
	// 4일 전 팔로우
	int getYesterday4Count(@Param("memberNo") int memberNo); 
	
	// 5일 전 팔로우
	int getYesterday5Count(@Param("memberNo") int memberNo); 
	
	// 6일 전 팔로우
	int getYesterday6Count(@Param("memberNo") int memberNo); 
	
	// 7일 전 팔로우
	int getYesterday7Count(@Param("memberNo") int memberNo); 

	// 비밀번호변경(작성중)
	Object findMemberByPw(String string);

}