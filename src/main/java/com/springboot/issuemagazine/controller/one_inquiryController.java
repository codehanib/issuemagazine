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
import com.springboot.issuemagazine.dao.one_inquiryDAO;
import com.springboot.issuemagazine.dto.memberDTO;
import com.springboot.issuemagazine.dto.one_inquiryDTO;

@Controller
public class one_inquiryController {

	@Autowired
	private one_inquiryDAO one_inquiryDAO;

	@Autowired
	private memberDAO memberdao;   
	// 1:1문의 목록
	@RequestMapping("/one_inquiry/list")
	public String one_inquiryList(Model model) {
		List<one_inquiryDTO> list = one_inquiryDAO.one_inquiryList();
		model.addAttribute("list", list);
		return "one_inquiry/list";
	}

	// 1:1문의 상세보기
	@RequestMapping("/one_inquiry/view")
	public String one_inquiryView(@RequestParam("oi_no") int oi_no, Model model) {
		one_inquiryDTO dto = one_inquiryDAO.one_inquiryView(oi_no);
		model.addAttribute("dto", dto);
		return "one_inquiry/view";
	}

	// 1:1문의 작성 폼
	@RequestMapping("/one_inquiry/writeForm")
	public String one_inquiryWriteForm() {
		return "one_inquiry/write";
	}

	// 1:1문의 작성 처리
	@RequestMapping(value = "/one_inquiry/write", method = RequestMethod.POST)
	public String one_inquiryWrite(one_inquiryDTO dto, Principal principal) {   

		String m_id = principal.getName();         
		memberDTO mdto = memberdao.findById(m_id);
		dto.setM_no(mdto.getM_no());

		one_inquiryDAO.one_inquiryWrite(dto);
		return "redirect:/one_inquiry/list";
	}

	// 1:1문의 수정 폼
	@RequestMapping("/one_inquiry/updateForm")
	public String one_inquiryUpdateForm(@RequestParam("oi_no") int oi_no, Model model) {
		one_inquiryDTO dto = one_inquiryDAO.one_inquiryView(oi_no);
		model.addAttribute("dto", dto);
		return "one_inquiry/update";
	}

	// 1:1문의 수정 처리
	@RequestMapping(value = "/one_inquiry/update", method = RequestMethod.POST)
	public String one_inquiryUpdate(one_inquiryDTO dto) {
		one_inquiryDAO.one_inquiryUpdate(dto);
		return "redirect:/one_inquiry/view?oi_no=" + dto.getOi_no();
	}

	// 1:1문의 삭제 확인 화면
	@RequestMapping("/one_inquiry/deleteForm")
	public String one_inquiryDeleteForm(@RequestParam("oi_no") int oi_no, Model model) {
		one_inquiryDTO dto = one_inquiryDAO.one_inquiryView(oi_no);
		model.addAttribute("dto", dto);
		return "one_inquiry/delete";
	}

	// 1:1문의 삭제 처리
	@RequestMapping(value = "/one_inquiry/delete", method = RequestMethod.POST)
	public String one_inquiryDelete(@RequestParam("oi_no") int oi_no) {
		one_inquiryDAO.one_inquiryDelete(oi_no);
		return "redirect:/one_inquiry/list";
	}
	
	// 답변 작성 폼 (관리자)
		@RequestMapping("/one_inquiry/answerForm")
		public String one_inquiryAnswerForm(@RequestParam("oi_no") int oi_no, Model model) {
			one_inquiryDTO dto = one_inquiryDAO.one_inquiryView(oi_no);
			model.addAttribute("dto", dto);
			return "one_inquiry/answer";
		}

	// 답변 등록 처리 (관리자)
	@RequestMapping(value = "/one_inquiry/answer", method = RequestMethod.POST)
	public String one_inquiryAnswer(one_inquiryDTO dto) {
		dto.setOi_status("답변완료");
		one_inquiryDAO.one_inquiryAnswer(dto);
		return "redirect:/one_inquiry/view?oi_no=" + dto.getOi_no();
	}
}