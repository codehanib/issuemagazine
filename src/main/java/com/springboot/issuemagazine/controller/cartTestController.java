package com.springboot.issuemagazine.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.issuemagazine.dao.IcartDAO;
import com.springboot.issuemagazine.dto.cartDTO;

@Controller
public class cartTestController {
	
	@Autowired
	private IcartDAO cartdao;
	

	
	// 장바구니 INSERT 테스트용
	@RequestMapping("/cartTest")
	public String cartTest() {

	    cartDTO cdto = new cartDTO();

	    cdto.setM_no(1001);             // 실제 회원번호
	    cdto.setP_no(2037);           // 실제 상품번호
	    cdto.setCart_quantity(1);    // 수량
	    cdto.setCart_price(414000);   // 가격

	    cartdao.cartInsert(cdto);

	    return "redirect:/cartTestForm";
	}
	
	// cartForm 테스트용
	@RequestMapping("/cartTestForm")
	public String cartForm(Model model) {

	    int m_no = 1001; // 테스트용

	    model.addAttribute("cartList", cartdao.cartList(m_no));
	    model.addAttribute("m_no", m_no);

	    return "cart/cartTestForm";
	}
	
	
	// 장바구니 상품추가
	@RequestMapping("/cartTestInsert")
		public String cartInsert(cartDTO cdto) {
			cartdao.cartInsert(cdto);
		return "redirect:/cartTestForm" + cdto.getP_no();
	}
	

	// 선택상품 삭제
	 @RequestMapping("/cartTestDelete")
	 public String cartDelete(@RequestParam("cart_no") List<Integer> cart_no ) {
		 
		 for(int no : cart_no) {
			 cartdao.cartDelete(no);
		 }
		 
		 return "redirect:/cartTestForm";
	 }
	 
	 //장바구니 전체 삭제
	 @RequestMapping("/cartTestDeleteAll")
	 public String cartDeleteAll(@RequestParam("m_no") int m_no) {
		 cartdao.cartDeleteAll(m_no);
		 
		 return "redirect:/cartTestForm";
	 }
	 
	 // 장바구니 수량 변경
	 
	 @RequestMapping("/cartTestUpdate")
	 public String cartUpdate(cartDTO cdto) {

	     cartdao.cartUpdate(cdto);

	     return "redirect:/cartTestForm";
	 }
	 
	 //쇼핑 계속하기
	 @RequestMapping("/shoppingTest")
	 public String shopping() {
		 return "redirect:/productList";
	 }
	 
	 //주문하기
	 @RequestMapping("/cartTestPayment")
	 public String payment() {
		 return "payment/payment";
	 } 
	 
		
}
