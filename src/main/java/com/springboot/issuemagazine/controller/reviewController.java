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

	// 후기 목록 (페이징 10개씩 적용)
	@RequestMapping("/review/list")
	public String reviewList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "p_no", required = false) Integer p_no,
			Model model, Principal principal) {

		int recordPerPage = 10; // 페이지당 10개씩 출력
		int pageBlock = 10;     // 하단 [1]~[10] 블록 개수
		int offset = (page - 1) * recordPerPage; // DB 조회 시 건너뛸 개수

		// 1. 총 게시글 수 및 10개 목록 조회
		int totalCount = reviewDAO.reviewListCount(p_no);
		List<reviewDTO> list = reviewDAO.reviewList(p_no, offset, recordPerPage);

		// 2. 하단 페이징 관련 계산
		int totalPage = (int) Math.ceil((double) totalCount / recordPerPage);
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		// 3. Model에 값 바인딩
		model.addAttribute("list", list);
		model.addAttribute("p_no", p_no);
		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("prev", startPage > 1);
		model.addAttribute("next", endPage < totalPage);

		if (principal != null) {
			memberDTO mdto = memberdao.findById(principal.getName());
			model.addAttribute("loginNo", mdto.getM_no());
		}

		return "review/list";
	}

	// 후기 상세보기
	@RequestMapping("/review/view")
	public String reviewView(@RequestParam("r_no") int r_no, Model model) {
		reviewDTO dto = reviewDAO.reviewView(r_no);
		model.addAttribute("dto", dto);
		return "review/view";
	}

	@RequestMapping("/review/writeForm")
	public String reviewWriteForm(@RequestParam("p_no") int p_no, Model model) {
		model.addAttribute("p_no", p_no);
		return "review/write";
	}

	// 후기 작성 처리
	@RequestMapping(value = "/review/write", method = RequestMethod.POST)
	public String reviewWrite(reviewDTO dto, Principal principal) {
		String m_id = principal.getName();
		memberDTO mdto = memberdao.findById(m_id);
		dto.setM_no(mdto.getM_no());
		reviewDAO.reviewWrite(dto);
		return "redirect:/review/list?p_no=" + dto.getP_no();
	}

	// 후기 수정 폼
	@RequestMapping("/review/updateForm")
	public String reviewUpdateForm(@RequestParam("r_no") int r_no, Model model) {
		reviewDTO dto = reviewDAO.reviewView(r_no);
		model.addAttribute("dto", dto);
		return "review/update";
	}

	// 후기 수정 처리
	@RequestMapping(value = "/review/update", method = RequestMethod.POST)
	public String reviewUpdate(reviewDTO dto) {
		reviewDAO.reviewUpdate(dto);
		return "redirect:/review/list?p_no=" + dto.getP_no();
	}

	// 후기 삭제 확인 화면
	@RequestMapping("/review/deleteForm")
	public String reviewDeleteForm(@RequestParam("r_no") int r_no, Model model) {
		reviewDTO dto = reviewDAO.reviewView(r_no);
		model.addAttribute("dto", dto);
		return "review/delete";
	}

	// 후기 삭제 처리
	@RequestMapping(value = "/review/delete", method = RequestMethod.POST)
	public String reviewDelete(@RequestParam("r_no") int r_no) {
		reviewDTO dto = reviewDAO.reviewView(r_no); // 삭제 전에 p_no 미리 확보
		reviewDAO.reviewDelete(r_no);
		return "redirect:/review/list?p_no=" + dto.getP_no();
	}
}