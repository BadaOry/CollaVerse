package com.collaverse.mvc.collabo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.collabo.model.dao.CollaboMapper;
import com.collaverse.mvc.collabo.model.service.PromotionService;
import com.collaverse.mvc.collabo.model.vo.Heart;
import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;
import com.collaverse.mvc.common.util.PageInfo;
import com.collaverse.mvc.member.model.vo.Member;
import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PromotionController {
	@Autowired
	private PromotionService service;

	@Autowired
	private CollaboMapper mapper;
/*
	@GetMapping("/collabo/promotion/main")
	public ModelAndView list(ModelAndView model,
			@RequestParam(defaultValue = "1") int page) {
		
		int promotionCount = 0;
		PageInfo pageInfo = null;
		List<Promotion> list = null;
		
		log.info("page number : {}", page);
		
		promotionCount = service.getPromotionCount();
		pageInfo = new PageInfo (page, 5, promotionCount, 3);	
		list = service.getPromotionList(pageInfo);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("/collabo/promotion/main"); // 실제로 전달해줄 View의 이름 
		
		return model;
	}
*/

/*	
	@GetMapping("/collabo/promotion/main")
	public ModelAndView view(ModelAndView model, @RequestParam(defaultValue = "no") int no) {
		
		Promotion promotion = service.findPromotionByNo(no);
		
		model.addObject("promotion", promotion);
		model.setViewName("/collabo/promotion/main");
		
		return model;
	}
*/
	
	// 받아오기 성공 (but 1개가 아닌 15개를 받아옴) 	
		@GetMapping("/collabo/promotion/main")
		public ModelAndView list(ModelAndView model) {
			
//			promotion = service.selectAll();
			
//			model.addObject("promotion", promotion);
//			model.setViewName("/collabo/promotion/main");
			
			List<Promotion> list = service.selectAll();
			
			log.info(list.toString());
			
			model.addObject("list", list);
			model.setViewName("collabo/promotion/main");
			
			return model;
		}
		

/*
		@GetMapping("/collabo/promotion/main")
		public ModelAndView list(ModelAndView model,
				@RequestParam(defaultValue = "1") int page) {
			
			int promotionCount = 0;
			PageInfo pageInfo = null;
			List<Promotion> list = null;
			
			log.info("page number : {}", page);
			
			promotionCount = service.getPromotionCount();
			pageInfo = new PageInfo (page, 5, promotionCount, 3);	
			list = service.getPromotionList(pageInfo);
			
			model.addObject("pageInfo", pageInfo);
			model.addObject("list", list);
			model.setViewName("/collabo/promotion/main"); // 실제로 전달해줄 View의 이름 
			
			return model;
		}
*/

	/*	
		@GetMapping("/collabo/promotion/main")
		public ModelAndView view(ModelAndView model, @RequestParam(defaultValue = "no") int no) {
			
			Promotion promotion = service.findPromotionByNo(no);
			
			model.addObject("promotion", promotion);
			model.setViewName("/collabo/promotion/main");
			
			return model;
		}
	*/

/*
// 받아오기 성공 (but 1개가 아닌 15개를 받아옴) 	
	@GetMapping("/collabo/promotion/main")
	public ModelAndView list(ModelAndView model,
			@RequestParam(defaultValue = "1") int page) {
		
//		promotion = service.selectAll();
		
//		model.addObject("promotion", promotion);
//		model.setViewName("/collabo/promotion/main");
		int promotionCount = 0;
		PageInfo pageInfo = null;
		List<Promotion> list = null;
		
		promotionCount = service.getPromotionCount();
		pageInfo = new PageInfo (page, 5, promotionCount, 3);
		list = service.getPromotionList(pageInfo);
		
		log.info(list.toString());
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("/collabo/promotion/main");
		
		return model;
	}
*/

/*	
	public ModelAndView mainlist(ModelAndView model, @ModelAttribute Promotion promotion) {
		
		List<Promotion> mainlist = service.pmtMainList();
		
		log.info(mainlist.toString());
		
		model.addObject("mainlist", mainlist);
		model.setViewName("/collabo/promotion/main");
		
		return model;
	}
*/	


	@GetMapping("/collabo/promotion/detail")
	public ModelAndView PromotionDetail(ModelAndView model,
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			@RequestParam("pmtNo") int pmtNo) {
		
		Promotion pmt = null;
		List<Product> pdt = null;
		
		// 1. Promotion 정보 가져오기
		pmt = service.getPromotionInfo(pmtNo);
		
		log.info("[Controller] service 가 가져온 Promotion 정보 : {} ", pmt);
		
		// 2. Product 정보 가져오기 (못가져오고 있음, mapper.xml 쪽의 문제로 추측)
		pdt = service.getProductInfo(pmtNo);
		
		log.info("[Controller] service 가 가져온 Product 정보 : {} ", pdt);
		
		// 3. heartCheck 처리하기
		int heartCheck = 0;
		if(loginMember  != null){
			int heartMemNo = loginMember.getNo();
			heartCheck = service.heartCheck(pmtNo, heartMemNo);
			
			log.info("[Controller] loginMember 의 no 와 heartcheck : {} ▶ {}", heartMemNo, heartCheck);
			
		}	
		
		model.addObject("promotionInfo", pmt);
		model.addObject("productInfo", pdt);
		model.addObject("heartCheck", heartCheck);
		model.setViewName("/collabo/promotion/detail");
		return model;
		
	}
	
	
	@PostMapping("/collabo/promotion/detail/heart")
	@ResponseBody
	public int UpdateHeart(@SessionAttribute("loginMember") Member loginMember,
			@ModelAttribute Heart heart,
			@RequestParam("pmt_no") int pmtNo,
			@RequestParam("heart_mem_no") int heartMemNo) {
		
		log.info("ajax 로 하트 요청에 성공하여 Controller 에 도착");
		log.info("[Controller] 요청으로 넘어온 파라미터 출력 : {}, {}", pmtNo, heartMemNo);
		
		int heartCheck = service.heartCheck(pmtNo, heartMemNo);
		
		log.info("[Controller] 하트가 눌린 프로모션 번호 : {}", pmtNo );
		log.info("[Controller] loginMember 의 no 와 heartcheck : {} ▶ {}", heartMemNo, heartCheck);
		
		if(heartCheck == 0) {
			// 하트를 처음 누름
			mapper.insertHeart(pmtNo, heartMemNo); // HEART 테이블에 삽입
			mapper.addHeartHit(pmtNo);	// PROMOTION 테이블의 HEART_HIT +1
			mapper.updateHeartCheck(pmtNo, heartMemNo); // HEART 테이블의 HEARTCHECK 를 1 으로 변경	

		} else if (heartCheck == 1) {
			// 하트를 빼는 구문
			mapper.updateHeartCheckCancel(pmtNo, heartMemNo); // HEART 테이블의 HEARTCHECK 를 0 으로 변경		
			mapper.minusHeartHit(pmtNo);	// PROMOTION 테이블의 HEART_HIT -1
			mapper.deleteHeart(pmtNo, heartMemNo); // Heart 컬럼 한 개 삭제
		}
		
		return heartCheck;
	}


}
