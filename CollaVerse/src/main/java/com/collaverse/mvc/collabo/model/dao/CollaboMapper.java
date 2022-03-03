package com.collaverse.mvc.collabo.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.collaverse.mvc.collabo.model.vo.Promotion;

@Mapper
public interface CollaboMapper {

//	List<Promotion> pmtMainList(); 

	List<Promotion> selectAll();

//	Promotion selectAll();

//	int getPromotionCount();

//	List<Promotion> selectAll(RowBounds rowBounds);

//	Promotion selectPromotionByNo(@Param("no") int no);

}
