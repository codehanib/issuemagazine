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
	
	// 장바구니 선택 삭제 delete
	public int cartDelete(int cart_no);
	
	// 장바구니 전체 삭제 delete
	public int cartDeleteAll(int m_no);
	
	// 장바구니 상품 수량 증가 update
	public int cartUpdatePlus(cartDTO cdto);
	
}
