package com.collaverse.mvc.collections.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.collaverse.mvc.collections.model.vo.Collections;
import com.collaverse.mvc.member.model.vo.Member;

@Mapper
public interface CollectionsMapper {

	// 모든 유저 리스트 
	
	List<Collections> getAllUserIdList();

	List<Collections> findUserById(String keyword);

	List<Collections> findUserByNickname(String keyword);
	
	
	// 브랜드에서만 검색하는 /search/only_brand 관련 메소드
	
	List<Collections> getBrandUserIdList();
	
	List<Collections> findBrandUserById(String keyword);

	List<Collections> findBrandUserByNickname(String keyword);
	
	
	// 유저에서만 검색하는 /search/only_user 관련 메소드
	
	List<Collections> getOnlyUserIdList();
	
	List<Collections> findOnlyUserById(String keyword);
	
	List<Collections> findOnlyUserByNickname(String keyword);

	List<Collections> getRandomUserList(); // home.jsp 랜덤 유저 받아오기
	
	

//	// 팔로워 많은 순대로 가져오는 getUserListByFollower 메소드에 연결될 Mapper
//	
//	List<Collections> getUserListByFollower();
//	
//	List<Collections> getUserListByFollowerResult(@Param("userListByFollowerId") ArrayList<String> userListByFollowerId);

	

}
