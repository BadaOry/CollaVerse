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
		
		List<MypagePCollection> collectionList = null;
//		PageInfo pageInfo = null;
//		String memberId = null;
	
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
	
	
	// ▼ 컬렉션 작성 페이지로 넘어가는 메소드
	@GetMapping("mypage/collection/write")
	public String write() {
		
		log.info("컬렉션 작성 페이지로 이동 성공");
		
		return "mypage/collection/write";
	}
	

	// ▼ 컬렉션 작성 요청 메소드
	@PostMapping("mypage/collection/write")
	public ModelAndView write(ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute MypagePCollection mypagePCollection,
			@RequestParam("upfile") List<MultipartFile> upfile,
			@RequestParam("content") String content) {
		
			int result = 0;
			
			log.info("[Controller] 가져온 content 의 내용 확인 : {}", content);
			log.info("[Controller] 가져온 upfile 의 정보 List 확인 : {}", upfile);
			
			for (MultipartFile mf : upfile) {
				String originalFileName = mf.getOriginalFilename();
				boolean upfileIsEmpty = mf.isEmpty();
				
				log.info("[Controller] originalFileName 확인 : {}", originalFileName);
				log.info("[Controller] upfile is Empty 확인 : {}", upfileIsEmpty);
				
				
			// 1. 파일을 업로드 했는지 확인 후, rename 하여 VO 에 set & 지정 위치에 upfile 저장
				if (mf != null && !mf.isEmpty()) {
					String location = null;
					String renamedFileName = null;
					
					List<String> originalFileNameList= new ArrayList<String>();
					List<String> renamedFileNameList = new ArrayList<String>();
					
					
					try {
						location = resourceLoader.getResource("resources/upload/collection").getFile().getPath();						
						renamedFileName = FileProcess.save(mf, location);
						
						log.info("[Controller] FileProcess 에서 가져온 renamedFileName 출력 : {}", renamedFileName);

						originalFileNameList.add(originalFileName);
						renamedFileNameList.add(renamedFileName);
						
						log.info("[Controller] originalFileNameList 정보 확인 : {}", originalFileNameList);
						log.info("[Controller] renamedFileNameList 정보 확인 : {}", renamedFileNameList);
						
						if (renamedFileName != null) {
							// ▼ renamedFileName 이 왔으면, upfile 하나하나에 set 으로 or 이랑 rm 을 세팅해주자
							//   : DB 의 ON, RN 컬럼을 하나로 하고 리스트를 그 값 안에 넣으면 된다...? 일단 돌려보고 해보자
							//     ▷ 된다 !!! 이제 DB 에 컬럼은 하나씩만 남겨놓자
							//     ▶ 안된다... 리스트가 아니라 마지막 하나만 저장됨
							//        ▷ VO 값을 list 형태로 바꿔야하네.. 바꿨는데 List<String> 에 String 값을 못저장한다?
							//          ▷ 그래서 list 형태로 넣어줘도 안되네
							//     ▶ 자꾸 마지막 값만 저장된다..
//							mypagePCollection.setOriginalFileName01(originalFileName);
							mypagePCollection.setOriginalFileName01(originalFileNameList.toString());
							mypagePCollection.setRenamedFileName01(renamedFileNameList.toString());
							log.info("[Controller] or,nr 이 VO 에 잘 set 되었는지 확인 : {}, {}", mypagePCollection.getOriginalFileName01(), mypagePCollection.getRenamedFileName01());
						}
					} catch (IOException e) {
						System.out.println("renamedFileName 불러오기 실패..");
						e.printStackTrace();
					}
					
				}
			}
			
			
			// 2. 작성한 게시글 내용을 VO 에 set
			mypagePCollection.setCltContent(content);
			log.info("[Controller] content VO 에 잘 set 되었는지 확인 : {}", content);
			
			
			// 3. 작성한 게시글 데이터를 데이터베이스에 저장
			mypagePCollection.setCltMemberNo(loginMember.getNo());
			log.info("[Controller] VO 정보 확인 : {}", mypagePCollection);
			
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
			
		/*
		int result = 0;
		
		// 파일을 업로드하지 않으면 "", 파일을 업로드하면 "파일명"
		log.info("Upfile Name : {}", upfile[0].getOriginalFilename());
		// 파일을 업로드하지 않으면 true, 파일을 업로드하면 false 
		log.info("Upfile is Empty : {}", upfile[0].isEmpty());
		
		log.info("[마이페이지Controller] 컬렉션 리스트 정보 : {} ", mypagePCollection.toString());
//		log.info("Upfile Name : {}", upfile[0].getOriginalFilename());
//		log.info("Upfile is Empty : {}", upfile[0].isEmpty());

		// 1. 파일을 업로드 했는지 확인 후 파일을 저장
		for(int i = 0; i < 6; i++) {
			if (upfile[i] != null && !upfile[i].isEmpty()) {
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
//					mypagePCollection.setOriginalFileName02(upfile[1].getOriginalFilename());
//					mypagePCollection.setRenamedFileName02(renamedFileName);
//					mypagePCollection.setOriginalFileName03(upfile[2].getOriginalFilename());
//					mypagePCollection.setRenamedFileName03(renamedFileName);
//					mypagePCollection.setOriginalFileName04(upfile[3].getOriginalFilename());
//					mypagePCollection.setRenamedFileName04(renamedFileName);
//					mypagePCollection.setOriginalFileName05(upfile[4].getOriginalFilename());
//					mypagePCollection.setRenamedFileName05(renamedFileName);
//					mypagePCollection.setOriginalFileName06(upfile[5].getOriginalFilename());
//					mypagePCollection.setRenamedFileName06(renamedFileName);
				}
			}	
		}
		
		// 2. 작성한 게시글 데이터를 데이터베이스에 저장
		mypagePCollection.setCltMemberNo(loginMember.getNo());
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
		*/
		

		}


	private void add(String string) {
		// TODO Auto-generated method stub
		
	}
	
	/*	
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
