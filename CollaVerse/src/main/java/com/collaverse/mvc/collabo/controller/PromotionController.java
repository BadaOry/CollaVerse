package com.collaverse.mvc.collabo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.collabo.model.dao.CollaboMapper;
import com.collaverse.mvc.collabo.model.service.PromotionService;
import com.collaverse.mvc.collabo.model.vo.Heart;
import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;
import com.collaverse.mvc.collabo.model.vo.WritePromotion;
import com.collaverse.mvc.common.util.FileProcess;
import com.collaverse.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PromotionController {
	@Autowired
	private PromotionService service;
	
	// 프로모션 작성 페이지로 이동
	@GetMapping("/collabo/promotion/writing_promotion")
	public String writingpromotion() {
		
		return "/collabo/promotion/writing_promotion";
	}
	
	@PostMapping("/collabo/promotion/writing_promotion")
	public ModelAndView writingpromotion(ModelAndView model, HttpServletRequest request,
			@ModelAttribute WritePromotion writepromotion,
			@RequestParam("promImg") MultipartFile promImg, @RequestParam("prodImg") MultipartFile[] prodImg) {
		
		log.info(writepromotion.toString());
		
		log.info("promImg Name : {}", promImg.getOriginalFilename());
		log.info("promImg is Empty : {}", promImg.isEmpty());
		
		log.info("prodImg1 Name : {}", prodImg[0].getOriginalFilename());
		log.info("prodImg1 is Empty : {}", prodImg[0].isEmpty());
		log.info("prodImg2 Name : {}", prodImg[1].getOriginalFilename());
		log.info("prodImg2 is Empty : {}", prodImg[1].isEmpty());
		log.info("prodImg3 Name : {}", prodImg[2].getOriginalFilename());
		log.info("prodImg3 is Empty : {}", prodImg[2].isEmpty());
		
		if (promImg != null && !promImg.isEmpty()) {
			String renamedFileName = null; 
			String location = request.getSession().getServletContext().getRealPath("resources/upload/promotion");
			System.out.println(location); 
			
			renamedFileName = FileProcess.save(promImg, location);
		}
		
		
		model.setViewName("/collabo/promotion/writing_promotion");
		
		return model;
	}


	@Autowired
	private CollaboMapper mapper;

		@GetMapping("/collabo/promotion/main")
		public ModelAndView list(ModelAndView model) {
			
			// Promotion 정보 가져옴 
			List<Promotion> list = service.selectAll();
			
			// 정상적으로 가져오는지 확인 
			log.info(list.toString());
			
			model.addObject("list", list);
			model.setViewName("collabo/promotion/main");
			
			return model;
		}
		


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
