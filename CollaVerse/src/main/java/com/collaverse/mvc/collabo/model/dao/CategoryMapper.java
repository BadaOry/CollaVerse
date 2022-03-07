package com.collaverse.mvc.collabo.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.collaverse.mvc.collabo.model.vo.Promotion;

@Mapper
public interface CategoryMapper {

	List<Promotion> selectLiving();

}
