package com.springboot.issuemagazine.controller;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	@Autowired
	private PasswordEncoder passwordEncoder;

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
		return "redirect:/one_inquiry/list?oi_no=" + dto.getOi_no();
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

	// 답변 등록 처리 (관리자)
	@RequestMapping(value = "/one_inquiry/answer", method = RequestMethod.POST)
	public String one_inquiryAnswer(one_inquiryDTO dto) {
		dto.setOi_status("답변완료");
		one_inquiryDAO.one_inquiryAnswer(dto);
		return "redirect:/one_inquiry/view?oi_no=" + dto.getOi_no();
	}


	// 비밀번호 확인 폼 (일반 회원이 본인 문의 열람 전 거치는 화면)
	@RequestMapping("/one_inquiry/passwordCheckForm")
	public String one_inquiryPasswordCheckForm(@RequestParam("oi_no") int oi_no, Model model) {
		model.addAttribute("oi_no", oi_no);
		return "one_inquiry/passwordCheckForm";
	}

	// 비밀번호 확인 처리
	@RequestMapping(value = "/one_inquiry/passwordCheck", method = RequestMethod.POST)
	public String one_inquiryPasswordCheck(@RequestParam("oi_no") int oi_no,
			@RequestParam("m_passwd") String m_passwd, Principal principal, Model model) {

		one_inquiryDTO dto = one_inquiryDAO.one_inquiryView(oi_no);

		// 본인 글이 아니면 열람 자체를 막음
		if (dto == null || !dto.getM_id().equals(principal.getName())) {
			model.addAttribute("msg", "본인 문의만 열람할 수 있습니다.");
			model.addAttribute("oi_no", oi_no);
			return "one_inquiry/passwordCheckForm";
		}

		memberDTO mdto = memberdao.findById(principal.getName());

		// 로그인 계정 비밀번호와 대조
		if (mdto != null && passwordEncoder.matches(m_passwd, mdto.getM_passwd())) {
			model.addAttribute("dto", dto);
			return "one_inquiry/view"; // forward: URL은 그대로, view.jsp를 바로 렌더링
		}

		model.addAttribute("msg", "비밀번호가 틀렸습니다.");
		model.addAttribute("oi_no", oi_no);
		return "one_inquiry/passwordCheckForm";
	}
}
