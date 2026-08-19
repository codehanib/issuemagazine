package com.springboot.issuemagazine.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dao.noticeDAO;
import com.springboot.issuemagazine.dto.memberDTO;
import com.springboot.issuemagazine.dto.noticeDTO;

@Controller
@RequestMapping("/notice")
public class noticeController {

    @Autowired
    private noticeDAO noticeDAO;

    @Autowired
    private memberDAO memberdao;

    // 공지 목록
    @RequestMapping("/list")
    public String noticeList(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "searchType", required = false) String searchType, //검색기능
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model) {

        int recordPerPage = 10;
        int pageBlock = 10;
        int offset = (page - 1) * recordPerPage;

        int totalCount = noticeDAO.noticeSearchCount(searchType, keyword);
        List<noticeDTO> list = noticeDAO.noticeSearch(searchType, keyword, offset, recordPerPage);

        int totalPage = (int) Math.ceil((double) totalCount / recordPerPage);
        int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
        int endPage = Math.min(startPage + pageBlock - 1, totalPage);

        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("prev", startPage > 1);
        model.addAttribute("next", endPage < totalPage);
        model.addAttribute("searchType", searchType);
        model.addAttribute("keyword", keyword);
        //페이지 넘기는거
        return "notice/list";
    }

    // 공지 상세보기
    @RequestMapping("/view")
    public String noticeView(@RequestParam("n_no") int n_no, Model model) {
        noticeDAO.noticeCountUp(n_no);
        
        model.addAttribute("dto", noticeDAO.noticeView(n_no));
        model.addAttribute("prevDto", noticeDAO.noticePrev(n_no));
        model.addAttribute("nextDto", noticeDAO.noticeNext(n_no));

        return "notice/view";
    }

    // 공지 작성 폼
    @RequestMapping("/writeForm")
    public String noticeWriteForm() {
        return "notice/write";
    }

    // 공지 작성 처리
    @RequestMapping(value = "/write", method = RequestMethod.POST)
    public String noticeWrite(noticeDTO dto, Principal principal) {
        memberDTO mdto = memberdao.findById(principal.getName());
        dto.setM_no(mdto.getM_no());

        noticeDAO.noticeWrite(dto);
        return "redirect:/notice/list";
    }

    // 공지 수정 폼
    @RequestMapping("/updateForm")
    public String noticeUpdateForm(@RequestParam("n_no") int n_no, Model model) {
        model.addAttribute("dto", noticeDAO.noticeView(n_no));
        return "notice/update";
    }

    // 공지 수정 처리
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String noticeUpdate(noticeDTO dto) {
        noticeDAO.noticeUpdate(dto);
        return "redirect:/notice/view?n_no=" + dto.getN_no();
    }

    // 공지 삭제 처리
    @RequestMapping("/delete")
    public String noticeDelete(@RequestParam("n_no") int n_no) {
        noticeDAO.noticeDelete(n_no);
        return "redirect:/notice/list";
    }
    @RequestMapping("/deleteForm")
    public String noticeDeleteForm(@RequestParam("n_no") int n_no, Model model) {
        model.addAttribute("dto", noticeDAO.noticeView(n_no));
        return "notice/delete";
    }
}