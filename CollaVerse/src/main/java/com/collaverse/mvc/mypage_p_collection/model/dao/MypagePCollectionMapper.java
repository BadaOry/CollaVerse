package com.collaverse.mvc.mypage_p_collection.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;

@Mapper
public interface MypagePCollectionMapper {

	int getCollectionCount();

	List<MypagePCollection> findAll(RowBounds rowBounds);

	int insertCollection(MypagePCollection mypagePCollection);

}
