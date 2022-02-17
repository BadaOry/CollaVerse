package com.collaverse.mvc.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.collaverse.mvc.member.model.dao.MemberMapper;
import com.collaverse.mvc.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public Member login(String id, String password) {
		Member member = null;
		
		member = mapper.findMemberById(id);
		
		return member;
	}

	@Override
	public int save(Member member) {
		return 0;
	}
}

