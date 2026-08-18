package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.issuemagazine.dto.memberDTO;

@Mapper
public interface memberDAO {
	
	//로그인용 조회,회원정보 상세보기, 수정폼
	public memberDTO findById(String m_id);
	
	//회원 목록
	public List<memberDTO> memberList();
	
	//회원가입
	public int memberInsert(memberDTO dto);
	
	//회원정보 수정
	public int memberUpdate(memberDTO dto);
	
	//회원 탈퇴
	public int memberDelete(String m_id);
	
	//관리자가 회원 삭제
	public int adminMemberDelete(String m_no);
	
	
	int orderCount(int m_no);
	int wishlistCount(int m_no);
	int one_inquiryCount(int m_no);
}
