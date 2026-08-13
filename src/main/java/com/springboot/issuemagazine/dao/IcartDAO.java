package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.issuemagazine.dto.cartDTO;

@Mapper
public interface IcartDAO {
	// 장바구니 등록 insert
	public int cartInsert(cartDTO cdto);
	
	// 장바구니 목록 보기 select
	public List<cartDTO> cartList(int m_no);

	// 수량 변경 update
	public int cartUpdate(cartDTO cdto);
	
	// 장바구니 목록 삭제 delete
	public int cartDelete(int c_no);
	
}
