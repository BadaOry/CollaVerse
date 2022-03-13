package com.collaverse.mvc.reply.service;

import java.util.List;

import com.collaverse.mvc.reply.model.Reply;

public interface ReplyService {

	// 댓글 조회
	public List<Reply> readReply(int bno);
	
	// 댓글 쓰기
	public void writeReply(Reply vo);
}
