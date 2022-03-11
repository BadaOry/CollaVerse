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
	public List<MypagePCollection> getCollectionList(String id) {
		
//		int loginMemberMemberNo = loginMember.getNo();
////		String collectionMemberId = this.findCollectionById(loginMember);
		
		List<MypagePCollection> collectionList = null;
		
		log.info("[서비스 임플까지 loginMember 내용이 잘 왔는지 확인] {}", id);

		collectionList = mapper.getCollectionListY(id);
			
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
			log.info("[ServiceImpl] mypagePCollection 업데이트 할 VO의 내용 잘 가져오는지 확인 : {}", mypagePCollection);
			result = mapper.updateMypagePCollection(mypagePCollection);
			log.info("[ServiceImpl] mypagePCollection 업데이트 완료한 VO의 내용 잘 가져오는지 확인 : {}", mypagePCollection);
			
		} else {
			log.info("[ServiceImpl] mypagePCollection 객체 내용 잘 가져오는지 확인 : {}", mypagePCollection);
			result = mapper.insertMypagePCollection(mypagePCollection);
		}
		return result;
	}

	
	@Override
	public MypagePCollection findCollectionByNo(int cltNo) {
		
		
		return mapper.findCollectionByNo(cltNo);
	}

	
	@Override
	public int delete(MypagePCollection mypagePCollection) {
	
		return mapper.deleteMypagePCollection(mypagePCollection);
	}

	@Override
	public String getCollectionWriterNickname(String id) {
		
		return mapper.getCollectionWriterNickname(id);
	}

	@Override
	public int getCollectionWriterNo(String id) {
		
		return mapper.getCollectionWriterNo(id);
	}

	
	// ▼ 팔로우 중복방지 : FOLLOWER 테이블에서 체크
	@Override
	public int followerCheck(int toMemNo, int fromMemNo) {
		
		return mapper.followerCheck(toMemNo, fromMemNo);
	}

	
	// ▼ 팔로우 중복방지 : FOLLOWING 테이블에서 체크
	@Override
	public int followingCheck(int fromMemNo, int toMemNo) {
		
		return mapper.followingCheck(fromMemNo, toMemNo);
	}

}
