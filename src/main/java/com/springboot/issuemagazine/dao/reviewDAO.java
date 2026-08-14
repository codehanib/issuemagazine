package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springboot.issuemagazine.dto.reviewDTO;

@Mapper
public interface reviewDAO {

	// 총 후기 개수 조회
	public int reviewListCount(@Param("p_no") Integer p_no);

	// 페이징 처리된 후기 목록 조회
	public List<reviewDTO> reviewList(
			@Param("p_no") Integer p_no,
			@Param("offset") int offset,
			@Param("recordPerPage") int recordPerPage);

	// 후기정보상세보기
	public reviewDTO reviewView(int r_no);

	// 후기작성
	public int reviewWrite(reviewDTO dto);

	// 후기정보수정
	public int reviewUpdate(reviewDTO dto);

	// 후기삭제
	public int reviewDelete(int r_no);
}