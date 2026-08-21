package com.springboot.issuemagazine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.issuemagazine.dao.IproductDAO;
import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dao.noticeDAO;
import com.springboot.issuemagazine.dao.reviewDAO;
import com.springboot.issuemagazine.dto.memberDTO;
import com.springboot.issuemagazine.dto.noticeDTO;
import com.springboot.issuemagazine.dto.productDTO;
import com.springboot.issuemagazine.dto.product_detailDTO;
import com.springboot.issuemagazine.dto.reviewDTO;

@Controller
public class productController {
	@Autowired
    private IproductDAO productDAO;
	
	@Autowired
	private memberDAO memberdao;
	
	@Autowired
	private noticeDAO noticedao;
	
	@Autowired
	private reviewDAO reviewdao;

	// 상품 전체 목록 조회
	@RequestMapping("/product/list")
	public String productList(
	        @RequestParam(value = "page", defaultValue = "1") int page,
	        @RequestParam(value = "c_no", required = false) Integer c_no,
	        @RequestParam(value = "sort", defaultValue = "pno") String sort,
	        Model model) {

	    // 공지보이기 용
	    List<noticeDTO> noticeList =
	            noticedao.noticeSearch(null, null, 0, 3);

	    model.addAttribute("noticeList", noticeList);

	    // 한 페이지에 보여줄 상품 수
	    int pageSize = 20;

	    // 시작 위치
	    int start = (page - 1) * pageSize;

	    List<productDTO> productList;
	    int productCount;

	    // 카테고리별 상품 조회
	    if (c_no != null) {

	        productList = productDAO.productListCategory(
	                c_no, start, pageSize, sort);

	        productCount = productDAO.productCountCategory(c_no);

	    } else {

	        productList = productDAO.productList(
	                start, pageSize, sort);

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

	    // 현재 정렬 조건 유지
	    model.addAttribute("sort", sort);

	    return "product/productList";
	}

    @RequestMapping("/product/detail")
    public String productDetail(Authentication auth,
                                @RequestParam("p_no") int p_no,
                                @RequestParam(value = "reviewPage", defaultValue = "1") int reviewPage,
                                Model model) {

        String m_id = auth.getName();
        memberDTO member = memberdao.findById(m_id);
        int m_no = member.getM_no();

        productDTO product = productDAO.productdetail(p_no);
        List<product_detailDTO> productDetails = productDAO.product_detailList(p_no);

        // 후기 페이징 처리
        int recordPerPage = 10;
        int pageBlock = 10;
        int offset = (reviewPage - 1) * recordPerPage;

        int reviewCount = reviewdao.reviewListCount(p_no);
        List<reviewDTO> reviewList = reviewdao.reviewList(p_no, offset, recordPerPage);

        int reviewTotalPage = (int) Math.ceil((double) reviewCount / recordPerPage);
        int reviewStartPage = ((reviewPage - 1) / pageBlock) * pageBlock + 1;
        int reviewEndPage = reviewStartPage + pageBlock - 1;
        if (reviewEndPage > reviewTotalPage) {
            reviewEndPage = reviewTotalPage;
        }

        model.addAttribute("product", product);
        model.addAttribute("productDetails", productDetails);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("reviewCount", reviewCount);
        model.addAttribute("reviewPage", reviewPage);
        model.addAttribute("reviewTotalPage", reviewTotalPage);
        model.addAttribute("reviewStartPage", reviewStartPage);
        model.addAttribute("reviewEndPage", reviewEndPage);
        model.addAttribute("reviewPrev", reviewStartPage > 1);
        model.addAttribute("reviewNext", reviewEndPage < reviewTotalPage);
        model.addAttribute("loginNo", m_no);
        return "product/productDetail";
    }
    
    
    // 상품 검색 컨트롤러
    @RequestMapping("/productSearch")
    public String productSearch(
            @RequestParam("keyword") String keyword,
            Model model) {

        List<productDTO> productList = productDAO.productSearch(keyword);
        List<noticeDTO> noticeList =
	            noticedao.noticeSearch(null, null, 0, 3);

	    model.addAttribute("noticeList", noticeList);

        model.addAttribute("productList", productList);
        model.addAttribute("keyword", keyword);
        model.addAttribute("productCount", productList.size());

        return "product/productSearch";
    }
 

    // ==================== 상품 추가 (등록) ====================
    
    // 상품 등록 폼 페이지 이동 
    @GetMapping({"/admin/productWrite", "/product/write"})
    public String productWriteForm() {
        return "product/productWrite"; 
    }

    // 상품 등록 처리
    @PostMapping("/product/insert")
    public String productInsert(@ModelAttribute productDTO dto) {

        productDAO.productInsert(dto);
        return "redirect:/admin/productList";
    }
    // ==================== 상품 수정 ====================
    
    // 상품 수정 폼 페이지 이동
    @GetMapping("/product/update")
    public String productUpdateForm(@RequestParam("p_no") int p_no, Model model) {
        productDTO product = productDAO.productdetail(p_no);
        model.addAttribute("product", product);
        return "product/productUpdateForm";
    }

    // 상품 수정 처리
    @PostMapping("/product/update")
    public String productUpdate(@ModelAttribute productDTO dto) {
        productDAO.productUpdate(dto);
        return "redirect:/product/detail?p_no=" + dto.getP_no();
    }

    // ==================== 상품 삭제 ====================
    
    // 상품 삭제 처리
    @RequestMapping("/product/delete")
    public String productDelete(@RequestParam("p_no") int p_no) {
        productDAO.productDelete(p_no);
        return "redirect:/admin/productList";
    }
    
    // ==================== 관리자 상품 목록 페이지 ====================
 // 1. 관리자 상품 메뉴/안내 페이지 이동
    @RequestMapping("/admin/productMenu")
    public String adminProductMenu() {
        return "admin/adminProductMenu"; // 카드 4개 있는 메뉴 JSP
    }

    // 2. 실제 상품 목록 조회 페이지 (수정/삭제 버튼이 있는 곳)
    @RequestMapping("/admin/productList")
    public String adminProductList(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "c_no", required = false) Integer c_no,
            @RequestParam(value = "sort", defaultValue = "pno") String sort,
            Model model) {

        int pageSize = 10;
        int start = (page - 1) * pageSize;

        List<productDTO> productList;
        int productCount;

        if (c_no != null) {
            productList = productDAO.productListCategory(c_no, start, pageSize, sort);
            productCount = productDAO.productCountCategory(c_no);
        } else {
            productList = productDAO.productList(start, pageSize, sort);
            productCount = productDAO.productCount();
        }

        int totalPage = (int) Math.ceil((double) productCount / pageSize);
        int pageBlock = 10;
        int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
        int endPage = startPage + pageBlock - 1;

        if (endPage > totalPage) endPage = totalPage;

        model.addAttribute("productList", productList);
        model.addAttribute("productCount", productCount);
        model.addAttribute("page", page);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("c_no", c_no);
        model.addAttribute("sort", sort);

        return "admin/adminProductList";
    }
    
    // 관리자 페이지 검색창
    @RequestMapping("/admin/productSearch")
    public String adminProductSearch(@RequestParam("keyword") String keyword, Model model) {
        
        List<productDTO> productList = productDAO.productSearch(keyword);
        
        model.addAttribute("productList", productList);
        model.addAttribute("keyword", keyword);
        model.addAttribute("productCount", productList.size());
        
        return "admin/adminProductList"; 
    }

    

}