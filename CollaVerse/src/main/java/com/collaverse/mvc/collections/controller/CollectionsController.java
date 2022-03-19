package com.collaverse.mvc.collections.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.collections.model.dao.CollectionsMapper;
import com.collaverse.mvc.collections.model.service.CollectionsService;
import com.collaverse.mvc.collections.model.vo.Collections;
import com.collaverse.mvc.member.model.vo.Member;
import com.collaverse.mvc.mypage_p_collection.model.service.MypagePCollectionService;
import com.collaverse.mvc.qna.controller.QnaController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CollectionsController {

	@Autowired
	private CollectionsService service;
	
	@Autowired
	private CollectionsMapper mapper;
	
	@GetMapping("/collections/main")
	public ModelAndView getAllUserList(ModelAndView model) {
		
		model.setViewName("/collections/main");
		
		return model;
	}
	

	@PostMapping("collections/infinite")
	public @ResponseBody List<Collections> inifineList(@RequestParam("lastBlock") int count) {
		
		log.info("[Controller] lastBlock 잘 오는지 확인 : {}", count);
		
		List<Collections> infiniteUserList = new ArrayList();
		
		infiniteUserList = mapper.getInfiniteUserList(count);
		
		log.info("[Controller] 받아온infiniteList 리스트 출력 : {}", infiniteUserList);
		
		return infiniteUserList;		
	}
	
	
	@PostMapping("/collections/search/result")
	public ModelAndView searchUserList(ModelAndView model,
			@RequestParam("searchCategory") String searchOption,
			@RequestParam("keyword") String keyword) {
		
		log.info("[Controller] jsp 에서 가져온 searchOption : {} / keyword : {}", searchOption, keyword);
		
		List<Collections> findList = service.findUser(searchOption, keyword);
		String noFindList = null;
		
		log.info("[Controller] mapper 돌리고 온 findList 출력 : {}", findList);
		
		if(findList.size() == 0) {
			
			noFindList = "없음";
			
			log.info("내용이 없으면 출력 : {}", noFindList);
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("findList", findList);
		map.put("keyword", keyword);
		map.put("searchOption", searchOption);
		
		log.info("[Controller] set 끝난 map 출력해보기 : {}", map);
		
		
		model.addObject("map", map);
		model.addObject("findList", findList);		
		model.addObject("noFindList", noFindList);		
		model.setViewName("/collections/search/result");
		
		return model;
	}
	
	@PostMapping("/collections/search/result_brand")
	public ModelAndView searchBrandUserList(ModelAndView model,
			@RequestParam("searchCategory") String searchOption,
			@RequestParam("keyword") String keyword) {
		
		log.info("[Controller] jsp 에서 가져온 searchOption : {} / keyword : {}", searchOption, keyword);
		
		List<Collections> findList = service.findBrandUserByKeyword(searchOption, keyword);
		String noFindList = null;
		
		log.info("[Controller] mapper 돌리고 온 findList 출력 : {}", findList);
		
		if(findList.size() == 0) {
			
			noFindList = "없음";
			
			log.info("내용이 없으면 출력 : {}", noFindList);
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("findList", findList);
		map.put("keyword", keyword);
		map.put("searchOption", searchOption);
		
		log.info("[Controller] set 끝난 map 출력해보기 : {}", map);
		
		
		model.addObject("map", map);
		model.addObject("findList", findList);		
		model.addObject("noFindList", noFindList);		
		model.setViewName("/collections/search/result_brand");
		
		return model;
	}
	
	@PostMapping("/collections/search/result_user")
	public ModelAndView searchOnlyUserList(ModelAndView model,
			@RequestParam("searchCategory") String searchOption,
			@RequestParam("keyword") String keyword) {
		
		log.info("[Controller] jsp 에서 가져온 searchOption : {} / keyword : {}", searchOption, keyword);
		
		List<Collections> findList = service.findOnlyUserByKeyword(searchOption, keyword);
		String noFindList = null;
		
		log.info("[Controller] mapper 돌리고 온 findList 출력 : {}", findList);
		
		if(findList.size() == 0) {
			
			noFindList = "없음";
			
			log.info("내용이 없으면 출력 : {}", noFindList);
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("findList", findList);
		map.put("keyword", keyword);
		map.put("searchOption", searchOption);
		
		log.info("[Controller] set 끝난 map 출력해보기 : {}", map);
		
		
		model.addObject("map", map);
		model.addObject("findList", findList);		
		model.addObject("noFindList", noFindList);		
		model.setViewName("/collections/search/result_user");
		
		return model;
	}
	

	@GetMapping("/collections/search/only_brand")
	public ModelAndView getBrandUserList(ModelAndView model) {
		
		List<Collections> brandUserList = null;
		
		brandUserList = mapper.getBrandUserIdList();
		
		log.info("[Controller] 받아온 브랜드 id 리스트 출력 : {}", brandUserList);
		
		model.addObject("brandUserList", brandUserList);
		model.setViewName("/collections/search/only_brand");
		
		return model;
	}
	
	@GetMapping("/collections/search/only_user")
	public ModelAndView getOnlyUserList(ModelAndView model) {
		
		List<Collections> onlyUserList = null;
		
		onlyUserList = mapper.getOnlyUserIdList();
		
		log.info("[Controller] 받아온 유저 id 리스트 출력 : {}", onlyUserList);
		
		model.addObject("onlyUserList", onlyUserList);
		model.setViewName("/collections/search/only_user");
		
		return model;
	}
	
	/*
	@GetMapping("/collections/search/ob_follower")
	public ModelAndView getUserListByFollower(ModelAndView model) {
		
		List<Collections> userListByFollowerMemNo = null;
		ArrayList<String> userListByFollowerId = new ArrayList();

		
		// 1. 팔로워 많은 순서대로 1 ~ 100 위 TO_MEM_NO 뽑아오기
		userListByFollowerMemNo = mapper.getUserListByFollower();
		
		log.info("[Controller] 받아온 TO_MEM_NO 리스트 출력 : {}", userListByFollowerMemNo);
		
		// 2. 1 ~ 100 위 TO_MEM_NO 로 id 뽑아서 List<String> 에 저장하기
		for(int i = 0; i < userListByFollowerMemNo.size(); i++ ) {
			
			System.out.print(userListByFollowerMemNo.get(i).getToMemNo() + " / ");
//			userListByFollowerId = Arrays.asList(userListByFollowerMemNo.get(i).getToMemNo());
			
			userListByFollowerId.add(i, userListByFollowerMemNo.get(i).getToMemNo());
//			set(i, userListByFollowerMemNo.get(i).getToMemNo());
		
		}
		System.out.println(" toString 찍어보기 " + userListByFollowerId.toString());
		
		// 3. id 찾아온걸로 파라미터 넘겨서 Collections 객체 리스트 가져오기
		List<Collections> result = mapper.getUserListByFollowerResult(userListByFollowerId);
		
//		model.addObject("userList", userListByFollowerId);
		
		log.info("[Controller] 받아온 id 리스트 출력 : {}", userListByFollowerMemNo);
		
		model.addObject("result", result);
		model.setViewName("/collections/search/ob_follower");
		
		return model;
	}
	*/
	
	
}
