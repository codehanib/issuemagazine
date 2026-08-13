package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.issuemagazine.dto.productDTO;
import com.springboot.issuemagazine.dto.product_detailDTO;

@Mapper
public interface IproductDAO {
	// 상품 목록 보기 select
	public List<productDTO> productList();
	
	// 상품 하나의 기본 정보 select
	public productDTO productdetail(int p_no);
	
	// 상품의 상세정보와 이미지
	public List<product_detailDTO> product_detailList(int p_no);
	
	// 상품 삭제 delete
	public int productDelete(int p_no);
}
