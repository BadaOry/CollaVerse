package com.collaverse.mvc.qna.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.qna.model.dao.QnaMapper;
import com.collaverse.mvc.qna.model.vo.Criteria;
import com.collaverse.mvc.qna.model.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaMapper mapper;
	
	/* 게시판 등록 */
	@Override
	public void enroll(Qna qna) {
		
		mapper.enroll(qna);
	}

	/* 게시판 목록 */
	@Override
	public List<Qna> getList() {
		
		return mapper.getList();
	}
	
	/* 게시판 목록(페이징 적용) */
	@Override
	public List<Qna> getListPaging(Criteria cri) {
		
		return mapper.getListPaging(cri);
	}
	
	/* 게시판 조회 */
	@Override
	public Qna getPage(int bno) {
		
		return mapper.getPage(bno);
	}
	
	/* 게시판 수정 */
    @Override
    public int modify(Qna qna) {
        
        return mapper.modify(qna);
    }
    
    /* 게시판 삭제 */
    @Override
    public int delete(int bno) {
        
        return mapper.delete(bno);
    }
    
    /* 게시물 총 갯수 */
    @Override
    public int getTotal(Criteria cri) {
        
        return mapper.getTotal(cri);
    } 

}
