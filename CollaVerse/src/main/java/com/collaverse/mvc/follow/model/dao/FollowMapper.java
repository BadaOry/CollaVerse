package com.collaverse.mvc.follow.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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


	// ▼ FOLLOWER 테이블에 새로운 컬럼 삽입 + FOLLOWERCHEK 1로 변경
	void insertFollower(@Param("toMemNo") int toMemNo,@Param("fromMemNo") int fromMemNo);


	// ▼ FOLLOWING 테이블에 새로운 컬럼 삽입 + FOLLOWINGCHEK 1로 변경
	void insertFollowing(@Param("fromMemNo") int fromMemNo,@Param("toMemNo") int toMemNo);

	
	// ▼ FOLLOWER 테이블에 컬럼 삭제 + FOLLOWERCHEK 0로 변경
	void deleteFollower(@Param("toMemNo") int toMemNo,@Param("fromMemNo") int fromMemNo);
	
	
	// ▼ FOLLOWING 테이블에 컬럼 삭제 + FOLLOWINGCHEK 0로 변경
	void deleteFollowing(@Param("fromMemNo") int fromMemNo,@Param("toMemNo") int toMemNo);
	


}
