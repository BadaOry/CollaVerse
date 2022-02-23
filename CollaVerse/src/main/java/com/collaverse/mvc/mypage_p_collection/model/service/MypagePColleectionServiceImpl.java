package com.collaverse.mvc.mypage_p_collection.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.common.util.PageInfo;
import com.collaverse.mvc.mypage_p_collection.model.dao.MypagePCollectionMapper;
import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;

@Service
public class MypagePColleectionServiceImpl implements MypagePColleectionService {

	@Autowired
	private MypagePCollectionMapper mapper;
	

	@Override
	public int getCollectionCount() {
		
		return mapper.getCollectionCount();
	}

	@Override
	public List<MypagePCollection> getCollectionList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		
		return mapper.findAll(rowBounds);
	}

	@Override
	public int save(MypagePCollection mypagePCollection) {
		int result = 0;
		
		if(mypagePCollection.getCltNo() != 0) {
			//update
		} else {
			result = mapper.insertCollection(mypagePCollection);
		}
		return result;
	}


}
