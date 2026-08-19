package com.springboot.issuemagazine.controller;

import java.util.List;
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

import com.springboot.issuemagazine.dao.IcartDAO;
import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dto.cartDTO;
import com.springboot.issuemagazine.dto.memberDTO;
import com.springboot.issuemagazine.service.PaymentService;

@Controller
public class paymentController {
	
	private final PaymentService paymentService;
	
	@Autowired
    private memberDAO memberdao;
	
	@Autowired
	private IcartDAO cartdao;

	public paymentController(PaymentService paymentService) {
	    this.paymentService = paymentService;
	}
	
	@RequestMapping("/payment")
    public String payment(Authentication auth,
    					@RequestParam("orderType")
    					String orderType,
					   	@RequestParam(value = "p_no", required = false)
					    Integer p_no,
					    @RequestParam(value = "p_name", required = false)
					    String p_name,
					    @RequestParam(value = "quantity", required = false)
					    Integer quantity,
					    @RequestParam(value = "period", required = false)
					    String period,
					    @RequestParam(value = "p_price2", required = false)
					    Integer p_price2,
					    @RequestParam(value = "p_image", required = false)
					    String p_image,
					    @RequestParam(value = "cart_no", required = false)
					    List<Integer> cart_no,
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
		
		// 주문 방식
	    model.addAttribute("orderType", orderType);
	    
	    if ("direct".equals(orderType)) {
			model.addAttribute("p_no", p_no);
			model.addAttribute("p_name", p_name);
			model.addAttribute("quantity", quantity);
			model.addAttribute("period", period);
			model.addAttribute("p_price2", p_price2);
			model.addAttribute("p_image", p_image);
			// 바로구매 총금액
		    int totalPrice = p_price2 * quantity;
		    model.addAttribute("totalPrice", totalPrice);
		    
		    // 결제창에 표시할 상품명
		    model.addAttribute("paymentName", p_name);
			
	    }else if ("cart".equals(orderType)) {
	        // 선택 상품이 없는 경우
	        if (cart_no == null || cart_no.isEmpty()) {
	            return "redirect:/cartForm";
	        }
	        // 현재 회원의 장바구니 조회
	        List<cartDTO> cartList =
	                cartdao.cartList(m_no);
	        // 선택한 상품만 추림
	        List<cartDTO> selectedCartList =
	                cartList.stream()
	                        .filter(cart ->
	                            cart_no.contains(cart.getCart_no()))
	                        .toList();
	        // 선택 상품
	        model.addAttribute(
	                "cartList",
	                selectedCartList
	        );
	        // 총 가격
	        int totalPrice = 0;
	        for (cartDTO cart : selectedCartList) {
	            totalPrice +=
	                    cart.getP_price()
	                    * cart.getCart_quantity();
	        }
	        model.addAttribute(
	                "totalPrice",
	                totalPrice
	        );
	     // 결제창에 표시할 상품명
	        String paymentName =
	                selectedCartList.get(0).getP_name();

	        if (selectedCartList.size() > 1) {
	            paymentName +=
	                    " 외 " + (selectedCartList.size() - 1) + "개";
	        }
	        model.addAttribute("paymentName", paymentName);
	    }
	    
        return "payment";
    }
	
	@PostMapping("/payment/verify")
    @ResponseBody
    public String verifyPayment(
            @RequestBody Map<String, String> request) {

        String impUid = request.get("imp_uid");
        String merchantUid = request.get("merchant_uid");

        System.out.println("imp_uid = " + impUid);
        System.out.println("merchant_uid = " + merchantUid);

        Map payment =
                paymentService.getPayment(impUid);

        System.out.println("결제 정보 = " + payment);

        return "OK";
    }
	
}
