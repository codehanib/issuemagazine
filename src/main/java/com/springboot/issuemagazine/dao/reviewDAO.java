package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.issuemagazine.dto.reviewDTO;

@Mapper
public interface reviewDAO {

	public List<reviewDTO> reviewList();
	// 후기정보상세보기
	public reviewDTO reviewView(int r_no);
	// 후기작성
	public int reviewWrite(reviewDTO dto);
	// 후기정보수정
	public int reviewUpdate(reviewDTO dto);
	// 후기삭제
	public int reviewDelete(int r_no);
}
