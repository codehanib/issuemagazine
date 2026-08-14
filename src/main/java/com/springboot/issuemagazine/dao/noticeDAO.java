package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springboot.issuemagazine.dto.noticeDTO;

@Mapper
public interface noticeDAO {
	
	// 검색 조건에 따른 총 게시글 수
	public int noticeSearchCount(
			@Param("searchType") String searchType,
			@Param("keyword") String keyword);

	// 페이징 처리된 목록 조회
	public List<noticeDTO> noticeSearch(
			@Param("searchType") String searchType,
			@Param("keyword") String keyword,
			@Param("offset") int offset,
			@Param("recordPerPage") int recordPerPage);

	// 공지사항정보상세보기
	public noticeDTO noticeView(int n_no);

	// 공지작성
	public int noticeWrite(noticeDTO dto);

	// 공지정보수정
	public int noticeUpdate(noticeDTO dto);

	// 공지 조회수 증가
	public int noticeCountUp(int n_no);

	// 공지삭제	
	public int noticeDelete(int n_no);

	// 이전글
	public noticeDTO noticePrev(int n_no);

	// 다음글
	public noticeDTO noticeNext(int n_no);
}