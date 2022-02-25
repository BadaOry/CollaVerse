package com.collaverse.mvc.mypage_p_collection.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.collaverse.mvc.common.util.FileProcess;
import com.collaverse.mvc.common.util.PageInfo;
import com.collaverse.mvc.member.model.vo.Member;
import com.collaverse.mvc.mypage_p_collection.model.dao.MypagePCollectionDao;
import com.collaverse.mvc.mypage_p_collection.model.service.MypagePCollectionService;
import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypagePCollectionController {
	@Autowired
	private MypagePCollectionService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	
	@GetMapping("mypage/collection/list")
	public ModelAndView Collectionlist(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember
			/*,@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int count*/) {
//		
//		PageInfo pageInfo = null;
		List<MypagePCollection> collectionList = null;
		String memberId = null;
	
//		
		log.info("[컬렉션 리스트] list : {}", collectionList);
		
//		memberId = service.findCollectionById(loginMember);
//		log.info("[로그인 회원 id 정보] {}", memberId);
//		
		
//		pageInfo = new PageInfo(page, 10, service.getCollectionCount(), count);
		collectionList = service.getCollectionList(loginMember);
//		
		
		// 로그인 처리 해주는 인터셉터 필요 feat 서연님
//		if(loginMember.getNo().equals(collectionList[0].get))
		
//		model.addObject("pageInfo", pageInfo);
		model.addObject("collectionList", collectionList);
		model.setViewName("mypage/collection/list");

		// ▼ 리스트가 잘 저장되었는지 확인하는 로그
		log.info("[컬렉션 리스트] list : {}", collectionList);
		
		return model;
	}
	
	/*
	
	// ▼ 컬렉션 작성 페이지로 넘어가는 메소드
	@GetMapping("mypage/collection/write")
	public String write() {
		
		return "mypage/collection/write";
	}
	
	// ▼ 컬렉션 작성 요청 메소드
	@PostMapping("mypage/collection/write")
	public ModelAndView write(ModelAndView model,
			@SessionAttribute(name= "loginMember") Member loginMember,
			@ModelAttribute MypagePCollection mypagePCollection,
			@RequestParam("upfile") MultipartFile[] upfile) {
		
		int result = 0;
		
		log.info(mypagePCollection.toString());
//		log.info("Upfile Name : {}", upfile[0].getOriginalFilename());
//		log.info("Upfile is Empty : {}", upfile[0].isEmpty());
		
		// ▼ 첨부파일 6개 잘 가져오는지 콘솔에 출력
		System.out.println(upfile[0].getOriginalFilename());
		System.out.println(upfile[0].isEmpty());
		System.out.println(upfile[1].getOriginalFilename());
		System.out.println(upfile[1].isEmpty());
		System.out.println(upfile[2].getOriginalFilename());
		System.out.println(upfile[2].isEmpty());
		System.out.println(upfile[3].getOriginalFilename());
		System.out.println(upfile[3].isEmpty());
		System.out.println(upfile[4].getOriginalFilename());
		System.out.println(upfile[4].isEmpty());
		System.out.println(upfile[5].getOriginalFilename());
		System.out.println(upfile[5].isEmpty());
		
		for(int i = 0; upfile.length <6; i++) {
			if (upfile[i] != null && upfile[i].isEmpty()) {
				String location = null;
				String renamedFileName = null;
				
				try {
					location = resourceLoader.getResource("resources/upload/collection").getFile().getPath();
					renamedFileName = FileProcess.save(upfile[i], location);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				if (renamedFileName != null) {
					mypagePCollection.setOriginalFileName01(upfile[0].getOriginalFilename());
					mypagePCollection.setRenamedFileName01(renamedFileName);
					mypagePCollection.setOriginalFileName02(upfile[1].getOriginalFilename());
					mypagePCollection.setRenamedFileName02(renamedFileName);
					mypagePCollection.setOriginalFileName03(upfile[2].getOriginalFilename());
					mypagePCollection.setRenamedFileName03(renamedFileName);
					mypagePCollection.setOriginalFileName04(upfile[3].getOriginalFilename());
					mypagePCollection.setRenamedFileName04(renamedFileName);
					mypagePCollection.setOriginalFileName05(upfile[4].getOriginalFilename());
					mypagePCollection.setRenamedFileName05(renamedFileName);
					mypagePCollection.setOriginalFileName06(upfile[5].getOriginalFilename());
					mypagePCollection.setRenamedFileName06(renamedFileName);
				}
			}	
		}
		
		mypagePCollection.setMemberNo(loginMember.getNo());
		result = service.save(mypagePCollection);
		
		if(result > 0) {
			model.addObject("msg", "컬렉션 등록 완료 !");
			model.addObject("location", "mypage/collection/list");
		} else {
			model.addObject("msg", "컬렉션 등록 실패....");			
			model.addObject("location", "mypage/collection/write");
		}
		model.setViewName("/common/msg");
		
		
		return model;
	}
	
	
	// ▼ 컬렉션 수정 페이지로 넘어가는 메소드
	@GetMapping("/mypage/collection/update")
	public ModelAndView update(@SessionAttribute("loginMember") Member loginMember,
			ModelAndView model, @RequestParam("no") int no) {
		
		MypagePCollection mypagePCollection = service.findCollectionByNo(no);
		
		if (loginMember.getNo() == mypagePCollection.getMemberNo()) {
			model.addObject("mypagePCollection", mypagePCollection);
			model.setViewName("/mypage/collection/update");
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/mypage/collection/list");
			model.setViewName("common/msg");
		}
		return model;
		
	}
	
	// ▼ 컬렉션 수정 요청 메소드
//	@PostMapping("mypage/collection/write")
//	public ModelAndView write(ModelAndView model,
	
	
	
//	@GetMapping(value = "mypage/mycollection/list")
//	public String collectionList(HttpServletRequest request, HttpSession session) {
//		
//		final int PAGE_ROW_COUNT = 6;
//		
//		int pageNum = 1;
//		String strPageNum = request.getParameter("pageNum");
//		
//		if(strPageNum != null) {
//			pageNum = Integer.parseInt(strPageNum);
//		}
//		
//		int startRowNum = 0 + (pageNum - 1) * PAGE_ROW_COUNT;
//		int endRowNum = pageNum * PAGE_ROW_COUNT;
//		int rowCount = PAGE_ROW_COUNT;
//		
//		CollectionTO cto = new CollectionTO();
//		cto.setStartRowNum(startRowNum);
//		cto.setEndRowNum(endRowNum);
//		cto.setRowCount(rowCount);
//		
//		ArrayList<CollectionTO> list = null;
//		int totalRow = 0;
//		
//		totalRow = MypagePCollectionDao.CollectionCount(cto);
//		
//		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
//		
//		request.setAttribute("list", list);
//		request.setAttribute("totalPageCount", totalPageCount );
//		request.setAttribute("totalRow", totalRow);
//		request.setAttribute("pageNum", pageNum );
//		
//		return "mypage_p_collection/mypage_p_collection_list";
//	}
	
	*/
	
	
}
