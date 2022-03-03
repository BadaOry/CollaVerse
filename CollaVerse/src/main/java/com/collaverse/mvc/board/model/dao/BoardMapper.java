package com.collaverse.mvc.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.collaverse.mvc.board.model.vo.Board;

@Mapper
public interface BoardMapper {
	
	/* 게시판 등록 */
	public void enroll(Board board);
	
	int getBoardCount();
	
	List<Board> findAll(RowBounds rowBounds);
}
