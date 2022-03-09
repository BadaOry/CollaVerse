package com.collaverse.mvc.qna.model.service;

import java.util.List;

import com.collaverse.mvc.qna.model.vo.Criteria;
import com.collaverse.mvc.qna.model.vo.Qna;

public interface QnaService {

	/* 게시판 등록 */
    public void enroll(Qna qna);
    
    /* 게시판 목록 */
    public List<Qna> getList();
    
	 /* 게시판 목록(페이징 적용) */
    public List<Qna> getListPaging(Criteria cri);
    
    /* 게시판 조회 */
    public Qna getPage(int bno);
    
    /* 게시판 수정 */
    public int modify(Qna board);
    
    /* 게시판 삭제 */
    public int delete(int bno);
    
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
}
