package com.collaverse.mvc.collabo.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.format.annotation.DateTimeFormat;
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
import com.collaverse.mvc.collabo.model.vo.Brand;
import com.collaverse.mvc.collabo.model.vo.Heart;
import com.collaverse.mvc.collabo.model.vo.Product;
import com.collaverse.mvc.collabo.model.vo.Promotion;
import com.collaverse.mvc.collabo.model.vo.WritePromotion;
import com.collaverse.mvc.common.util.FileProcess;
import com.collaverse.mvc.common.util.ProductFileProcess;
import com.collaverse.mvc.common.util.PromotionFileProcess;
import com.collaverse.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PromotionController {
	@Autowired
	private PromotionService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	// 프로모션 작성 페이지로 이동
	@GetMapping("/collabo/promotion/writing_promotion")
	public String writingpromotion() {
		
		return "/collabo/promotion/writing_promotion";
	}
	
	@PostMapping("/collabo/promotion/writing_promotion")
	public ModelAndView writingpromotion(ModelAndView model,/* HttpServletRequest request,*/
			@SessionAttribute(name="loginMember") Member loginMember,
			@ModelAttribute WritePromotion writepromotion,
			@RequestParam("promName") String promTitle,
			@RequestParam("promContent") String promContent,
			@RequestParam("startDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate,
			@RequestParam("endDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
			@RequestParam("c_no") String cNo,
			@RequestParam("prodName1") String prodName1,
			@RequestParam("prodName2") String prodName2,
			@RequestParam("prodName3") String prodName3,
			@RequestParam("prodPrice1") String prodPrice1,
			@RequestParam("prodPrice2") String prodPrice2,
			@RequestParam("prodPrice3") String prodPrice3,
			@RequestParam("prodContent1") String prodContent1,
			@RequestParam("prodContent2") String prodContent2,
			@RequestParam("prodContent3") String prodContent3,
			@RequestParam("prodQty1") String prodQty1,
			@RequestParam("prodQty2") String prodQty2,
			@RequestParam("prodQty3") String prodQty3,
			@RequestParam("promImg") MultipartFile promImg, @RequestParam("prodImg") MultipartFile[] prodImg) {
		int result = 0;
		Promotion promotionVo = new Promotion();
		Product productVo = new Product();
		String location  = null;
		
		log.info("[Controller] 요청이 오는지 확인 ");
		System.out.println("나오냐? " + promTitle + promContent +  startDate + endDate);
		
//		log.info("writepromotion 출력 {} ", writepromotion.toString());
		
		log.info("promImg Name : {}", promImg.getOriginalFilename());
		log.info("promImg is Empty : {}", promImg.isEmpty());
		
		log.info("prodImg1 Name : {}", prodImg[0].getOriginalFilename());
		log.info("prodImg1 is Empty : {}", prodImg[0].isEmpty());
		log.info("prodImg2 Name : {}", prodImg[1].getOriginalFilename());
		log.info("prodImg2 is Empty : {}", prodImg[1].isEmpty());
		log.info("prodImg3 Name : {}", prodImg[2].getOriginalFilename());
		log.info("prodImg3 is Empty : {}", prodImg[2].isEmpty());
		
		
		// [ Promotion 관련 내용 저장하기 ]
		// ★ Promotion Vo 에 넣을 내용 set 하는 과정  
		
		// pmt_no 는 쿼리에서 해결하자 시퀀스로 !
		// pmt_title 은 받아와야함
		promotionVo.setTitle(promTitle);
		
		// pmt_imgpath 는 쿼리에서 default 값으로 쓰자
		// pmt_content 는 받아와야함
		promotionVo.setContent(promContent);
		
		// pmt_status 는 쿼리에서 디콜트로 y
		// start_date & end_date는 받아와야 함
		// > 1. promotion/detail 페이지에서 start enddate 를 보여주는 공간이 없네요
		//        > insert 문 구현 완료되면 지현님이랑 상의해서 어디넣을지 
		promotionVo.setStartDate(startDate);
		promotionVo.setEndDate(endDate);
		
		// readcount 는 쿼리문에서 0 부터 시작이니까
		// c_no 는 받아와야함
		promotionVo.setCNo(cNo);
		// heart_hit 쿼리문에서 0 부터 시작 
		
		
		// [ Product 관련 내용 저장하기 ]
		// ★ ProductVo에 넣을 내용 set 하는 과정
		
		// pro_no는 쿼리에서 해결
		// pro_name은 받아오기
		productVo.setProName(prodName1);
		// pro_price는 받아오기
		productVo.setProPrice(prodPrice1);
		// pro_content는 받아오기
		productVo.setProContent(prodContent1);
		// pro_qty는 받아오기
		productVo.setProQty(prodQty1);
		// pro_img_path는 쿼리에서 default 값으로 쓰기
		// c_no는 받아오기
		productVo.setCNo(cNo);
		// pmt_no는 promotion에서 받아오기?
		
		log.info("[Controller] promotionVo 에 내용이 잘 set 되었는지 확인 : {}", promotionVo);	
		
		result = service.promotionSave(promotionVo);
		result = service.productSave(productVo);
		
		// promTitle 을 파라미터로 넘겨서 mapper.xml 까지 가서 where = #{promTitle} 로 방금 insert한 promotion의 정보를 빼온다
//		promotionVo = service.findPromotionInfo(promTitle);
		// select * from promotion where = #{promTitle}
		
		log.info("[Controller] insert 후에 다시 찾아온 promotion 입력내용 : {}", promotionVo);	
		
		int promotionNo = promotionVo.getNo();
		int productNo = productVo.getProNo();
		
		log.info("[Controller] promotionVo 의 promotionNo 확 : {}", promotionNo);	
		 
		// 2. Promotion 이미지 파일명 바꾸기
		if (promImg != null && !promImg.isEmpty()) {
			
			String renamedFileName = null;
//			String location = request.getSession().getServletContext().getRealPath("resources/upload/promotion");
			try {
				location = resourceLoader.getResource("resources/images/promotion/promotion").getFile().getPath();
				renamedFileName = PromotionFileProcess.promotionsave(promImg, location, promotionNo);
				
				log.info("[Controller] FileProcess 에서 가져온 renamedFileName 출력 : {}", renamedFileName);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				promotionVo.setOriginalFileName(promImg.getOriginalFilename());
				promotionVo.setRenamedFileName(renamedFileName);
			}
		}
		
				
		
		
		
		
		// [ Product 관련 내용 저장하기 ] 
		// Product1 이미지 파일명 바꾸기
		if (prodImg != null && !prodImg.isEmpty()) {
			
			String renamedFileName = null;
//			String location = request.getSession().getServletContext().getRealPath("resources/upload/promotion");
			try {
				location = resourceLoader.getResource("resources/images/product/product").getFile().getPath();
				renamedFileName = PromotionFileProcess.promotionsave(promImg, location, productNo);
				
				log.info("[Controller] FileProcess 에서 가져온 renamedFileName 출력 : {}", renamedFileName);
			} catch (IOException e) {
				
				e.printStackTrace();
			}						
			
			if(renamedFileName != null) {
				productVo.setOriginalFileName(prodImg.getOriginalFilename());
				productVo.setRenamedFileName(renamedFileName);
			}
		}
		
		// Product2 이미지 파일명 바꾸기
		if (prodImg != null && !prodImg[1].isEmpty()) {
			
			String renamedFileName = null;
//			String location = request.getSession().getServletContext().getRealPath("resources/upload/promotion");
			try {
				location = resourceLoader.getResource("resources/upload/promotion/product").getFile().getPath();
				renamedFileName = ProductFileProcess.productsave1(prodImg, location);
				
				log.info("[Controller] FileProcess 에서 가져온 renamedFileName 출력 : {}", renamedFileName);
			} catch (IOException e) {
				
				e.printStackTrace();
			}						
			
			if(renamedFileName != null) {
				writepromotion.setOriginalFileName(promImg.getOriginalFilename());
				writepromotion.setRenamedFileName(renamedFileName);
			}
		}
		// Product3 이미지 파일명 바꾸기
		if (prodImg != null && !prodImg[2].isEmpty()) {
			
			String renamedFileName = null;
//			String location = request.getSession().getServletContext().getRealPath("resources/upload/promotion");
			try {
				location = resourceLoader.getResource("resources/upload/promotion/product").getFile().getPath();
				renamedFileName = ProductFileProcess.productsave2(prodImg, location);
				
				log.info("[Controller] FileProcess 에서 가져온 renamedFileName 출력 : {}", renamedFileName);
			} catch (IOException e) {
				
				e.printStackTrace();
			}						
			
			if(renamedFileName != null) {
				writepromotion.setOriginalFileName(promImg.getOriginalFilename());
				writepromotion.setRenamedFileName(renamedFileName);
			}
		}
		
		// 작성한 프로모션 데이터를 DB에 저장
//		writepromotion.setWriterNo(loginMember.getNo());
//		result = service.productSave(writepromotion);
		
		if (result > 0) {
			model.addObject("msg", "프로모션이 정상적으로 등록되었습니다.");
			model.addObject("location", "/collabo/promotion/detail?pmtNo=" + promotionVo.getNo());
		} else {
			model.addObject("msg", "프로모션 등록에 실패하였습니다.");
			model.addObject("location", "/collabo/promotion/writing_promotion");
		}
		
		model.setViewName("common/msg");
		
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
		List<Brand> br = null;
		
		// 1. Promotion 정보 가져오기
		pmt = service.getPromotionInfo(pmtNo);
		
		log.info("[Controller] service 가 가져온 Promotion 정보 : {} ", pmt);
		
		// 2. Product 정보 가져오기 (못가져오고 있음, mapper.xml 쪽의 문제로 추측)
		pdt = service.getProductInfo(pmtNo);
		
		log.info("[Controller] service 가 가져온 Product 정보 : {} ", pdt);
		
		// 3. Brand 정보 가져오기 
		br = service.selectBrandIntro(pmtNo);
		log.info("[Controller] service 가 가져온 Brand 정보 : {} ", br);
		
		// 4. heartCheck 처리하기
		int heartCheck = 0;
		if(loginMember  != null){
			int heartMemNo = loginMember.getNo();
			heartCheck = service.heartCheck(pmtNo, heartMemNo);
			
			log.info("[Controller] loginMember 의 no 와 heartcheck : {} ▶ {}", heartMemNo, heartCheck);
			
		}
		
		model.addObject("promotionInfo", pmt);
		model.addObject("productInfo", pdt);
		model.addObject("brandInfo", br);
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


	
	@GetMapping("/collabo/promotion/writetest")
	public String writetestpage() {
		
		return "/collabo/promotion/writetest";
	}
}
