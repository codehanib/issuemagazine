package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.issuemagazine.dto.one_inquiryDTO;

@Mapper
public interface one_inquiryDAO {

	public List<one_inquiryDTO> one_inquiryList();
	// 1:1문의상세보기
	public one_inquiryDTO one_inquiryView(int oi_no);
	// 1:1문의작성
	public int one_inquiryWrite(one_inquiryDTO dto);
	// 1:1문의답변 회원
	public int one_inquiryUpdate(one_inquiryDTO dto);
	// 1:1문의답변 관리자
	public int one_inquiryAnswer(one_inquiryDTO dto);
	// 1:1문의삭제
	public int one_inquiryDelete(int oi_no);
}
