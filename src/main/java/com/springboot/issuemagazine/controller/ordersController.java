package com.springboot.issuemagazine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.issuemagazine.dao.IordersDAO;
import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dto.memberDTO;
import com.springboot.issuemagazine.dto.ordersDTO;
import com.springboot.issuemagazine.dto.orders_detailDTO;

@Controller
public class ordersController {

    @Autowired
    private IordersDAO dao;

    @Autowired
    private memberDAO memberDao;


    // 주문 목록
    @RequestMapping("/member/ordersList")
    public String ordersList(
            Authentication authentication,
            Model model) {

        String m_id = authentication.getName();

        memberDTO member = memberDao.findById(m_id);

        int m_no = member.getM_no();

        List<ordersDTO> ordersList = dao.ordersList(m_no);

        model.addAttribute("ordersList", ordersList);

        return "member/ordersList";
    }


    // 주문 생성
    @RequestMapping("/member/ordersInsert")
    public String ordersInsert(
            Authentication authentication,
            ordersDTO odto,
            orders_detailDTO oddto) {

        // 현재 로그인한 회원
        String m_id = authentication.getName();

        // 회원 정보 조회
        memberDTO member = memberDao.findById(m_id);

        // 회원번호 설정
        odto.setM_no(member.getM_no());

        // 주문 생성
        dao.ordersInsert(odto);

        // 생성된 주문번호를 주문상세에 전달
        oddto.setO_no(odto.getO_no());

        // 주문 상세 생성
        dao.ordersDetailInsert(oddto);

        return "redirect:/member/ordersList";
    }


    // 주문 상세 보기
    @RequestMapping("/member/ordersDetail")
    public String ordersDetail(
            Authentication authentication,
            @RequestParam("o_no") int o_no,
            Model model) {

        // 현재 로그인한 회원
        String m_id = authentication.getName();

        // 회원 정보 조회
        memberDTO member = memberDao.findById(m_id);

        // 회원번호
        int m_no = member.getM_no();

        // 주문 상세 조회
        List<orders_detailDTO> ordersDetailList =
                dao.ordersDetailList(m_no, o_no);

        // JSP로 전달
        model.addAttribute("ordersDetailList", ordersDetailList);
        model.addAttribute("o_no", o_no);

        return "member/ordersDetail";
    }


    // 주문 취소
    @RequestMapping("/member/ordersdelete")
    public String ordersDelete(
            @RequestParam("o_no") int o_no) {

        dao.ordersDelete(o_no);

        return "redirect:/member/ordersList";
    }

}