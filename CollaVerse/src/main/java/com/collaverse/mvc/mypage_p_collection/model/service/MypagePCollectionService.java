package com.collaverse.mvc.mypage_p_collection.model.service;

import java.util.List;

import com.collaverse.mvc.common.util.PageInfo;
import com.collaverse.mvc.member.model.vo.Member;
import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;;

public interface MypagePCollectionService {

//	int getCollectionCount();

	List<MypagePCollection> getCollectionList(Member loginMember);

	int save(MypagePCollection mypagePCollection);

//	String findCollectionById(Member loginMember);

//	int save(MypagePCollection mypagePCollection);


}
