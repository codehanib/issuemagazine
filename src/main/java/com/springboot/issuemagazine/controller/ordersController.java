package com.springboot.issuemagazine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.issuemagazine.dao.IcartDAO;
import com.springboot.issuemagazine.dao.IordersDAO;
import com.springboot.issuemagazine.dao.IproductDAO;
import com.springboot.issuemagazine.dao.IshipmentDAO;
import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dto.memberDTO;
import com.springboot.issuemagazine.dto.ordersDTO;
import com.springboot.issuemagazine.dto.orders_detailDTO;
import com.springboot.issuemagazine.dto.productDTO;
import com.springboot.issuemagazine.dto.shipmentDTO;

@Controller
public class ordersController {

    @Autowired
    private IordersDAO dao;

    @Autowired
    private memberDAO memberDao;
    
    @Autowired
    private IproductDAO productDao;

    @Autowired
    private IshipmentDAO shipmentDao;
    
    @Autowired
    private IcartDAO cartDao;
    
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
            ordersDTO odto) {

        String m_id = authentication.getName();

        memberDTO member = memberDao.findById(m_id);

        odto.setM_no(member.getM_no());

        // 주문 생성
        dao.ordersInsert(odto);

        int o_no = odto.getO_no();

        // 주문 상세 생성
        for (orders_detailDTO oddto : odto.getOddtoList()) {

            productDTO product =
                    productDao.productdetail(oddto.getP_no());

            int discountPrice = product.getP_price2();

            int quantity = oddto.getOd_quantity();

            int orderPrice = discountPrice * quantity;

            oddto.setOd_price(orderPrice);
            oddto.setO_no(o_no);

            dao.ordersDetailInsert(oddto);
        }

        // 배송정보
        shipmentDTO shipment = new shipmentDTO();

        shipment.setO_no(o_no);
        shipment.setM_no(member.getM_no());
        shipment.setS_delivery("-");
        shipment.setS_d_no("-");
        shipment.setS_status("배송준비중");

        shipmentDao.shipmentInsert(shipment);
        
        // 주문한 상품 장바구니에서 삭제
        for (orders_detailDTO oddto : odto.getOddtoList()) {
            cartDao.cartDelete(oddto.getCart_no());
        }
        
        return "redirect:/member/ordersList";
    }


    // 주문 상세 보기
    @RequestMapping("/member/ordersDetail")
    public String ordersDetail(
            Authentication authentication,
            @RequestParam("o_no") int o_no,
            Model model) {

        // 로그인한 회원 ID
        String m_id = authentication.getName();

        // 회원 정보
        memberDTO member = memberDao.findById(m_id);

        // 회원번호
        int m_no = member.getM_no();

        // 주문 상세 조회
        List<orders_detailDTO> ordersDetailList =
                dao.ordersDetailList(m_no, o_no);

        // 총 가격
        int totalPrice = 0;

        for (orders_detailDTO detail : ordersDetailList) {
            totalPrice += detail.getOd_price();
        }

        // JSP 전달
        model.addAttribute("ordersDetailList", ordersDetailList);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("o_no", o_no);

        return "member/ordersDetail";
    }


    // 주문 취소
    @RequestMapping("/member/ordersdelete")
    public String ordersDelete(
            Authentication authentication,
            @RequestParam("o_no") int o_no) {

        // 현재 로그인한 회원 아이디
        String m_id = authentication.getName();

        // 회원 정보 조회
        memberDTO member = memberDao.findById(m_id);

        // 회원번호
        int m_no = member.getM_no();

        // 주문 취소
        dao.ordersDelete(m_no, o_no);

        return "redirect:/member/ordersList";
    }
    
    @RequestMapping("/admin/adminOrdersList")
    public String adminOrdersList(Model model) {

        List<ordersDTO> ordersList = dao.adminOrdersList();

        model.addAttribute("ordersList", ordersList);

        return "admin/adminOrdersList";
    }
    
    // 관리자 주문관리
    @RequestMapping("/admin/statusUpdate")
    public String statusUpdate(ordersDTO dto) {
    	dao.statusUpdate(dto);
    	return "redirect:/admin/adminOrdersList";
    }
    
    @RequestMapping("/admin/statusUpdateForm")
	public String statusUpdateForm(@RequestParam("o_no") int o_no, Model model) {
    	ordersDTO orders = dao.statusUpdateForm(o_no);
    	model.addAttribute("orders", orders);
		return "admin/ordersUpdateForm";
	}
}