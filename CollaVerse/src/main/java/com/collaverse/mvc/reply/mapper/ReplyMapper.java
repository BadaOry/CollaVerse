package com.collaverse.mvc.reply.mapper;

import java.util.List;

import com.collaverse.mvc.reply.model.Reply;

public interface ReplyMapper {

	// 댓글조회
	public List<Reply> readReply(int bno);
	
	// 댓글 쓰기
	public void writeReply(Reply vo);
}
