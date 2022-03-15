package com.collaverse.mvc.collections.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		List<Collections> userList = null;
		
		userList = mapper.getAllUserIdList();
		
		log.info("[Controller] 받아온 id 리스트 출력 : {}", userList);
		
		model.addObject("userList", userList);
		
		return model;
	}
	
	@PostMapping("/collections/search")
	public ModelAndView searchUserList(ModelAndView model,
			@RequestParam("searchCategory") String searchOption,
			@RequestParam("keyword") String keyword) {
		
		log.info("[Controller] jsp 에서 가져온 searchOption : {} / keyword : {}", searchOption, keyword);
		
		List<Collections> findList = service.findUser(searchOption, keyword);
		
		log.info("[Controller] mapper 돌리고 온 findList 출력 : {}", findList);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("findList", findList);
		map.put("keyword", keyword);
		map.put("searchOption", searchOption);
		
		log.info("[Controller] set 끝난 map 출력해보기 : {}", map);
		
		
		model.addObject("map", map);
		model.addObject("findList", findList);
		model.setViewName("/collections/searchResult");
		
		return model;
	}
}
