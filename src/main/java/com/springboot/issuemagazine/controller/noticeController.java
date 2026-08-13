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
import com.springboot.issuemagazine.dao.noticeDAO;
import com.springboot.issuemagazine.dto.memberDTO;
import com.springboot.issuemagazine.dto.noticeDTO;

@Controller
public class noticeController {

	@Autowired
	private noticeDAO noticeDAO;

	@Autowired
	private memberDAO memberdao;   
	// 공지 목록
	@RequestMapping("/notice/list")
	public String noticeList(Model model) {
		List<noticeDTO> list = noticeDAO.noticeList();
		model.addAttribute("list", list);
		return "notice/list";
	}

	// 공지 상세보기
		@RequestMapping("/notice/view")
		public String noticeView(@RequestParam("n_no") int n_no, Model model) {
			noticeDAO.noticeCountUp(n_no);            // 조회수 +1 (먼저 실행)
			noticeDTO dto = noticeDAO.noticeView(n_no); // 증가된 값으로 다시 조회
			model.addAttribute("dto", dto);
			return "notice/view";
		}

	// 공지 작성 폼
	@RequestMapping("/notice/writeForm")
	public String noticeWriteForm() {
		return "notice/write";
	}

	// 공지 작성 처리
	@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
	public String noticeWrite(noticeDTO dto, Principal principal) {   

		String m_id = principal.getName();         
		memberDTO mdto = memberdao.findById(m_id);
		dto.setM_no(mdto.getM_no());

		noticeDAO.noticeWrite(dto);
		return "redirect:/notice/list";
	}

	// 공지 수정 폼
	@RequestMapping("/notice/updateForm")
	public String noticeUpdateForm(@RequestParam("n_no") int n_no, Model model) {
		noticeDTO dto = noticeDAO.noticeView(n_no);
		model.addAttribute("dto", dto);
		return "notice/update";
	}

	// 공지 수정 처리
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public String noticeUpdate(noticeDTO dto) {
		noticeDAO.noticeUpdate(dto);
		return "redirect:/notice/list?n_no=" + dto.getN_no();
	}

	// 공지 삭제 확인 화면
	@RequestMapping("/notice/deleteForm")
	public String noticeDeleteForm(@RequestParam("n_no") int n_no, Model model) {
		noticeDTO dto = noticeDAO.noticeView(n_no);
		model.addAttribute("dto", dto);
		return "notice/delete";
	}

	// 공지 삭제 처리
	@RequestMapping(value = "/notice/delete", method = RequestMethod.POST)
	public String noticeDelete(@RequestParam("n_no") int n_no) {
		noticeDAO.noticeDelete(n_no);
		return "redirect:/notice/list";
	}
	
}