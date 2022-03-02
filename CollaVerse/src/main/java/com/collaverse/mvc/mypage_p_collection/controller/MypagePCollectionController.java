package com.collaverse.mvc.mypage_p_collection.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.view.RedirectView;

import com.collaverse.mvc.common.util.FileProcess;
import com.collaverse.mvc.common.util.PageInfo;
import com.collaverse.mvc.member.model.vo.Member;
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
			@SessionAttribute("loginMember") Member loginMember) {
		
		List<MypagePCollection> collectionList = null;
		
//		log.info("[컬렉션 리스트] list : {}", collectionList);
		
		collectionList = service.getCollectionList(loginMember);
	
		
		// 로그인 처리 해주는 인터셉터 필요 feat 서연님
//		if(loginMember.getNo().equals(collectionList.);
		
		model.addObject("collectionList", collectionList);
		model.setViewName("mypage/collection/list");

		log.info("[Controller] service 가 가져온 CollectionList 출력 : {}", collectionList);
		
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
					
//					List<String> originalFileNameList= new ArrayList<String>();
//					List<String> renamedFileNameList = new ArrayList<String>();
					
					
					try {
						location = resourceLoader.getResource("resources/upload/collection").getFile().getPath();						
						renamedFileName = FileProcess.save(mf, location);
						
						log.info("[Controller] FileProcess 에서 가져온 renamedFileName 출력 : {}", renamedFileName);
						

//						originalFileNameList.add(originalFileName);
//						renamedFileNameList.add(renamedFileName);
//						
//						log.info("[Controller] originalFileNameList 정보 확인 : {}", originalFileNameList);
//						log.info("[Controller] renamedFileNameList 정보 확인 : {}", renamedFileNameList);
//						List<Map<String, String>> files = mypagePCollection.getFiles();
//						
//						Map<String, String> onrnMap = new HashMap<String, String>();
//						onrnMap.put("original",originalFileName);
//						onrnMap.put("rename", renamedFileName);
//						files.add(onrnMap);
////						String test = files.get(0).get("rename");
//						log.info("[Controller] onrn 을 Map 에 저장 후, Map 내용 출력 : {}", onrnMap.toString());
//						log.info("[Controller] VO 변수 files 의 Map 내용 출력 : {}",files.toString());
//						// ▲ 이 Map 을 DB 에 저장하는 방법을 알아야겠는데... 맵 공부해야겟다
//						
//						// ornMap 을 vo 의 on01 에 to.String으로 set해보자
//						mypagePCollection.setOriginalFileName01(files.toString());
//						log.info("[Controller] files 맵 이 VO 에 잘 set 되었는지 확인 : {}",mypagePCollection.getOriginalFileName01());
						
						
						if (renamedFileName != null) {
							mypagePCollection.setOriginalFileName01(originalFileName);
							mypagePCollection.setRenamedFileName01(renamedFileName);
							
							log.info("[Controller] originalFileNam 정보 확인 : {}", originalFileName);
							log.info("[Controller] renamedFileName 정보 확인 : {}", renamedFileName);
							// ▼ renamedFileName 이 왔으면, upfile 하나하나에 set 으로 or 이랑 rm 을 세팅해주자
							//   : DB 의 ON, RN 컬럼을 하나로 하고 리스트를 그 값 안에 넣으면 된다...? 일단 돌려보고 해보자
							//     ▷ 된다 !!! 이제 DB 에 컬럼은 하나씩만 남겨놓자
							//     ▶ 안된다... 리스트가 아니라 마지막 하나만 저장됨
							//        ▷ VO 값을 list 형태로 바꿔야하네.. 바꿨는데 List<String> 에 String 값을 못저장한다?
							//          ▷ 그래서 list 형태로 넣어줘도 안되네
							//     ▶ 자꾸 마지막 값만 저장된다..
//							mypagePCollection.setOriginalFileName01(originalFileName);
//							mypagePCollection.setOriginalFileName01(originalFileNameList.toString());
//							mypagePCollection.setRenamedFileName01(renamedFileNameList.toString());
//							log.info("[Controller] or,nr 이 VO 에 잘 set 되었는지 확인 : {}, {}", mypagePCollection.getOriginalFileName01(), mypagePCollection.getRenamedFileName01());
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
//				model.addObject("msg", "컬렉션 등록 완료 !");
				this.Collectionlist(model, loginMember);
			} else {
				model.addObject("msg", "컬렉션 등록 실패....");			
				model.addObject("location", "mypage/collection/write");
				model.setViewName("/common/msg");
			}
			
			return model;
			
	}
	
	
	// ▼ 모달에서 컬렉션 수정 버튼을 눌렀을 때 업데이트 페이지로 이동하는 메소드
	@GetMapping("mypage/collection/update")
	public ModelAndView update(@RequestParam("cltNo") int cltNo, ModelAndView model) {
		
		log.info("컬렉션 업데이트 페이지로 이동 성공, ctlNo : {}", cltNo);
		
		MypagePCollection mypagePCollection = service.findCollectionByNo(cltNo);
		
		log.info("[Controller] update 할 컬렉션의 정보 출력 : {}", mypagePCollection);
		
		model.addObject("updateCollectionInfo", mypagePCollection);
		model.setViewName("/mypage/collection/update");
		
		return model;
	}
	
	
	
	// ▼ 모달에서 컬렉션 수정 버튼을 눌렀을 때 동작하는 메소드
	@PostMapping("/mypage/collection/update")
	public ModelAndView update(@SessionAttribute("loginMember") Member loginMember,
			@RequestParam("cltNo") int cltNo, @RequestParam("content") String updatecontent, 
			ModelAndView model) {
	
		log.info("[Controller] update 할 컬렉션의 cltNo 를 잘 받아왔는지 출력 : {}", cltNo);
		log.info("[Controller] update 할 컬렉션의 cltContent 를 잘 받아왔는지 출력 : {}", updatecontent);

		MypagePCollection mypagePCollection = service.findCollectionByNo(cltNo);
		
		log.info("[Controller] update 할 컬렉션의 정보 출력 : {}", mypagePCollection);
		
		mypagePCollection.setCltContent(updatecontent);
		
		log.info("[Controller] content 내용이 update 된 컬렉션의 정보 출력 : {}", mypagePCollection);
		
		int result = 0;
		
		result= service.save(mypagePCollection);
		log.info("[Controller] update 완료된 컬렉션의 정보 출력 : {}", mypagePCollection);
		
		if(result > 0) {
//			model.addObject("msg", "컬렉션 등록 완료 !");
			this.Collectionlist(model, loginMember);
		} else {
			model.addObject("msg", "컬렉션 수정 실패....");			
			model.addObject("location", "mypage/collection/write");
			model.setViewName("/common/msg");	
		}
		
		return model;
	}
	
/*
		
	// ▼ 컬렉션 디테일 페이지로 넘어가는 메소드 (모달창 아니고 주소로 넘어가기)
	@GetMapping("mypage/collection/detail")
	public String detail() {
		
		log.info("컬렉션 디테일 페이지로 이동 성공");
		
		return "mypage/collection/detail";
	}
	
	*/

}
