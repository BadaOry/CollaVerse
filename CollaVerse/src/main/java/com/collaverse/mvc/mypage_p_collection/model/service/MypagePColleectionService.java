package com.collaverse.mvc.mypage_p_collection.model.service;

import java.util.List;

import com.collaverse.mvc.common.util.PageInfo;
import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;;

public interface MypagePColleectionService {

	int getCollectionCount();

	List<MypagePCollection> getCollectionList(PageInfo pageInfo);

	int save(MypagePCollection mypagePCollection);


}
