package com.collaverse.mvc.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.collaverse.mvc.board.model.service.BoardService;
import com.collaverse.mvc.board.model.vo.Board;
import com.collaverse.mvc.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/boardList")
	public ModelAndView list(
			ModelAndView model,
			@RequestParam(defaultValue = "1") int page,/*null이 넘어오면 에러나서 디폴트벨류 추가*/
			@RequestParam(defaultValue = "10") int count )  {
		PageInfo pageInfo = null;
		List<Board> boardList = null;
		
		log.info("{}", page);
		
		pageInfo = new PageInfo(page, 10, service.getBoardCount(), count);
		boardList = service.getBoardList(pageInfo);
		
		System.out.println(pageInfo.getListLimit());
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("boardList", boardList);
			
		model.setViewName("board/boardList");
		
		return model;
	}
	
	@GetMapping("/optionList/boardList5")
	public ModelAndView list5(
			ModelAndView model,
			@RequestParam(defaultValue = "1") int page,/*null이 넘어오면 에러나서 디폴트벨류 추가*/
			@RequestParam(defaultValue = "5") int count )  {
		PageInfo pageInfo = null;
		List<Board> boardList = null;
		
		log.info("{}", page);
		
		pageInfo = new PageInfo(page, 10, service.getBoardCount(), 5);
		boardList = service.getBoardList(pageInfo);
		
		System.out.println(pageInfo.getListLimit());
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("boardList", boardList);
		
		
		model.setViewName("board/optionList/boardList5");
		
		return model;
	}
	
	@GetMapping("/optionList/boardList10")
	public ModelAndView list10(
			ModelAndView model,
			@RequestParam(defaultValue = "1") int page,/*null이 넘어오면 에러나서 디폴트벨류 추가*/
			@RequestParam(defaultValue = "10") int count )  {
		PageInfo pageInfo = null;
		List<Board> boardList = null;
		
		log.info("{}", page);
		
		pageInfo = new PageInfo(page, 10, service.getBoardCount(), 10);
		boardList = service.getBoardList(pageInfo);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("boardList", boardList);
		
		model.setViewName("board/optionList/boardList5");
		
		return model;
	}
	
	@GetMapping("/optionList/boardList20")
	public ModelAndView list20(
			ModelAndView model,
			@RequestParam(defaultValue = "1") int page,/*null이 넘어오면 에러나서 디폴트벨류 추가*/
			@RequestParam(defaultValue = "20") int count )  {
		PageInfo pageInfo = null;
		List<Board> boardList = null;
		
		log.info("{}", page);
		
		pageInfo = new PageInfo(page, 10, service.getBoardCount(), 20);
		boardList = service.getBoardList(pageInfo);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("boardList", boardList);
		
		model.setViewName("board/optionList/boardList20");
		
		return model;
	}
	
	@GetMapping("/optionList/boardList30")
	public ModelAndView list30(
			ModelAndView model,
			@RequestParam(defaultValue = "1") int page,/*null이 넘어오면 에러나서 디폴트벨류 추가*/
			@RequestParam(defaultValue = "30") int count )  {
		PageInfo pageInfo = null;
		List<Board> boardList = null;
		
		log.info("{}", page);
		
		pageInfo = new PageInfo(page, 10, service.getBoardCount(), 30);
		boardList = service.getBoardList(pageInfo);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("boardList", boardList);
		
		model.setViewName("board/optionList/boardList30");
		
		return model;
	}
	
	@GetMapping("/optionList/boardList40")
	public ModelAndView list40(
			ModelAndView model,
			@RequestParam(defaultValue = "1") int page,/*null이 넘어오면 에러나서 디폴트벨류 추가*/
			@RequestParam(defaultValue = "40") int count )  {
		PageInfo pageInfo = null;
		List<Board> boardList = null;
		
		log.info("{}", page);
	
		pageInfo = new PageInfo(page, 10, service.getBoardCount(), 40);
		boardList = service.getBoardList(pageInfo);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("boardList", boardList);

		model.setViewName("board/optionList/boardList40");
		
		return model;
	}
	
	// 게시글 등록창으로 이동
	@GetMapping("/enroll")
	public String enroll() {
		
		return "board/enroll";
	}
	
	@PostMapping("/enroll")
	public String enrollPOST(Board board,
							RedirectAttributes redirectAttributes) {
		service.enroll(board);
		redirectAttributes.addFlashAttribute("result", "enroll success");
		return "board/boardList";
	}
	
}
