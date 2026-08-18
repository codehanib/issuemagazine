package com.springboot.issuemagazine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.issuemagazine.dao.IproductDAO;
import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dto.memberDTO;
import com.springboot.issuemagazine.dto.productDTO;
import com.springboot.issuemagazine.dto.product_detailDTO;

@Controller
public class productController {
	@Autowired
    private IproductDAO productDAO;
	
	@Autowired
	private memberDAO memberdao;

    // 상품 전체 목록 조회
    @RequestMapping("/product/list")
    public String productList(
    						@RequestParam(value = "page", defaultValue = "1") int page,
    						@RequestParam(value = "c_no", required = false) Integer c_no,
    						Model model) {
    	
    	// 한 페이지에 보여줄 상품 수
        int pageSize = 20;
        // 시작 위치
        int start = (page - 1) * pageSize;
        // 상품 조회
        List<productDTO> productList =
                productDAO.productList(start, pageSize);
        // 전체 상품 수
        int productCount =
                productDAO.productCount();
        
        // 카테고리별 상품 조회
        if(c_no != null) {
        	productList = productDAO.productListCategory(c_no, start, pageSize);
        	productCount = productDAO.productCountCategory(c_no);
        } else {
        	productList = productDAO.productList(start, pageSize);
        	productCount = productDAO.productCount();
        }
        
        // 전체 페이지 수
        int totalPage =
                (int) Math.ceil((double) productCount / pageSize);
        int pageBlock = 10;
        // 현재 페이지가 속한 페이지 그룹의 시작 번호
        int startPage =
                ((page - 1) / pageBlock) * pageBlock + 1;
        // 현재 페이지 그룹의 마지막 번호
        int endPage =
                startPage + pageBlock - 1;
        // 마지막 페이지보다 크면 마지막 페이지로 설정
        if (endPage > totalPage) {
            endPage = totalPage;
        }

        model.addAttribute("productList", productList);
        model.addAttribute("productCount", productCount);
        model.addAttribute("page", page);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("c_no", c_no);

        return "product/productList";
    }

    // 상품 상세 조회
    @RequestMapping("/product/detail")
    public String productDetail(Authentication auth,
    							@RequestParam("p_no") int p_no,
                                Model model) {
    	
    	// 현재 로그인한 회원의 ID
	    String m_id = auth.getName();

	    // 회원번호 조회
	    memberDTO member = memberdao.findById(m_id);
	    int m_no = member.getM_no();
    	
        // 상품 기본정보
        productDTO product =
                productDAO.productdetail(p_no);

        // 상품 상세정보 + 상세 이미지
        List<product_detailDTO> productDetails =
                productDAO.product_detailList(p_no);

        model.addAttribute("product", product);
        model.addAttribute("productDetails", productDetails);

        return "product/productDetail";
    }
	    

    
}
