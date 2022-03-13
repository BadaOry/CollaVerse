package com.collaverse.mvc.qna.mapper;

import java.util.List;

import com.collaverse.mvc.qna.model.Criteria;
import com.collaverse.mvc.qna.model.Qna;

public interface QnaMapper {

	/* 게시글 등록 */
    public void enroll(Qna qna);
    
    /* 게시판 목록 */
    public List<Qna> getList();
    
    /* 게시판 목록(페이징 적용) */
    public List<Qna> getListPaging(Criteria cri);
    
    /* 게시판 조회 */
    public Qna getPage(int bno);
    
    /* 조회수 수정 */
    public int count(int bno);
    
    /* 게시판 수정 */
    public int modify(Qna qna);
    
    /* 게시판 삭제 */
    public int delete(int bno);
    
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
    
}
