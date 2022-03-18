package com.collaverse.mvc.notice.service;

import java.util.List;

import com.collaverse.mvc.notice.model.Criteria;
import com.collaverse.mvc.notice.model.Notice;

public interface NoticeService {

	/* 게시글 등록 */
    public void enroll(Notice notice);
    
    /* 게시판 목록 */
    public List<Notice> getList();
    
    /* 게시판 목록(페이징 적용) */
    public List<Notice> getListPaging(Criteria cri);
    
    /* 게시판 조회 */
    public Notice getPage(int bno);
    
    /* 조회수 수정 */
    public int count(int bno);
    
    /* 게시판 수정 */
    public int modify(Notice notice);
    
    /* 게시판 삭제 */
    public int delete(int bno);
    
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
}
