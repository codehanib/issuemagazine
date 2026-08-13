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
	public String reviewList(Model model, Principal principal) {
		List<reviewDTO> list = reviewDAO.reviewList();
		model.addAttribute("list", list);
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
		return "redirect:/review/list";
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
		return "redirect:/review/list?r_no=" + dto.getR_no();
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
		reviewDAO.reviewDelete(r_no);
		return "redirect:/review/list";
	}
}