package com.collaverse.mvc.follow.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.follow.model.dao.FollowMapper;
import com.collaverse.mvc.follow.model.service.FollowService;
import com.collaverse.mvc.follow.model.vo.Follower;
import com.collaverse.mvc.member.model.vo.Member;
import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@ResponseBody
public class FollowController {

	@Autowired
	private FollowService service;
	
	@Autowired
	private FollowMapper mapper;
	
	@GetMapping("mypage/myFollow/main") 
	public ModelAndView followMain(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember) {
	
		this.follow_follower(model, loginMember);
		this.follow_following(model, loginMember);
		
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
	
	
	@PostMapping("mypage/follow/updateFollow") 
	public int updateFollow(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam("from_mem_no") int fromMemNo,
			@RequestParam("to_mem_no") int toMemNo,
			@RequestParam("followerCheck") int followerCheck,
			@RequestParam("followingCheck") int followingCheck) {
			
			log.info("ajax 로 팔로우 요청에 성공하여 Controller 에 도착");
			log.info("[Controller] 요청으로 넘어온 파라미터 출력 : from {} ▶ to {}", fromMemNo, toMemNo);
			log.info("[Controller] 요청으로 넘어온 파라미터 출력 : followerCheck [{}] ▶ followingCheck [{}]", followerCheck, followingCheck);
			
			int followCheck = 0;
			
			if((followerCheck == 0) && (followingCheck == 0)) {
				// 팔로우를 처음 누름
				mapper.insertFollower(toMemNo, fromMemNo); // FOLLOWER 테이블에 삽입
				mapper.insertFollowing(fromMemNo, toMemNo); // FOLLOWING 테이블에 삽입
				
				followCheck = 0;

			} else if((followerCheck == 1) && (followingCheck == 1)) {
				// 팔로우를 취소하는 구문
				mapper.deleteFollower(toMemNo, fromMemNo);	// FOLLWER 테이블의 삭제 
				mapper.deleteFollowing(fromMemNo, toMemNo); // FOLLOWING 테이블에 삭제 
				
				followCheck = 1;
			} else {
				
				log.info("followCheck 에러 ! : 둘 중 하나라도 값이 일치하지 않는 경우 출력");
			}
		
		return followCheck;
	}
}
