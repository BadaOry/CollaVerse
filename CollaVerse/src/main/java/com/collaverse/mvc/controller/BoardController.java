package com.collaverse.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.collaverse.mvc.domain.BoardVo;
import com.collaverse.mvc.domain.Criteria;

@Controller
@SessionAttributes("board")
public class BoardController {

	//글 목록
	@RequestMapping("/getBoardList.do")
	public String getBoardList(Criteria cri, Model model) {
		
		List<BoardVo> boardList = boardService.getBoardList(cri);
		
		int total = boardService.totalCnt(cri);
		// Model 정보 저장
		model.addAttribute("boardList",boardList);
		model.addAttribute("paging",new PageMaker(cri,total));
		return "boardList"; // View 이름 리턴
	}
	
	// 글 상세 조회
	@RequestMapping("/getContent.do")
	public String getBoard(BoardVo vo, Model model, @ModelAttribute("cri") Criteria cri) throws Exception{
		model.addAttribute("board", boardService.getContent(vo)); // Model 정보 저장
		return "content"; // View 이름 리턴
	}
}
