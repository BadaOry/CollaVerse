package com.collaverse.mvc.follow.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.collaverse.mvc.follow.model.vo.Follower;

@Mapper
public interface FollowMapper {

	// ▼ Follower 리스트 조회
	List<Map<String, String>> getFollowerList(int toMemNo);

	
	// ▼ Follower 카운트 조회
	int countFollower(int toMemNo);

	
	// ▼ Following 리스트 조회
	List<Map<String, String>> getFollowingList(int fromMemNo);


	// ▼ Following 카운트 조회
	int countFollowing(int fromMemNo);


	// ▼ FOLLOWER 테이블에서 FOLLOWERCHECK 조회
	int followerCheck(int toMemNo, int fromMemNo);

	
	// ▼ FOLLOWING 테이블에서 FOLLOWINGCHECK 조회
	int followingCheck(int fromMemNo, int toMemNo);



}
