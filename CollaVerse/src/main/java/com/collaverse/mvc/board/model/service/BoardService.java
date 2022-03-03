package com.collaverse.mvc.board.model.service;

import java.util.List;

import com.collaverse.mvc.board.model.vo.Board;
import com.collaverse.mvc.common.util.PageInfo;

public interface BoardService {
	
	/* 게시판 등록 */
	public void enroll(Board board);

	int getBoardCount();
	
	List<Board> getBoardList(PageInfo pageInfo);
}
