package com.collaverse.mvc.follow.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.collaverse.mvc.follow.model.vo.Follower;

public interface FollowService {

	// ▼ Follower 리스트 조회
	List<Map<String, String>> getFollowerList(int toMemNo);

	
	// ▼ Follower 카운트 조회
	int countFollower(int toMemNo);
	
	
	// ▼ Following 리스트 조회
	List<Map<String, String>> getFollowingList(int fromMemNo);

	
	// ▼ Following 카운트 조회
	int countFollowing(int fromMemNo);

	// 금일 팔로우 수
	int getTodayCount(@Param("memberNo") int memberNo);
	
	// 작일 팔로우 수
	int getYesterdayCount(@Param("memberNo") int memberNo);
	
	// 금주 팔로우 토탈 수
	int getThisweekCount(@Param("memberNo") int memberNo);
	
	// 지난주 팔로우 토탈 수
	int getLastweekCount(@Param("memberNo") int memberNo);
	
	// 이번달 팔로우 토탈 수
	int getThismonthCount(@Param("memberNo") int memberNo);
	
	// 지난달 팔로우 토탈 수
	int getLastmonthCount(@Param("memberNo") int memberNo);

}
