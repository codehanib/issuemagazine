package com.springboot.issuemagazine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dao.wishlistDAO;
import com.springboot.issuemagazine.dto.memberDTO;
import com.springboot.issuemagazine.dto.wishlistDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class wishlistController {

    @Autowired
    private memberDAO memberdao;

    @Autowired
    private wishlistDAO dao;
    
    @RequestMapping("/member/wishlistInsert")
    public String wishlistInsert(
            Authentication auth,
            int p_no) {

        String m_id = auth.getName();

        memberDTO member = memberdao.findById(m_id);

        wishlistDTO dto = new wishlistDTO();

        dto.setM_no(member.getM_no());
        dto.setP_no(p_no);

        dao.wishlistInsert(dto);

        return "redirect:/member/wishlistList";
    }
    
    @RequestMapping("/member/wishlistList")
    public String wishlistList(Authentication auth, Model model) {

        String m_id = auth.getName();
        memberDTO member = memberdao.findById(m_id);

        int m_no = member.getM_no();

        List<wishlistDTO> wishlist = dao.wishlistList(m_no);
        model.addAttribute("wishlist", wishlist);

        return "member/wishlistList";
    }
    
    @RequestMapping("/member/wishlistDelete")
    public String wishlistDelete(HttpServletRequest request) {
        int w_no = Integer.parseInt(request.getParameter("w_no"));
        dao.wishlistDelete(w_no);
        
        return "redirect:/member/wishlistList";
    }
}