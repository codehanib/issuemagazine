package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springboot.issuemagazine.dto.wishlistDTO;

@Mapper
public interface wishlistDAO {

	// 위시리스트 목록 생성
	public int wishlistInsert(wishlistDTO odto);
	
	// 특정 회원의 주문 목록 조회
	public List<wishlistDTO> wishlistList(
			@Param("m_no") int m_no);
	
	// 주문 취소
	public int wishlistDelete(int w_no);
	
}
