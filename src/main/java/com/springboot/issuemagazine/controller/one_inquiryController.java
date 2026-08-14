package com.springboot.issuemagazine.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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

	// 1:1문의 목록 (페이징 10개씩 적용 + 비밀글 열람 권한 전달)
	@RequestMapping("/one_inquiry/list")
	public String one_inquiryList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "keyword", required = false) String keyword,
			Principal principal,
			Authentication authentication,
			Model model) {

		int recordPerPage = 10; // 페이지당 10개씩 출력
		int pageBlock = 10;     // 하단 [1]~[10] 블록 개수
		int offset = (page - 1) * recordPerPage; // DB 조회 시 건너뛸 개수

		// 1. 총 문의 개수 및 10개 목록 조회
		int totalCount = one_inquiryDAO.one_inquirySearchCount(searchType, keyword);
		List<one_inquiryDTO> list = one_inquiryDAO.one_inquirySearch(searchType, keyword, offset, recordPerPage);

		// 2. 하단 페이징 관련 계산
		int totalPage = (int) Math.ceil((double) totalCount / recordPerPage);
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		// 3. 로그인 정보 및 관리자 여부 판별 (JSP 비교용)
		String loginId = (principal != null) ? principal.getName() : "";
		boolean isAdmin = (authentication != null) && authentication.getAuthorities().stream()
				.anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

		// 4. Model에 값 바인딩
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("prev", startPage > 1);
		model.addAttribute("next", endPage < totalPage);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("loginId", loginId);
		model.addAttribute("isAdmin", isAdmin);

		return "one_inquiry/list";
	}

	// 1:1문의 상세보기 (본인 및 관리자 검증 보완)
	@RequestMapping("/one_inquiry/view")
	public String one_inquiryView(@RequestParam("oi_no") int oi_no, Principal principal, Authentication authentication, Model model) {
		one_inquiryDTO dto = one_inquiryDAO.one_inquiryView(oi_no);
		
		if (dto == null) {
			model.addAttribute("msg", "존재하지 않는 문의글입니다.");
			model.addAttribute("url", "/one_inquiry/list");
			return "common/alert";
		}

		String loginId = (principal != null) ? principal.getName() : "";
		boolean isAdmin = (authentication != null) && authentication.getAuthorities().stream()
				.anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

		// 본인도 아니고 관리자도 아닌 경우 URL 직접 접근 차단
		if (!loginId.equals(dto.getM_id()) && !isAdmin) {
			model.addAttribute("msg", "작성자 본인과 관리자만 조회할 수 있습니다.");
			model.addAttribute("url", "/one_inquiry/list");
			return "common/alert";
		}

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
	public String one_inquiryUpdateForm(@RequestParam("oi_no") int oi_no, Principal principal, Authentication authentication, Model model) {
		one_inquiryDTO dto = one_inquiryDAO.one_inquiryView(oi_no);
		String loginId = (principal != null) ? principal.getName() : "";
		boolean isAdmin = (authentication != null) && authentication.getAuthorities().stream()
				.anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

		if (dto == null || (!loginId.equals(dto.getM_id()) && !isAdmin)) {
			model.addAttribute("msg", "수정 권한이 없습니다.");
			model.addAttribute("url", "/one_inquiry/list");
			return "common/alert";
		}

		model.addAttribute("dto", dto);
		return "one_inquiry/update";
	}

	// 1:1문의 수정 처리
	@RequestMapping(value = "/one_inquiry/update", method = RequestMethod.POST)
	public String one_inquiryUpdate(one_inquiryDTO dto) {
		one_inquiryDAO.one_inquiryUpdate(dto);
		return "redirect:/one_inquiry/list";
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
			return "one_inquiry/view"; 
		}

		model.addAttribute("msg", "비밀번호가 틀렸습니다.");
		model.addAttribute("oi_no", oi_no);
		return "one_inquiry/passwordCheckForm";
	}
}