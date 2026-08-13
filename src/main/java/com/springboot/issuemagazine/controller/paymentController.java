package com.springboot.issuemagazine.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springboot.issuemagazine.service.PaymentService;

@Controller
public class paymentController {
	
	private final PaymentService paymentService;

	public paymentController(PaymentService paymentService) {
	    this.paymentService = paymentService;
	}
	
	@RequestMapping("/payment")
    public String payment() {
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
