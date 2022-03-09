package com.collaverse.mvc.follow.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.follow.model.service.FollowService;
import com.collaverse.mvc.follow.model.vo.Follower;
import com.collaverse.mvc.member.model.vo.Member;
import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FollowController {

	@Autowired
	private FollowService service;
	
	@GetMapping("mypage/myFollow/main") 
	public ModelAndView followMain(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember) {
	
		model.setViewName("/mypage/myFollow/main");
		
		return model;
	}
	
	
	// 팔로워 조회
	@GetMapping("mypage/myFollow/follower") 
	public ModelAndView follow_follower(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember) {
	
		List<Map<String,String>> followerList = null;
		int followerCount = 0;
		int toMemNo = loginMember.getNo();
		
		// 1. Follower 리스트 조회
		followerList = service.getFollowerList(toMemNo);
		
		log.info("[Controller] service 가 가져온 followerList 출력 : {}", followerList);
		
		// 2. Follower 총 수 조회
		followerCount = service.countFollower(toMemNo);
		
		log.info("[Controller] service 가 가져온 followerCount 출력 : {}", followerCount);
		
		
		model.addObject("followerList", followerList);		
		model.addObject("followerCount", followerCount);		
		model.setViewName("/mypage/myFollow/follower");
		
		return model;
	}
	
	
	
	@GetMapping("mypage/myFollow/following") 
	public ModelAndView follow_following(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember) {

		List<Map<String,String>> followingList = null;
		int followingCount = 0;
		int fromMemNo = loginMember.getNo();
		
		// 1. Following 리스트 조회
		followingList = service.getFollowingList(fromMemNo);
		
		log.info("[Controller] service 가 가져온 followingList 출력 : {}", followingList);
		
		// 2. Following 총 수 조회
		followingCount = service.countFollowing(fromMemNo);
		
		log.info("[Controller] service 가 가져온 followingCount 출력 : {}", followingCount);
		
		
		
		model.addObject("followingList", followingList);	
		model.addObject("followingCount", followingCount);	
		model.setViewName("/mypage/myFollow/following");
		
		return model;
	}
	
	
	@GetMapping("mypage/follow/updateFollow") 
	public int updateFollow(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam("from_mem_no") int fromMemNo,
			@RequestParam("to_mem_no") int toMemNo) {
			
//			log.info("ajax 로 팔로우 요청에 성공하여 Controller 에 도착");
//			log.info("[Controller] 요청으로 넘어온 파라미터 출력 : from {} ▶ to {}", fromMemNo, toMemNo);
//			
//			int FollowerHeartCheck = service.followerCheck(toMemNo, fromMemNo);
//			int FollowingHeartCheck = service.followingCheck(fromMemNo, toMemNo);
//			
//			log.info("[Controller] followCheck : {} ▶ {}", FollowerHeartCheck, FollowingHeartCheck);
//			
//			if(heartCheck == 0) {
//				// 하트를 처음 누름
//				mapper.insertHeart(pmtNo, heartMemNo); // HEART 테이블에 삽입
//				mapper.addHeartHit(pmtNo);	// PROMOTION 테이블의 HEART_HIT +1
//				mapper.updateHeartCheck(pmtNo, heartMemNo); // HEART 테이블의 HEARTCHECK 를 1 으로 변경	
//
//			} else if (heartCheck == 1) {
//				// 하트를 빼는 구문
//				mapper.updateHeartCheckCancel(pmtNo, heartMemNo); // HEART 테이블의 HEARTCHECK 를 0 으로 변경		
//				mapper.minusHeartHit(pmtNo);	// PROMOTION 테이블의 HEART_HIT -1
//				mapper.deleteHeart(pmtNo, heartMemNo); // Heart 컬럼 한 개 삭제
//			}
//		
//		return followCheck;
		return 0;
	}
}
