package com.springboot.issuemagazine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.issuemagazine.dao.IproductDAO;
import com.springboot.issuemagazine.dto.productDTO;
import com.springboot.issuemagazine.dto.product_detailDTO;

@Controller
public class productController {
	@Autowired
    private IproductDAO productDAO;

    // 상품 전체 목록 조회
    @RequestMapping("/product/list")
    public String productList(Model model) {

        List<productDTO> productList =
                productDAO.productList();

        model.addAttribute("productList", productList);

        return "product/productList";
    }

    // 상품 상세 조회
    @RequestMapping("/product/detail")
    public String productDetail(@RequestParam("p_no") int p_no,
                                Model model) {

        // 상품 기본정보
        productDTO product =
                productDAO.productdetail(p_no);

        // 상품 상세정보 + 상세 이미지
        List<product_detailDTO> productDetails =
                productDAO.product_detailList(p_no);

        model.addAttribute("product", product);
        model.addAttribute("productDetails", productDetails);

        return "productDetail";
    }
}
