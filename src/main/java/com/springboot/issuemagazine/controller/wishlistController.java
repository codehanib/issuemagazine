package com.springboot.issuemagazine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dto.memberDTO;

@Controller
public class wishlistController {

    @Autowired
    private memberDAO memberdao;

    @RequestMapping("/member/wishlistList")
    public String wishlistList(Authentication auth, Model model) {

        String m_id = auth.getName();

        memberDTO member = memberdao.findById(m_id);

        model.addAttribute("m_no", member.getM_no());

        return "member/wishlistList";
    }
}