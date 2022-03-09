package com.collaverse.mvc.mypage_p_collection.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.collaverse.mvc.member.model.vo.Member;
import com.collaverse.mvc.mypage_p_collection.model.vo.MypagePCollection;

@Mapper
public interface MypagePCollectionMapper {

	List<MypagePCollection> getCollectionListY(String id);

	int insertMypagePCollection(MypagePCollection mypagePCollection);

	MypagePCollection updateMypagePCollection(int cltNo);

	int updateMypagePCollection(MypagePCollection mypagePCollection);

	MypagePCollection findCollectionByNo(int cltNo);

	int deleteMypagePCollection(MypagePCollection mypagePCollection);

	String getCollectionWriterNickname(String id);

}
