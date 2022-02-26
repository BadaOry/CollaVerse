package com.collaverse.mvc.mypage_p_collection.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.common.util.PageInfo;
import com.collaverse.mvc.member.model.vo.Member;
import com.collaverse.mvc.mypage_p_collection.model.dao.MypagePCollectionMapper;
import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MypagePCollectionServiceImpl implements MypagePCollectionService {

	@Autowired
	private MypagePCollectionMapper mapper;

	@Override
	public List<MypagePCollection> getCollectionList(Member loginMember) {
		
		int loginMemberMemberNo = loginMember.getNo();
//		String collectionMemberId = this.findCollectionById(loginMember);
		
		List<MypagePCollection> collectionList = null;
		
		log.info("[서비스 임플까지 loginMember 내용이 잘 왔는지 확인] {}", loginMemberMemberNo);

			collectionList = mapper.getCollectionListY(loginMemberMemberNo);
			
//		// ▼ 로그인멤버와 데이터베이스의 멤버가 맞으면, YP 를 가져오는 쿼리문 실행
//		if (loginMemberMemberId.equals(collectionMemberId)) {
//			collectionList = mapper.getCollectionListYP(loginMemberMemberId);
//			log.info("[서비스 임플에서 리스트YP 잘 받아왔는지 확인] {}", collectionList);
//			
//		} else {
//			// ▼ 아니면 다 보여주기 
//			collectionList = mapper.getCollectionListY(loginMemberMemberId);
//		}
		
		return collectionList;
	}

	@Override
	public int save(MypagePCollection mypagePCollection) {
		int result = 0;
		
		if(mypagePCollection.getCltNo() != 0) {
			// 정보 수정하는 쿼리
			// result = mapper.updateMypagePCollection(mypagePCollection);
		} else {
			result = mapper.insertMypagePCollection(mypagePCollection);
		}
		return result;
	}
	
//	public String findCollectionById(Member loginMember) {
//			
//		String loginMemberMemberId = loginMember.getId();
//		String collectionMemberId = mapper.findCollectionById(loginMemberMemberId);
//				
//		return collectionMemberId;
//		
//	}
	

//	@Override
//	public int getCollectionCount() {
//		
//		return mapper.getCollectionCount();
//	}
//
//	@Override
//	public List<MypagePCollection> getCollectionList(PageInfo pageInfo) {
//		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
//		int limit = pageInfo.getListLimit();
//		RowBounds rowBounds = new RowBounds(offset, limit);
//
//		
//		return mapper.findAll(rowBounds);
//	}
//
//	@Override
//	public int save(MypagePCollection mypagePCollection) {
//		int result = 0;
//		
//		if(mypagePCollection.getCltNo() != 0) {
//			//update
//		} else {
//			result = mapper.insertCollection(mypagePCollection);
//		}
//		return result;
//	}


}
