package com.collaverse.mvc.domain;

import java.util.Date;
import java.util.List;

public class BoardVo {
	
	private int idx;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private int cnt;
	
	private List<FileVO> fileList;
	
}
