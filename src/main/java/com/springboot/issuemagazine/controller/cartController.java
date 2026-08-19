package com.springboot.issuemagazine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.issuemagazine.dao.IcartDAO;
import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dto.cartDTO;
import com.springboot.issuemagazine.dto.memberDTO;

@Controller
public class cartController {
	@Autowired
	private IcartDAO cartdao;
	
	@Autowired
	private memberDAO memberdao;
	
	// 장바구니 페이지
	 @RequestMapping("/cartForm")
	   public String cartForm(Authentication auth,
			   					Model model) {
		// 현재 로그인한 회원의 ID
		 String m_id = auth.getName();

		// 회원번호 조회
		 memberDTO member = memberdao.findById(m_id);
		 int m_no = member.getM_no();
		
		 List<cartDTO> cartList = cartdao.cartList(m_no);
		 model.addAttribute("cartList", cartList);
		 
	     return "cart/cartForm";
	   }
	
	
	// 장바구니 상품추가
	@RequestMapping("/cartInsert")
		public String cartInsert(
								Authentication auth,
								cartDTO cdto,
								@RequestParam("quantity") int quantity) {
		// 현재 로그인한 회원의 ID
				 String m_id = auth.getName();
		// 회원번호 조회
		memberDTO member = memberdao.findById(m_id);
		int m_no = member.getM_no();
		
		// 회원번호를 DTO에 저장
	    cdto.setM_no(m_no);
		// 장바구니 수량 입력
	    cdto.setCart_quantity(quantity);
	    
		cartdao.cartInsert(cdto);
		
		return "redirect:/cartForm";
	}
	
	// 선택 상품 삭제
	@RequestMapping("/cartDelete")
	public String cartDelete(
	        @RequestParam(value = "cart_no", required = false)
	        List<Integer> cart_no) {

	    if (cart_no != null) {

	        for (int no : cart_no) {
	            cartdao.cartDelete(no);
	        }

	    }

	    return "redirect:/cartForm";
	}
	 
	 //장바구니 전체 삭제
	 @RequestMapping("/cartDeleteAll")
	 public String cartDeleteAll(Authentication auth) {
		// 현재 로그인한 회원의 ID
		 String m_id = auth.getName();
		// 회원번호 조회
		 memberDTO member = memberdao.findById(m_id);
		 int m_no = member.getM_no();
		 // 해당 회원 장바구니 삭제
		 cartdao.cartDeleteAll(m_no);
		 
		 return "redirect:/cartForm";
	 }
	 
	 // 장바구니 수량 변경
	 
	 @RequestMapping("/cartUpdate")
	 public String cartUpdate(cartDTO cdto) {

	     cartdao.cartUpdate(cdto);

	     return "redirect:/cartForm";
	 }
	 
}
