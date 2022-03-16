package com.collaverse.mvc.mypage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.follow.controller.FollowController;
import com.collaverse.mvc.follow.model.service.FollowService;
import com.collaverse.mvc.member.model.service.MemberService;
import com.collaverse.mvc.member.model.vo.Member;
import com.collaverse.mvc.mypage_p_collection.model.service.MypagePCollectionService;
import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;
import com.collaverse.mvc.schedule.model.ScheduleVO;
import com.collaverse.mvc.schedule.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class mypageController {

	@Autowired
	private ScheduleService service;
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private FollowService fservice;
	
	@Autowired
	private MypagePCollectionService cservice;
	
	@GetMapping("/mypage/personMypage")
	public ModelAndView person(ModelAndView model, Model models,
			@SessionAttribute("loginMember") Member loginMember) {

		// 일정 보이기
		List<ScheduleVO> showSchedule = null;
		
		int memberNo = loginMember.getNo();
		log.info("no : {}", memberNo);
		
		showSchedule = service.showSchedule(memberNo);
		
		models.addAttribute("showSchedule" , showSchedule);
		
		// [ 팔로우 가져오기 ]
		List<Map<String,String>> followingList = null;
		int followingCount = 0;
		int fromMemNo = loginMember.getNo();
		
		// 1. Following 리스트 조회
		followingList = fservice.getFollowingList(fromMemNo);
		
		log.info("[Controller] service 가 가져온 followingList 출력 : {}", followingList);
		
		// 2. Following 총 수 조회
		followingCount = fservice.countFollowing(fromMemNo);
		
		log.info("[Controller] service 가 가져온 followingCount 출력 : {}", followingCount);
		
		model.addObject("followingList", followingList);	
		model.addObject("followingCount", followingCount);		
		
		
		
		// [ 컬렉션 가져오기 ]
		List<MypagePCollection> collectionList = null;
		String noCollectionList = null;
		String noWriterId = null;
		String writerNickname = null;
		int writerNo = 0;
		String id = loginMember.getId();
		fromMemNo = 0;

		
		
		writerNo = cservice.getCollectionWriterNo(id);
		int toMemNo = writerNo;
		
		writerNickname = cservice.getCollectionWriterNickname(id);
		
		log.info("[Controller] service 가 가져온 writerNickname 출력 : {}", writerNickname);

		collectionList = cservice.getCollectionList(id);
		
		// list 에 아무것도 없는 경우, IndexOutOfBoundsException: Index 0 out of bounds for length 0 에러 방지
		if (collectionList.size() == 0) { 
			noCollectionList = "없음";
			noWriterId = id;
			
			log.info("[Controller] noCollectionList 출력 : {}", noCollectionList);
		}
		
	
		model.addObject("collectionList", collectionList);
		model.addObject("noCollectionList", noCollectionList);
		model.addObject("noWriterId", noWriterId);
		model.addObject("writerNickname", writerNickname);
		model.addObject("writerNo", writerNo);
		
		model.setViewName("mypage/personMypage");
		
		return model;
	}
	
	
	@GetMapping("/mypage/businessMypage")
	public ModelAndView business(ModelAndView model, Model models,
			@SessionAttribute("loginMember") Member loginMember) {
		
		// 일정 보이기
		List<ScheduleVO> showSchedule = null;
		
		int memberNo = loginMember.getNo();
		log.info("no : {}", memberNo);
		
		showSchedule = service.showSchedule(memberNo);
		
		models.addAttribute("showSchedule" , showSchedule);
		
		// [ 팔로워 가져오기 ]
		List<Map<String,String>> followerList = null;
		int followerCount = 0;
		int toMemNo = loginMember.getNo();
		
		// 1. Follower 리스트 조회
		followerList = fservice.getFollowerList(toMemNo);
		
		log.info("[Controller] service 가 가져온 followerList 출력 : {}", followerList);
		
		// 2. Follower 총 수 조회
		followerCount = fservice.countFollower(toMemNo);
		
		log.info("[Controller] service 가 가져온 followerCount 출력 : {}", followerCount);
		
		
		model.addObject("followerList", followerList);		
		model.addObject("followerCount", followerCount);
		
		// [ 컬렉션 가져오기 ]
		List<MypagePCollection> collectionList = null;
		String noCollectionList = null;
		String noWriterId = null;
		String writerNickname = null;
		int writerNo = 0;
		String id = loginMember.getId();
		toMemNo = 0;

		
		
		writerNo = cservice.getCollectionWriterNo(id);
		
		int fromMemNo = writerNo;
		
		writerNickname = cservice.getCollectionWriterNickname(id);
		
		log.info("[Controller] service 가 가져온 writerNickname 출력 : {}", writerNickname);

		collectionList = cservice.getCollectionList(id);
		
		// list 에 아무것도 없는 경우, IndexOutOfBoundsException: Index 0 out of bounds for length 0 에러 방지
		if (collectionList.size() == 0) { 
			noCollectionList = "없음";
			noWriterId = id;
			
			log.info("[Controller] noCollectionList 출력 : {}", noCollectionList);
		}
		
	
		model.addObject("collectionList", collectionList);
		model.addObject("noCollectionList", noCollectionList);
		model.addObject("noWriterId", noWriterId);
		model.addObject("writerNickname", writerNickname);
		model.addObject("writerNo", writerNo);
		
		// 팔로우 수 종류별
		int todayCount = fservice.getTodayCount(memberNo); // 금일 팔로우 수
		int yesterdayCount = fservice.getYesterdayCount(memberNo); // 작일 팔로우 수
		int thisweekCount = fservice.getThisweekCount(memberNo); // 금주 팔로우 토탈 수
		int lastweekCount = fservice.getLastweekCount(memberNo); // 지난주 팔로우 토탈 수
		int thismonthCount = fservice.getThismonthCount(memberNo); // 이번달 팔로우 토탈 수
		int lastmonthCount = fservice.getLastmonthCount(memberNo); // 지난달 팔로우 토탈 수
		
		// 마지막 표 성비 사용용도
		int womenCount = mservice.getWomenCount(memberNo);
  		int menCount = mservice.getMenCount(memberNo);
  		int totalCount = mservice.getTotalCount(memberNo);
		
		models.addAttribute("todayCount", todayCount);
		models.addAttribute("yesterdayCount", yesterdayCount);
		models.addAttribute("thisweekCount", thisweekCount);
		models.addAttribute("lastweekCount", lastweekCount);
		models.addAttribute("thismonthCount", thismonthCount);
		models.addAttribute("lastmonthCount", lastmonthCount);
		
		// 마지막 표 성비 사용용도
		models.addAttribute("womenCount", womenCount);
  		models.addAttribute("menCount", menCount);
  		models.addAttribute("totalCount", totalCount);
		
		model.setViewName("mypage/businessMypage");
		
		return model;
	}
	
	
	@GetMapping("/mypage/calendar/calendar_detail")
	public String calendar_person() {
		
		return "mypage/calendar/calendar_detail";
	}
	
	@GetMapping("/mypage/calendar/calendar_detail_business")
	public String calendar_business() {
		
		return "mypage/calendar/calendar_detail_business";
	}
}
