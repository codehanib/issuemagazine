package com.springboot.issuemagazine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dto.memberDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class memberController {
	@Autowired
	private memberDAO dao;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/")
	public String root() {
		return "redirect:/main";
	}
	
	@RequestMapping("/main")
	public String main() {
	    return "main";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:/loginForm";
	}
	
	@RequestMapping("/loginError")
	public String loginError() {
		return "loginError";
	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		return "writeForm";
	}
	
	@RequestMapping("/memberInsert")
	public String ownerInsert(HttpServletRequest request, memberDTO dto) {
		 
	    String m_id = request.getParameter("m_id");

	    String m_tel = request.getParameter("m_tel");
	    String m_tel2 = request.getParameter("m_tel2");
	    String m_tel3 = request.getParameter("m_tel3");

	    String m_addr = request.getParameter("m_addr");
	    String m_addr2 = request.getParameter("m_addr2");
	    String m_zipno = request.getParameter("m_zipno");

	    String m_email = request.getParameter("m_email");
	    String m_email2 = request.getParameter("m_email2");

	    String m_passwd = request.getParameter("m_passwd");

	    dto.setM_id(m_id);

	    // 연락처
	    dto.setM_tel(m_tel + "-" + m_tel2 + "-" + m_tel3);

	    // 주소
	    dto.setM_addr(m_addr + "," + m_addr2);

	    // 우편번호
	    dto.setM_zipno(m_zipno);

	    // 이메일
	    dto.setM_email(m_email + "@" + m_email2);

	    // 비밀번호 암호화
	    dto.setM_passwd(passwordEncoder.encode(m_passwd));

	    int result = dao.memberInsert(dto);

	    System.out.println("회원가입 INSERT 결과 = " + result);
	    System.out.println("회원가입 DTO = " + dto);

	    return "redirect:/main";
	}
	
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "jusoPopup";
	}
	
	@RequestMapping("/member/memberviewForm")
	public String memberviewForm(Authentication authentication, Model model) {
		String m_id = authentication.getName();
		memberDTO dto = dao.findById(m_id);
		model.addAttribute("view",dto);
		return "member/memberviewForm";
	}
	
	//회원본인이 회원 탈퇴
	@RequestMapping("/member/memberDelete")
	public String memberDelete(HttpServletRequest request) {
	    String m_id = request.getParameter("m_id");
	    dao.memberDelete(m_id);
	    return "redirect:/logout";
	}
	
	//관리자가 회원목록에서 회원 삭제
	@RequestMapping("/admin/memberDelete")
	public String adminMemberDelete(HttpServletRequest request) {
	    String m_no = request.getParameter("m_no");
	    dao.adminMemberDelete(m_no);

	    return "redirect:/admin/memberList";
	}
	
	// 비밀번호 확인폼 (수정/탈퇴 공용)
		@RequestMapping("/member/passwordCheckForm")
		public String passwordCheckForm(HttpServletRequest request,Model model) {
		    String mode = request.getParameter("mode");
		    model.addAttribute("mode", mode);
		    return "member/passwordCheckForm";
		}
		
	// 비밀번호 확인 처리
		@RequestMapping("/member/passwordCheck")
		public String passwordCheck(Authentication authentication,HttpServletRequest request, Model model) {
		    String mode = request.getParameter("mode");
		    String m_passwd = request.getParameter("m_passwd");

		    String m_id = authentication.getName();
		    memberDTO dto = dao.findById(m_id);

		    if(dto != null && passwordEncoder.matches(m_passwd, dto.getM_passwd())) {
		        if("update".equals(mode)) {
		            model.addAttribute("updateForm", dto);
		            return "member/memberupdateForm";
		        }
		        else if("delete".equals(mode)) {
		            dao.memberDelete(m_id);
		            return "redirect:/logout";
		        }
		    }

		    model.addAttribute("msg", "비밀번호가 틀렸습니다.");
		    model.addAttribute("mode", mode);

		    return "member/passwordCheckForm";
		}
	
		@RequestMapping("/member/update")
		public String ownerupdate(HttpServletRequest request, memberDTO dto) {

		    String m_id = request.getParameter("m_id");

		    String m_tel = request.getParameter("m_tel");
		    String m_tel2 = request.getParameter("m_tel2");
		    String m_tel3 = request.getParameter("m_tel3");

		    String m_addr = request.getParameter("m_addr");
		    String m_addr2 = request.getParameter("m_addr2");
		    String m_zipno = request.getParameter("m_zipno");

		    String m_email = request.getParameter("m_email");
		    String m_email2 = request.getParameter("m_email2");

		    String m_passwd = request.getParameter("m_passwd");

		    // 기존 회원 조회
		    memberDTO oldDto = dao.findById(m_id);

		    dto.setM_id(m_id);

		    // 전화번호
		    dto.setM_tel(m_tel + "-" + m_tel2 + "-" + m_tel3);

		    // 주소
		    dto.setM_addr(m_addr + "," + m_addr2);

		    // 우편번호
		    dto.setM_zipno(m_zipno);

		    // 이메일
		    dto.setM_email(m_email + "@" + m_email2);

		    // 비밀번호
		    if (m_passwd == null || m_passwd.trim().isEmpty()) {
		        // 비밀번호를 입력하지 않으면 기존 비밀번호 유지
		        dto.setM_passwd(oldDto.getM_passwd());
		    } else {
		        // 새로운 비밀번호를 입력하면 암호화해서 저장
		        dto.setM_passwd(passwordEncoder.encode(m_passwd));
		    }

		    dao.memberUpdate(dto);

		    return "redirect:/main";
		}
		
		@RequestMapping("/member/updateForm")
		public String ownerupdateForm(HttpServletRequest request, Model model) {
			String m_id = request.getParameter("m_id");
			model.addAttribute("updateForm",dao.findById(m_id));
			return "member/memberupdateForm";
		}
		
		@RequestMapping("/member/mypage")
		public String mymage() {
		    return "member/mypage";
		}
		
		
		
		
		
		
		@RequestMapping("/admin/memberList")
		public String memberList(Model model) {

		    List<memberDTO> memberList = dao.memberList();

		    model.addAttribute("memberList", memberList);

		    return "admin/memberList";
		}
		
}
