package com.collaverse.mvc.dao;

import com.collaverse.mvc.domain.Criteria;

public class BoardDao {
	
	public int totalCnt(Criteria cri) {
		System.out.println("===> Mybatis로 totalCnt");
		return mybatis.selectOne("BoardMapper.getTotalCnt",cri);
	}
}
