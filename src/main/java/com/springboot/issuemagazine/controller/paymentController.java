package com.springboot.issuemagazine.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dto.memberDTO;
import com.springboot.issuemagazine.service.PaymentService;

@Controller
public class paymentController {
	
	private final PaymentService paymentService;
	
	@Autowired
    private memberDAO memberdao;

	public paymentController(PaymentService paymentService) {
	    this.paymentService = paymentService;
	}
	
	@RequestMapping("/payment")
    public String payment(Authentication auth,
    					@RequestParam("p_no") int p_no,
    					@RequestParam("p_name") String p_name,
            			@RequestParam("quantity") int quantity,
            			@RequestParam("period") String period,
            			@RequestParam("p_price2") int p_price2,
            			@RequestParam("p_image") String p_image,
            			Model model
            			) {
		
		// 현재 로그인한 회원의 ID
	    String m_id = auth.getName();

	    // 회원번호 조회
	    memberDTO member = memberdao.findById(m_id);
	    int m_no = member.getM_no();
	    
	    // 회원(주문자)정보
	    String memId = member.getM_id();
	    String m_name = member.getM_name();
	    String m_tel = member.getM_tel();
	    String m_addr = member.getM_addr();
	    String m_zipno = member.getM_zipno();
	    
	    // 정보 보내기
		model.addAttribute("m_no", m_no);
		model.addAttribute("memId", memId);
		model.addAttribute("m_name", m_name);
		model.addAttribute("m_tel", m_tel);
		model.addAttribute("m_addr", m_addr);
		model.addAttribute("m_zipno", m_zipno);
		
		model.addAttribute("p_no", p_no);
		model.addAttribute("p_name", p_name);
		model.addAttribute("quantity", quantity);
		model.addAttribute("period", period);
		model.addAttribute("p_price2", p_price2);
		model.addAttribute("p_image", p_image);
		
        return "payment";
    }
	
	@PostMapping("/payment/verify")
    @ResponseBody
    public String verifyPayment(@RequestBody Map<String, String> request) {

        String impUid = request.get("imp_uid");
        String merchantUid = request.get("merchant_uid");

        System.out.println("imp_uid = " + impUid);
        System.out.println("merchant_uid = " + merchantUid);
        
     // PaymentService에서 포트원 Access Token 발급 요청
        paymentService.getAccessToken();

        return "OK";
    }
	
}
