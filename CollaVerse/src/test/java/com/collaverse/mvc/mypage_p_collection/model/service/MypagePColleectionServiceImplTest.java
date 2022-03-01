package com.collaverse.mvc.mypage_p_collection.model.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;

import com.collaverse.mvc.member.model.vo.Member;
import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;

import lombok.extern.slf4j.Slf4j;

import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;

@Slf4j
@DisplayName("MypagePCollection 테스트")
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)

class MypagePColleectionServiceImplTest {

	
	@Autowired
	private MypagePColleectionService service;
	
	@Autowired
	private Member member;

	@Test
	@DisplayName("컬렉션 리스트 조회")
	@Order(1)
	void CollectionListTest(Member loginMember) {
//		List<MypagePCollection> collectionList = null;
		
		loginMember.setNo(21);
		
//		collectionList = service.getCollectionList(loginMember);
		
		
//		log.info("[테스트][컬렉션 리스트] list : {}", collectionList);
		log.info("[테스트][로그인 회원 정보] {}", loginMember);
		

//		collectionList = service.getCollectionList(loginMember);
		
		assertThat(loginMember.getNo()).isNotNull();
	}

}
