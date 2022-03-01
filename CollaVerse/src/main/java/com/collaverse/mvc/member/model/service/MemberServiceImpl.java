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
	
	// 비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//로그인
	@Override
	public Member findMemberById(String id) {
		
		return mapper.findMemberById(id);
	}
	
	@Override
	public Member login(String id, String password) {
		Member member = null;
		
		member = mapper.findMemberById(id);
		
		return member != null && 
				passwordEncoder.matches(password, member.getPassword()) ? member : null; //로그인 클릭 했을 때 암호화 비번이랑 맞는지 확인 (삼항연산자 사용)
//		return member; //암호화 하지 않으려면 이 코드를 넣고, 위 두줄은 막는다
	}

	// 회원가입
	@Override
	@Transactional
	public int save(Member member) {
		int result = 0;
		
		if(member.getNo() != 0) {
			result = mapper.updateMember(member); // 회원정보수정
		} else {
			member.setPassword(passwordEncoder.encode(member.getPassword())); // 비밀번호 암호화
			
			result = mapper.insertMember(member);
		}
		return result;
	}

	// id 중복확인
	@Override
	public Boolean isDuplicateID(String id) {
		
		return mapper.findMemberById(id) != null;
	}
	
	// 회원탈퇴
	@Override
	public int delete(int no) {
		
		return mapper.deleteMember(no);
	}

	// id 찾기
	@Override
	public Member findId(String email) {
		
		return mapper.findId(email);
	}
	
	@Override
	public Member findIdResult(String email) {
		
		return mapper.findId(email);
	}

	// pw 찾기
	@Override
	public Member findPwResult(String email, String id) {
		
		return mapper.findPw(id, email);
	}

	@Override
	public Member findPw(String id, String email) {
		
		return mapper.findPw(id, email);
	}

	
	// 사업자등록번호 중복확인
	@Override
	public Boolean isDuplicatedBusiness_no(String business_no) {
		
		return mapper.findMemberByBusiness_no(business_no) != null;
	}
	

	
}

