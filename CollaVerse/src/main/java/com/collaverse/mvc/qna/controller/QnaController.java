package com.collaverse.mvc.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.collaverse.mvc.qna.model.Criteria;
import com.collaverse.mvc.qna.model.PageMakerDTO;
import com.collaverse.mvc.qna.model.Qna;
import com.collaverse.mvc.qna.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Autowired
	private QnaService qservice;
	
	/* 게시판 목록 페이지 접속(페이징 적용) */
    @GetMapping("/qnaList")
	public void qnaListGET(Model model, Criteria cri) {
    	
		log.info("qnaListGET");
		
		log.info("cri : " + cri);
		
		model.addAttribute("qlist", qservice.getListPaging(cri));
		
		int total = qservice.getTotal(cri);
		
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
	}
    
    @GetMapping("/option/qnaList5")
	public void qna5ListGET(Model model, Criteria cri) {
    	
		log.info("qna5ListGET");
		
		cri.setAmount(5);
		
		log.info("cri : " + cri);
		
		model.addAttribute("qlist", qservice.getListPaging(cri));
		
		int total = qservice.getTotal(cri);
		
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
	}
    
    @GetMapping("/option/qnaList10")
	public void qna10ListGET(Model model, Criteria cri) {
    	
		log.info("qna10ListGET");
		
		cri.setAmount(10);
		
		log.info("cri : " + cri);
		
		model.addAttribute("qlist", qservice.getListPaging(cri));
		
		int total = qservice.getTotal(cri);
		
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
	}
    
    @GetMapping("/option/qnaList20")
	public void qna20ListGET(Model model, Criteria cri) {
    	
		log.info("qna20ListGET");
		
		cri.setAmount(20);
		
		log.info("cri : " + cri);
		
		model.addAttribute("qlist", qservice.getListPaging(cri));
		
		int total = qservice.getTotal(cri);
		
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
	}
    
    @GetMapping("/option/qnaList30")
	public void qna30ListGET(Model model, Criteria cri) {
    	
		log.info("qna30ListGET");
		
		cri.setAmount(30);
		
		log.info("cri : " + cri);
		
		model.addAttribute("qlist", qservice.getListPaging(cri));
		
		int total = qservice.getTotal(cri);
		
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
	}
    
    @GetMapping("/option/qnaList40")
	public void qna40ListGET(Model model, Criteria cri) {
    	
		log.info("qna40ListGET");
		
		cri.setAmount(40);
		
		log.info("cri : " + cri);
		
		model.addAttribute("qlist", qservice.getListPaging(cri));
		
		int total = qservice.getTotal(cri);
		
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
	}
    
    /* 게시판 등록 페이지 접속 */
    @GetMapping("/enroll")
    public void qnaEnrollGET() {
        log.info("qna 등록 페이지 진입");
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
    @GetMapping("/read")
    public void qnaReadPageGET(int bno, Model model, Criteria cri, Qna qna) {
        
    	qservice.count(bno);
    	
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
    public String qnatestDeletePOST(int bno, RedirectAttributes rttr) {
        
        qservice.delete(bno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/qna/qnaList";
    }
}
