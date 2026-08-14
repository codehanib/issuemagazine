package com.springboot.issuemagazine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.issuemagazine.dao.IshipmentDAO;
import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dto.memberDTO;
import com.springboot.issuemagazine.dto.shipmentDTO;

@Controller
public class shipmentController {

    @Autowired
    private IshipmentDAO dao;

    @Autowired
    private memberDAO memberdao;

    // 회원 배송상태 조회
    @RequestMapping("/member/shipmentMemberList")
    public String shipmentMemberList(Authentication auth, Model model) {

        String m_id = auth.getName();

        memberDTO member = memberdao.findById(m_id);

        int m_no = member.getM_no();

        List<shipmentDTO> shipmentMemberList =
                dao.shipmentMemberList(m_no);

        model.addAttribute("shipmentMemberList", shipmentMemberList);

        return "member/shipmentMemberList";
    }
}