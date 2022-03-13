package com.collaverse.mvc.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.reply.mapper.ReplyMapper;
import com.collaverse.mvc.reply.model.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public List<Reply> readReply(int bno) {
		return mapper.readReply(bno);
	}

	@Override
	public void writeReply(Reply vo) {
		mapper.writeReply(vo);
	}
}
