package com.collaverse.mvc.mypage_p_collection.model.service;

import java.util.List;

import com.collaverse.mvc.common.util.PageInfo;
import com.collaverse.mvc.member.model.vo.Member;
import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;;

public interface MypagePCollectionService {


	List<MypagePCollection> getCollectionList(String id);

	
	int save(MypagePCollection mypagePCollection);

	
	MypagePCollection findCollectionByNo(int cltNo);

	
	int delete(MypagePCollection mypagePCollection);

	
	String getCollectionWriterNickname(String id);



}
