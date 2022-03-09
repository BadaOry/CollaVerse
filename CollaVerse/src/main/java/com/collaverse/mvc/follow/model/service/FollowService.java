package com.collaverse.mvc.follow.model.service;

import java.util.List;
import java.util.Map;

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


}
