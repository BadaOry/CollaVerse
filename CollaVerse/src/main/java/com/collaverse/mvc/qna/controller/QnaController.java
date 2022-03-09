package com.collaverse.mvc.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.collaverse.mvc.qna.model.service.QnaService;
import com.collaverse.mvc.qna.model.vo.Criteria;
import com.collaverse.mvc.qna.model.vo.PageMakerDTO;
import com.collaverse.mvc.qna.model.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/qna")
@Controller
public class QnaController {

	@Autowired
	private QnaService qservice;
	
	/* 게시판 목록 페이지 접속(페이징 적용) */
    @GetMapping("/qnaList")
    public void qnaListGET(Model model, Criteria cri) {
        
        log.info("qnaListGET");
        
        model.addAttribute("qna", qservice.getListPaging(cri));
        
        int total = qservice.getTotal(cri);
        
        log.info("{}",total);
        
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        
        model.addAttribute("pageMaker", pageMake);
        
    }
    
    /* 게시판 등록 페이지 접속 */
    @GetMapping("/enroll")
    public void qnaEnrollGET() {
        
        log.info("게시판 등록 페이지 진입");
        
    }
    
    /* 게시판 등록 */
    @PostMapping("/enroll")
    public String qnaEnrollPOST(Qna qna, RedirectAttributes rttr) {
        
        log.info("Qna : " + qna);
        
        
        qservice.enroll(qna);
        
        rttr.addFlashAttribute("result", "enroll success");
        
        return "redirect:/qna/qnaList";
         
    }
    
    /* 게시판 조회 */
    @GetMapping("/get")
    public void qnaGetPageGET(int bno, Model model, Criteria cri, Qna qna) {
        
        model.addAttribute("pageInfo", qservice.getPage(bno));
        
        model.addAttribute("cri", cri);
        
        System.out.println(qna.getBno());
        
    }
    
    /* 수정 페이지 이동 */
    @GetMapping("/modify")
    public void qnaModifyGET(int bno, Model model, Criteria cri) {
        
        model.addAttribute("pageInfo", qservice.getPage(bno));
        
        model.addAttribute("cri", cri);
        
    }
    
    /* 페이지 수정 */
    @PostMapping("/modify")
    public String qnaModifyPOST(Qna qna, RedirectAttributes rttr) {
        
        qservice.modify(qna);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/qna/qnaList";
        
    }
    
    /* 페이지 삭제 */
    @PostMapping("/delete")
    public String qnaDeletePOST(int bno, RedirectAttributes rttr) {
        
        qservice.delete(bno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/qna/qnaList";
    }
}
