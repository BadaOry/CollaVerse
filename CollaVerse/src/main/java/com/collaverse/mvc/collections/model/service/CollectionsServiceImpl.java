package com.collaverse.mvc.collections.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.collections.model.dao.CollectionsMapper;
import com.collaverse.mvc.collections.model.vo.Collections;
import com.collaverse.mvc.mypage_p_collection.model.service.MypagePCollectionServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CollectionsServiceImpl implements CollectionsService {
	
	@Autowired
	private CollectionsMapper mapper;
	
	@Override
	public List<Collections> findUser(String searchOption, String keyword) {
		 
		log.info("[ServiceImpl] 까지 파라미터가 잘 넘어오는지 확인 : {}, {}", searchOption, keyword);
		
		List<Collections> list; 
		
		if(searchOption.equals("id")) {
			
			list = mapper.findUserById(keyword);
			
		} else {
			
			list = mapper.findUserByNickname(keyword);
		}
		
		return list;
	}

	@Override
	public List<Collections> findBrandUserByKeyword(String searchOption, String keyword) {
		log.info("[ServiceImpl] 까지 파라미터가 잘 넘어오는지 확인 : {}, {}", searchOption, keyword);
		
		List<Collections> list; 
		
		if(searchOption.equals("id")) {
			
			list = mapper.findBrandUserById(keyword);
			
		} else {
			
			list = mapper.findBrandUserByNickname(keyword);
		}
		
		return list;
	}
	
	@Override
	public List<Collections> findOnlyUserByKeyword(String searchOption, String keyword) {
		log.info("[ServiceImpl] 까지 파라미터가 잘 넘어오는지 확인 : {}, {}", searchOption, keyword);
		
		List<Collections> list; 
		
		if(searchOption.equals("id")) {
			
			list = mapper.findOnlyUserById(keyword);
			
		} else {
			
			list = mapper.findOnlyUserByNickname(keyword);
		}
		
		return list;
	}

}
