package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.issuemagazine.dto.shipmentDTO;

@Mapper
public interface IshipmentDAO {
	// 주문시 배송 정보 자동 등록 insert
	public int shipmentInsert(int s_no);
	
	// 관리자: 전체 배송 목록 조회
	public List<shipmentDTO> shipmentList();
	
	// 회원: 자신의 배송 목록만 조회
	public List<shipmentDTO> shipmentMemberList(int m_no);
	
	// 배송목록 상세 조회
	public shipmentDTO shipmentDetail(int s_no);
	
	// 관리자: 배송 상태 변경 update
	public int shipmentUpdate(shipmentDTO sdot);
}
