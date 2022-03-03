package com.collaverse.mvc.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.board.model.dao.BoardMapper;
import com.collaverse.mvc.board.model.vo.Board;
import com.collaverse.mvc.common.util.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper mapper;
	
	/* 게시판 등록 */
	@Override
	public void enroll(Board board) {
		
		mapper.enroll(board);
		
	}
	
	@Override
	public int getBoardCount() {
		return mapper.getBoardCount();
	}
	
	@Override
	public List<Board> getBoardList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage()-1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findAll(rowBounds);
	}
}
