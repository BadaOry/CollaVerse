package com.collaverse.mvc.follow.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.follow.model.dao.FollowMapper;
import com.collaverse.mvc.follow.model.vo.Follower;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FollowServiceImpl implements FollowService {
	
	@Autowired
	private FollowMapper mapper;
	
	
	// ▼ Follower 리스트 조회
	@Override
	public List<Map<String, String>> getFollowerList(int toMemNo) {
		
//		log.info("[ServiceImpl] toMemNo 잘 가져왔는지 확인 : {}", toMemNo);
		
		return mapper.getFollowerList(toMemNo);
	}

	
	// ▼ Follower 카운트 조회
	@Override
	public int countFollower(int toMemNo) {
		
//		log.info("[ServiceImpl] toMemNo 잘 가져왔는지 확인 : {}", toMemNo);
		
		return mapper.countFollower(toMemNo);
	}
	
	
	// ▼ Following 리스트 조회
	@Override
	public List<Map<String, String>> getFollowingList(int fromMemNo) {
		
//		log.info("[ServiceImpl] fromMemNo 잘 가져왔는지 확인 : {}", fromMemNo);
		
		return mapper.getFollowingList(fromMemNo);
	}


	// ▼ Following 카운트 조회
	@Override
	public int countFollowing(int fromMemNo) {
	
//		log.info("[ServiceImpl] fromMemNo 잘 가져왔는지 확인 : {}", fromMemNo);
		
		return mapper.countFollowing(fromMemNo);
	}

	// 금일 팔로우 수
	@Override
	public int getTodayCount(int memberNo) {
		
		return mapper.getTodayCount(memberNo);
	}
	
	// 작일 팔로우 수
	@Override
	public int getYesterdayCount(int memberNo) {
		
		return mapper.getYesterdayCount(memberNo);
	}
	
	// 금주 팔로우 토탈 수
	@Override
	public int getThisweekCount(int memberNo) {
		
		return mapper.getThisweekCount(memberNo);
	}
	
	// 금주 팔로우 토탈 수
	@Override
	public int getLastweekCount(int memberNo) {
		
		return mapper.getLastweekCount(memberNo);
	}
	
	// 이번달 팔로우 토탈 수
	@Override
	public int getThismonthCount(int memberNo) {
		
		return mapper.getThismonthCount(memberNo);
	}
	
	// 지난달 팔로우 토탈 수
	@Override
	public int getLastmonthCount(int memberNo) {
		
		return mapper.getLastmonthCount(memberNo);
	}

}
