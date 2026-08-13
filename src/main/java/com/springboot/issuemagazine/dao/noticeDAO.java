package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.issuemagazine.dto.noticeDTO;

@Mapper
public interface noticeDAO {

	public List<noticeDTO> noticeList();
	// 공지사항정보상세보기
	public noticeDTO noticeView(int n_no);
	// 공지작성
	public int noticeWrite(noticeDTO dto);
	// 공지정보수정
	public int noticeUpdate(noticeDTO dto);
	// 공지삭제
	public int noticeDelete(int n_no);
}
