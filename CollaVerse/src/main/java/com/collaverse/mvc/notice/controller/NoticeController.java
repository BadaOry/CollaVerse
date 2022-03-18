package com.collaverse.mvc.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.collaverse.mvc.notice.model.Criteria;
import com.collaverse.mvc.notice.model.Notice;
import com.collaverse.mvc.notice.model.PageMakerDTO;
import com.collaverse.mvc.notice.service.NoticeService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService nservice;
	
	/* 게시판 목록 페이지 접속(페이징 적용) */
    @GetMapping("/noticeList")
   public void noticeListGET(Model model, Criteria cri) {
       
      log.info("noticeListGET");
      
      log.info("cri : " + cri);
      
      model.addAttribute("nlist", nservice.getListPaging(cri));
      
      int total = nservice.getTotal(cri);
      
      PageMakerDTO pageMake = new PageMakerDTO(cri, total);
      
      model.addAttribute("pageMaker", pageMake);
   }
    
    @GetMapping("/option/noticeList5")
   public void notice5ListGET(Model model, Criteria cri) {
       
      log.info("notice5ListGET");
      
      cri.setAmount(5);
      
      log.info("cri : " + cri);
      
      model.addAttribute("nlist", nservice.getListPaging(cri));
      
      int total = nservice.getTotal(cri);
      
      PageMakerDTO pageMake = new PageMakerDTO(cri, total);
      
      model.addAttribute("pageMaker", pageMake);
   }
    
    @GetMapping("/option/noticeList10")
   public void notice10ListGET(Model model, Criteria cri) {
       
      log.info("notice10ListGET");
      
      cri.setAmount(10);
      
      log.info("cri : " + cri);
      
      model.addAttribute("nlist", nservice.getListPaging(cri));
      
      int total = nservice.getTotal(cri);
      
      PageMakerDTO pageMake = new PageMakerDTO(cri, total);
      
      model.addAttribute("pageMaker", pageMake);
   }
    
    @GetMapping("/option/noticeList20")
   public void notice20ListGET(Model model, Criteria cri) {
       
      log.info("notice20ListGET");
      
      cri.setAmount(20);
      
      log.info("cri : " + cri);
      
      model.addAttribute("nlist", nservice.getListPaging(cri));
      
      int total = nservice.getTotal(cri);
      
      PageMakerDTO pageMake = new PageMakerDTO(cri, total);
      
      model.addAttribute("pageMaker", pageMake);
   }
    
    @GetMapping("/option/noticeList30")
   public void notice30ListGET(Model model, Criteria cri) {
       
      log.info("notice30ListGET");
      
      cri.setAmount(30);
      
      log.info("cri : " + cri);
      
      model.addAttribute("nlist", nservice.getListPaging(cri));
      
      int total = nservice.getTotal(cri);
      
      PageMakerDTO pageMake = new PageMakerDTO(cri, total);
      
      model.addAttribute("pageMaker", pageMake);
   }
    
    @GetMapping("/option/noticeList40")
   public void notice40ListGET(Model model, Criteria cri) {
       
      log.info("notice40ListGET");
      
      cri.setAmount(40);
      
      log.info("cri : " + cri);
      
      model.addAttribute("nlist", nservice.getListPaging(cri));
      
      int total = nservice.getTotal(cri);
      
      PageMakerDTO pageMake = new PageMakerDTO(cri, total);
      
      model.addAttribute("pageMaker", pageMake);
   }
    
    /* 게시판 등록 페이지 접속 */
    @GetMapping("/enroll")
    public void noticeEnrollGET() {
        log.info("notice 등록 페이지 진입");
    }
    
    /* 게시판 등록 */
    @PostMapping("/enroll")
    public String noticeEnrollPOST(Notice notice, RedirectAttributes rttr) {
        
        log.info("Notice : " + notice);
        
        nservice.enroll(notice);
        
        rttr.addFlashAttribute("result", "enroll success");
        
        return "redirect:/notice/noticeList";
    }
    
    /* 게시판 조회 */
    @GetMapping("/read")
    public void noticeReadPageGET(int bno, Model model, Criteria cri, Notice notice) {
        
        nservice.count(bno);
       
        model.addAttribute("pageInfo", nservice.getPage(bno));
        
        model.addAttribute("cri", cri);
        
        System.out.println(notice.getBno());

    }
    
    /* 수정 페이지 이동 */
    @GetMapping("/modify")
    public void noticeModifyGET(int bno, Model model, Criteria cri) {
        
        model.addAttribute("pageInfo", nservice.getPage(bno));
        
        model.addAttribute("cri", cri);
    }
    
    /* 페이지 수정 */
    @PostMapping("/modify")
    public String noticeModifyPOST(Notice notice, RedirectAttributes rttr) {
        
        nservice.modify(notice);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/notice/noticeList";
    }
    
    /* 페이지 삭제 */
    @PostMapping("/delete")
    public String noticetestDeletePOST(int bno, RedirectAttributes rttr) {
        
        nservice.delete(bno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/notice/noticeList";
    }


}
