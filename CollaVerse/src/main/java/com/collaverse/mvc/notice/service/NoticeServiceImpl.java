package com.collaverse.mvc.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.notice.mapper.NoticeMapper;
import com.collaverse.mvc.notice.model.Criteria;
import com.collaverse.mvc.notice.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper mapper;

	/* 등록 */
	@Override
	public void enroll(Notice notice) {
		mapper.enroll(notice);
		
	}

	/* 목록 */
	@Override
	public List<Notice> getList() {
		return mapper.getList();
	}

	/* 목록(페이징) */
	@Override
	public List<Notice> getListPaging(Criteria cri) {
		return mapper.getListPaging(cri);
	}

	/* 조회 */
	@Override
	public Notice getPage(int bno) {
		return mapper.getPage(bno);
	}

	/* 조회수 */
	@Override
	public int count(int bno) {
		return mapper.count(bno);
	}

	/* 수정 */
	@Override
	public int modify(Notice notice) {
		return mapper.modify(notice);
	}

	/* 삭제 */
	@Override
	public int delete(int bno) {
		return mapper.delete(bno);
	}

	/* 총 갯수 */
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

}
