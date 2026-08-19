package com.springboot.issuemagazine.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dao.reviewDAO;
import com.springboot.issuemagazine.dto.memberDTO;
import com.springboot.issuemagazine.dto.reviewDTO;

@Controller
public class reviewController {

	@Autowired
	private reviewDAO reviewDAO;

	@Autowired
	private memberDAO memberdao;

	// 후기 목록
	@RequestMapping("/review/list")
	public String reviewList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "p_no", required = false) Integer p_no,
			Model model, Principal principal) {

		int recordPerPage = 10;
		int pageBlock = 10;
		int offset = (page - 1) * recordPerPage;
		int totalCount = reviewDAO.reviewListCount(p_no);
		List<reviewDTO> list = reviewDAO.reviewList(p_no, offset, recordPerPage);

		int totalPage = (int) Math.ceil((double) totalCount / recordPerPage);
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		int endPage = Math.min(startPage + pageBlock - 1, totalPage);

		model.addAttribute("list", list);
		model.addAttribute("p_no", p_no);
		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("prev", startPage > 1);
		model.addAttribute("next", endPage < totalPage);

		if (principal != null) {
			model.addAttribute("loginNo", memberdao.findById(principal.getName()).getM_no());
		}

		return "review/list";
	}

	// 후기 작성 폼
	@RequestMapping("/review/writeForm")
	public String reviewWriteForm(@RequestParam("p_no") int p_no, Model model) {
		model.addAttribute("p_no", p_no);
		return "review/write";
	}

	// 후기 작성 처리
	@RequestMapping(value = "/review/write", method = RequestMethod.POST)
	public String reviewWrite(reviewDTO dto, Principal principal) {
		dto.setM_no(memberdao.findById(principal.getName()).getM_no());
		reviewDAO.reviewWrite(dto);
		return "redirect:/product/detail?p_no=" + dto.getP_no() + "#product-review";
	}

	// 후기 수정 폼
	@RequestMapping("/review/updateForm")
	public String reviewUpdateForm(@RequestParam("r_no") int r_no, Model model) {
		model.addAttribute("dto", reviewDAO.reviewView(r_no));
		return "review/update";
	}

	// 후기 수정 처리
	@RequestMapping(value = "/review/update", method = RequestMethod.POST)
	public String reviewUpdate(reviewDTO dto) {
		reviewDAO.reviewUpdate(dto);
		return "redirect:/product/detail?p_no=" + dto.getP_no() + "#product-review";
	}

	// 후기 삭제 확인 화면
	@RequestMapping("/review/deleteForm")
	public String reviewDeleteForm(@RequestParam("r_no") int r_no, Model model) {
		model.addAttribute("dto", reviewDAO.reviewView(r_no));
		return "review/delete";
	}

	// 후기 삭제 처리
	@RequestMapping(value = "/review/delete", method = RequestMethod.POST)
	public String reviewDelete(@RequestParam("r_no") int r_no) {
		reviewDTO dto = reviewDAO.reviewView(r_no);
		int p_no = (dto != null) ? dto.getP_no() : 0;
		reviewDAO.reviewDelete(r_no);
		return "redirect:/product/detail?p_no=" + p_no + "#product-review";
	}
}