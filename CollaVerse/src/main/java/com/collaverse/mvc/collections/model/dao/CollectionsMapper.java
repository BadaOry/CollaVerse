package com.collaverse.mvc.collections.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.collaverse.mvc.collections.model.vo.Collections;
import com.collaverse.mvc.member.model.vo.Member;

@Mapper
public interface CollectionsMapper {

	List<Collections> getAllUserIdList();

	List<Collections> findUserById(String keyword);

	List<Collections> findUserByNickname(String keyword);

}
