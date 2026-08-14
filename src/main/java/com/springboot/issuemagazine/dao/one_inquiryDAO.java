package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springboot.issuemagazine.dto.one_inquiryDTO;

@Mapper
public interface one_inquiryDAO {

	// 검색 조건에 따른 총 문의 개수
	public int one_inquirySearchCount(
			@Param("searchType") String searchType,
			@Param("keyword") String keyword);

	// 페이징 처리된 1:1 문의 목록
	public List<one_inquiryDTO> one_inquirySearch(
			@Param("searchType") String searchType,
			@Param("keyword") String keyword,
			@Param("offset") int offset,
			@Param("recordPerPage") int recordPerPage);

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