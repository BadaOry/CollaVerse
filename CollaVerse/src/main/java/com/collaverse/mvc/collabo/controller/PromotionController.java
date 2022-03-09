package com.collaverse.mvc.collabo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.collabo.model.service.PromotionService;
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

//	@GetMapping("/collabo/promotion/detail")
//	public String detail() {
//		
//		return "/collabo/promotion/detail";
//		
//	}

	@GetMapping("/collabo/promotion/detail")
	public ModelAndView PromotionDetail(ModelAndView model,
				@RequestParam("pmtNo") int pmtNo) {
		
		Promotion pmt = null;
		List<Product> pdt = null;
		
		// 1. Promotion 정보 가져오기
		pmt = service.getPromotionInfo(pmtNo);
		
		log.info("[Controller] service 가 가져온 Promotion 정보 : {} ", pmt);
		
		// 2. Product 정보 가져오기 (못가져오고 있음, mapper.xml 쪽의 문제로 추측)
		pdt = service.getProductInfo(pmtNo);
		
		log.info("[Controller] service 가 가져온 Product 정보 : {} ", pdt);
		
		model.addObject("promotionInfo", pmt);
		model.addObject("productInfo", pdt);
		model.setViewName("/collabo/promotion/detail");
		return model;
		
	}
	
	
	@PostMapping("/collabo/promotion/detail/heart")
	public ModelAndView UpdateHeart(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam("pmt_no") int pmtNo,
			@RequestParam("heart_mem_no") int heartMemNo) {
		
		log.info("ajax 로 하트 요청에 성공하여 Controller 에 도착");
		
		int heartCheck = service.heartCheck(pmtNo, heartMemNo);
		
		log.info("[Controller] 하트가 눌린 프로모션 번호 : {}", pmtNo );
		log.info("[Controller] loginMember 의 no 와 heartcheck : {} ▶ {}", heartMemNo, heartCheck);
		
		if(heartCheck == 0) {
			// 하트를 처음 누름
//			service.insertLike(bno, memberId); //like테이블 삽입
//			service.updateLike(bno);	//게시판테이블 +1
//			service.updateLikeCheck(bno, memberId);//like테이블 구분자 1
//			service.memberPointPlus(writerId); //회원포인트 +
			
		} else if (heartCheck == 1) {
			// 하트를 빼는 구문
		}
		
		model.setViewName("/collabo/promotion/detail/");
		
		return model;
	}


}
