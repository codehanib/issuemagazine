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
public class cartController {
	
	@Autowired
	private IcartDAO cartdao;
	
	
	// 장바구니 페이지
	 @RequestMapping("/cartForm")
	   public String cartForm() {
	       return "cart/cartForm";
	   }
	
	
	// 장바구니 상품추가
	@RequestMapping("/cartInsert")
		public String cartInsert(cartDTO cdto) {
			cartdao.cartInsert(cdto);
		return "redirect:/cartForm" + cdto.getP_no();
	}
	

	// 선택상품 삭제
	 @RequestMapping("/cartDelete")
	 public String cartDelete(@RequestParam("cart_no") List<Integer> cart_no ) {
		 
		 for(int no : cart_no) {
			 cartdao.cartDelete(no);
		 }
		 
		 return "redirect:/cartForm";
	 }
	 
	 //장바구니 전체 삭제
	 @RequestMapping("/cartDeleteAll")
	 public String cartDeleteAll(@RequestParam("m_no") int m_no) {
		 cartdao.cartDeleteAll(m_no);
		 
		 return "redirect:/cartForm";
	 }
	 
	 // 장바구니 수량 변경
	 
	 @RequestMapping("/cartUpdate")
	 public String cartUpdate(cartDTO cdto) {

	     cartdao.cartUpdate(cdto);

	     return "redirect:/cartForm";
	 }
	 
	 //쇼핑 계속하기
	 @RequestMapping("/shopping")
	 public String shopping() {
		 return "redirect:/productList";
	 }
	 
	 //주문하기
	 @RequestMapping("/cartPayment")
	 public String payment() {
		 return "payment/payment";
	 } 
	 
		
}
