package com.collaverse.mvc.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.collaverse.mvc.member.model.dao.MemberMapper;
import com.collaverse.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		
//		return member != null && 
//				passwordEncoder.matches(password, member.getPassword()) ? member : null; //로그인 클릭 했을 때 암호화 비번이랑 맞는지 확인 (삼항연산자 사용)
//		-> null이 아니면서 매치함수를 사용하여 원문비번과, 사용자가 입력한 멤버객체에 저장된 비번과 비교해서 true를 리턴하면 멤버객체 false를 리턴하면 null값을 준다
		return member; // 로그인 시 암호화가 되어있어 원래 비밀번호를 입력하려면 이 코드, 암호화 비번을 입력하려면 위 두 줄을 입력한다.
	}

	// 개인 회원가입
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
	
	// 기업 회원가입
	@Override
	public int savebusiness(Member member) {
		
		int result = 0;
		
		if(member.getNo() != 0) {
			result = mapper.updateMember_business(member); // 회원정보수정
		} else {
			member.setPassword(passwordEncoder.encode(member.getPassword())); // 비밀번호 암호화
			
			result = mapper.insertBusinessMember(member);
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
		
		log.info("[ServiceImpl] 까지 잘 오는지 확인 : {}", email);
		
		return mapper.findId(email);
	}
	
	@Override
	public Member findIdResult(String email) {
		
		log.info("[ServiceImpl] 까지 잘 오는지 확인 : {}", email);
	
		return mapper.findId(email);
	}

	// pw 찾기
	@Override
	public Member findPw(String id) {
		
		log.info("[ServiceImpl] 까지 잘 오는지 확인 : {}", id);
		
		return mapper.findPw(id);
	}

	@Override
	public Member findPwResult(String id) {
		
		return mapper.findPw(id);
	}

	
	// 사업자등록번호 중복확인
	@Override
	public Boolean isDuplicatedBusiness_no(String business_no) {
		
		return mapper.findMemberByBusiness_no(business_no) != null;
	}
	
	// 닉네임 중복확인
	@Override
	public Boolean isDuplicateNickname(String nickname) {
		
		return mapper.findMemberByNickname(nickname) != null;
	}
	
	// 통계용 여 회원정보
	@Override
	public int getWomenCount(int memberNo) {

		return mapper.getWomenCount(memberNo);
	}
	
	// 통계용 남 회원정보
	@Override
	public int getMenCount(int memberNo) {

		return mapper.getMenCount(memberNo);
	}

	// 통계용 10대 정보
	@Override
	public int getTeenagerCount(int memberNo) {
		
		return mapper.getTeenagerCount(memberNo);
	}
	
	// 통계용 20대 정보
	@Override
	public int getTwentiesCount(int memberNo) {
		
		return mapper.getTwentiesCount(memberNo);
	}
	
	// 통계용 30대 정보
	@Override
	public int getThirtiesCount(int memberNo) {
		
		return mapper.getThirtiesCount(memberNo);
	}
	
	// 통계용 40대 정보
	@Override
	public int getFortiesCount(int memberNo) {
		
		return mapper.getFortiesCount(memberNo);
	}
	
	// 통계용 50대 정보
	@Override
	public int getFiftiesCount(int memberNo) {
		
		return mapper.getFiftiesCount(memberNo);
	}
	
	// 통계용 그 외 나이 정보
	@Override
	public int getEtcCount(int memberNo) {
		
		return mapper.getEtcCount(memberNo);
	}
	
	// 통계용 토탈 합 정보
	@Override
	public int getTotalCount(int memberNo) {
		
		return mapper.getTotalCount(memberNo);
	}

	
	// 1일 전 팔로우
	@Override
	public int getYesterday1Count(int memberNo) {
		
		return mapper.getYesterday1Count(memberNo);
	}
	
	// 2일 전 팔로우
	@Override
	public int getYesterday2Count(int memberNo) {
		
		return mapper.getYesterday2Count(memberNo);
	}
	
	// 3일 전 팔로우
	@Override
	public int getYesterday3Count(int memberNo) {
		
		return mapper.getYesterday3Count(memberNo);
	}
	
	// 4일 전 팔로우
	@Override
	public int getYesterday4Count(int memberNo) {
		
		return mapper.getYesterday4Count(memberNo);
	}
	
	// 5일 전 팔로우
	@Override
	public int getYesterday5Count(int memberNo) {
		
		return mapper.getYesterday5Count(memberNo);
	}
	
	// 6일 전 팔로우
	@Override
	public int getYesterday6Count(int memberNo) {
		
		return mapper.getYesterday6Count(memberNo);
	}
	
	// 7일 전 팔로우
	@Override
	public int getYesterday7Count(int memberNo) {
		
		return mapper.getYesterday7Count(memberNo);
	}
	

	// 비밀번호 변경(작성중)
	@Override
	public Object findMemberByPw(String password) {
		
		return mapper.updatePwd(password);
	}
	
	
	
}

