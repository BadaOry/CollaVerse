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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.collaverse.mvc.common.util.FileProcess;
import com.collaverse.mvc.common.util.PageInfo;
import com.collaverse.mvc.member.model.service.MemberService;
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
	
	// ▼ 마이컬렉션 메뉴에서 보는 collectionList
	@GetMapping("mypage/collection/list/{id}") 
	public ModelAndView Collectionlist(ModelAndView model,
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			@PathVariable("id") String id) {
		
		List<MypagePCollection> collectionList = null;
		String noCollectionList = null;
		String noWriterId = null;
		String writerNickname = null;
		int writerNo = 0;
		int fromMemNo = 0;

		
		
		writerNo = service.getCollectionWriterNo(id);
		int toMemNo = writerNo;
		
		writerNickname = service.getCollectionWriterNickname(id);
		
		log.info("[Controller] service 가 가져온 writerNickname 출력 : {}", writerNickname);

		collectionList = service.getCollectionList(id);
		
		// list 에 아무것도 없는 경우, IndexOutOfBoundsException: Index 0 out of bounds for length 0 에러 방지
		if (collectionList.size() == 0) { 
			noCollectionList = "없음";
			noWriterId = id;
			
			log.info("[Controller] noCollectionList 출력 : {}", noCollectionList);
		}
		
		
		// 3. followCheck 처리하기
		int followerCheck = 0;
		int followingCheck = 0;
		
		// 로그인 여부에 따라 fromMemNo 에 값을 넣어주는 코드
		if( loginMember != null) {
			
			fromMemNo = loginMember.getNo();
			
			
			if( loginMember != null) {
				followerCheck = service.followerCheck(toMemNo, fromMemNo);
				followingCheck = service.followingCheck(fromMemNo, toMemNo);
				
				log.info("[Controller] followCheck & FollowingCheck : {} & {}", followerCheck, followingCheck);	
				
			}
		} else {
			
		}
		
		model.addObject("collectionList", collectionList);
		model.addObject("noCollectionList", noCollectionList);
		model.addObject("noWriterId", noWriterId);
		model.addObject("writerNickname", writerNickname);
		model.addObject("writerNo", writerNo);
		model.addObject("followerCheck", followerCheck);
		model.addObject("followingCheck", followingCheck);
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
					
					try {
						location = resourceLoader.getResource("resources/upload/collection").getFile().getPath();						
						renamedFileName = FileProcess.save(mf, location);
						
						log.info("[Controller] FileProcess 에서 가져온 renamedFileName 출력 : {}", renamedFileName);									
						
						if (renamedFileName != null) {
							mypagePCollection.setOriginalFileName01(originalFileName);
							mypagePCollection.setRenamedFileName01(renamedFileName);
							
							log.info("[Controller] originalFileNam 정보 확인 : {}", originalFileName);
							log.info("[Controller] renamedFileName 정보 확인 : {}", renamedFileName);
							
						}
					} catch (IOException e) {
						System.out.println("renamedFileName 불러오기 실패..");
						e.printStackTrace();
					}
					
				}
			}
			
			
			// 2. 작성한 게시글 내용을 VO 에 set
			mypagePCollection.setCltContent(content);
			
			
			// 3. 작성자의 아이디를 VO 에 set
			mypagePCollection.setCltWriterId(loginMember.getId());
			log.info("[Controller] VO 정보 확인 : {}", mypagePCollection.getCltWriterId());
			
			
			// 4. 작성자의 회원번호를 VO 에 set
			mypagePCollection.setCltMemberNo(loginMember.getNo());
			log.info("[Controller] VO 정보 확인 : {}", mypagePCollection.getCltMemberNo());
			
			log.info("[Controller] content VO 에 잘 set 되었는지 확인 : {}", mypagePCollection);
			
			// 5. 작성한 게시글 데이터를 데이터베이스에 저장
			result = service.save(mypagePCollection);
			
			if(result > 0) {
				model.setViewName("redirect:list/" + loginMember.getId());
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
			@RequestParam("cltNo") int cltNo, 
			@RequestParam("content") String updatecontent, 
			@RequestParam("upfile") List<MultipartFile> upfile,
			ModelAndView model) {
		
		MypagePCollection mypagePCollection = service.findCollectionByNo(cltNo);
		
		log.info("[Controller] update 할 컬렉션의 정보 출력 : {}", mypagePCollection);
	
		log.info("[Controller] update 할 컬렉션의 cltNo 를 잘 받아왔는지 출력 : {}", cltNo);
		log.info("[Controller] update 할 컬렉션의 cltContent 를 잘 받아왔는지 출력 : {}", updatecontent);
		log.info("[Controller]  update 할 컬렉션의 cltNo 를 잘 받아왔는지 출력 : {}", upfile);
		
		if(upfile != null) {
			log.info("upfile 이 생겨서 업데이트 하려고 함");
			
			for (MultipartFile mf : upfile) {
				String originalFileName = mf.getOriginalFilename();
				boolean upfileIsEmpty = mf.isEmpty();
				
				log.info("[Controller] originalFileName 확인 : {}", originalFileName);
				log.info("[Controller] upfile is Empty 확인 : {}", upfileIsEmpty);
				
				
				// 1. 파일을 업로드 했는지 확인 후, rename 하여 VO 에 set & 지정 위치에 upfile 저장
				if (mf != null && !mf.isEmpty()) {
					String location = null;
					String renamedFileName = null;					
					
					try {
						location = resourceLoader.getResource("resources/upload/collection").getFile().getPath();						
						renamedFileName = FileProcess.save(mf, location);
						
						log.info("[Controller] FileProcess 에서 가져온 renamedFileName 출력 : {}", renamedFileName);									
						
						if (renamedFileName != null) {
							mypagePCollection.setOriginalFileName01(originalFileName);
							mypagePCollection.setRenamedFileName01(renamedFileName);
							
							log.info("[Controller] originalFileNam 정보 확인 : {}", originalFileName);
							log.info("[Controller] renamedFileName 정보 확인 : {}", renamedFileName);
							
						}
					} catch (IOException e) {
						System.out.println("renamedFileName 불러오기 실패..");
						e.printStackTrace();
					}
					
				}
			}
			
		}

		
		// 2. 업데이트 할 clt 내용 set
		mypagePCollection.setCltContent(updatecontent);
		
		log.info("[Controller] content 내용이 update 된 컬렉션의 정보 출력 : {}", mypagePCollection);
		
		
		// 3. update 된 내용의 mypagePCollection 저장
		int result = 0;
		
		result= service.save(mypagePCollection);
		log.info("[Controller] update 완료된 컬렉션의 정보 출력 : {}", mypagePCollection);
		
		if(result > 0) {
			model.setViewName("redirect:list/" + loginMember.getId());
		} else {
			model.addObject("msg", "컬렉션 수정 실패....");			
			model.addObject("location", "mypage/collection/write");
			model.setViewName("/common/msg");	
		}
		
		return model;
	}
	

		
	// ▼ 모달에서 삭제 버튼을 눌렀을 때, 베이비 모달에서 예 클릭시 실행되는 메소드
	@GetMapping("mypage/collection/delete")
	public ModelAndView delete(@RequestParam("cltNo") int cltNo, 
			@SessionAttribute("loginMember") Member loginMember, ModelAndView model) {
		
		log.info("컬렉션 삭제 컨트롤러로 이동 성공, ctlNo : {}", cltNo);
		
		MypagePCollection mypagePCollection = service.findCollectionByNo(cltNo);
		
		log.info("[Controller] delete 할 컬렉션의 정보 출력 : {}", mypagePCollection);
		
		int result = 0;
		
		result= service.delete(mypagePCollection);
		log.info("[Controller] delete 완료된 컬렉션의 정보 출력 : {} /{}", mypagePCollection.getCltStatus(), mypagePCollection);
		
		
		if(result > 0) {
			model.setViewName("redirect:list/" + loginMember.getId());
		} else {
			model.addObject("msg", "컬렉션 수정 실패....");			
			model.addObject("location", "mypage/collection/write");
			model.setViewName("/common/msg");	
		}
		
		return model;
	}
	

}
