package com.collaverse.mvc;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.catalina.connector.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.collaverse.mvc.collections.model.dao.CollectionsMapper;
import com.collaverse.mvc.collections.model.vo.Collections;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private CollectionsMapper collectionsMapper;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
		logger.info("CollaVerse 서버 접속 & 홈페이지 로딩 성공");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		// 3. 컬렉션 랜덤 추천
		
		List<Collections> randomUserList = null;
		
		randomUserList = collectionsMapper.getRandomUserList();
		
		System.out.println("[HomeController] 받아온 랜덤 리스트 출력 : "+ randomUserList.toString());
		
		model.addAttribute("randomUserList", randomUserList);
		
		return "home";
	}
	
}
