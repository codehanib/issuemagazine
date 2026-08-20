package com.springboot.issuemagazine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.springboot.issuemagazine.dao.noticeDAO;
import com.springboot.issuemagazine.dao.one_inquiryDAO;
import com.springboot.issuemagazine.dto.noticeDTO;
import com.springboot.issuemagazine.dto.one_inquiryDTO;

@Controller
public class customerService {

    @Autowired
    private noticeDAO noticeDAO;
    
    @Autowired
	private one_inquiryDAO one_inquiryDAO;

    @GetMapping("/customerService2")
    public String customerService(Model model) {
        List<noticeDTO> noticeList = noticeDAO.noticeSearch(null, null, 0, 7);
        model.addAttribute("noticeList", noticeList);
        List<one_inquiryDTO> one_inquiryList = one_inquiryDAO.one_inquirySearch(null, null, 0, 7);
        model.addAttribute("one_inquiryList", one_inquiryList);
        return "customerService2"; // customerService2.jsp로 이동
    }
    
}