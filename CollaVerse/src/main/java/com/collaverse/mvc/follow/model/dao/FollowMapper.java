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



}
