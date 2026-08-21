package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springboot.issuemagazine.dto.productDTO;
import com.springboot.issuemagazine.dto.product_detailDTO;

@Mapper
public interface IproductDAO {
	// 상품 목록 보기 select
	public List<productDTO> productList(@Param("start") int start,
	        							@Param("pageSize") int pageSize,
	        							@Param("sort") String sort);
	
	public List<productDTO> mainProductList(
	        @Param("start") int start,
	        @Param("pageSize") int pageSize);
	
	// 카테고리별 상품 목록 보기 select
	public List<productDTO> productListCategory(
	        @Param("c_no") int c_no,
	        @Param("start") int start,
	        @Param("pageSize") int pageSize,
	        @Param("sort") String sort
	);
	
	// 상품 하나의 기본 정보 select
	public productDTO productdetail(int p_no);
	
	// 상품의 상세정보와 이미지
	public List<product_detailDTO> product_detailList(int p_no);
	
	// 상품 삭제 delete
	public int productDelete(int p_no);
	
	// 상품 전체 개수
	public int productCount();
	
	// 카테고리별 상품 개수
	public int productCountCategory(@Param("c_no") int c_no);
	
	// 검색창
	public List<productDTO> productSearch(String keyword);
	
	// 상품 등록 insert
	public int productInsert(productDTO dto);

	//  상품 수정 update
	public int productUpdate(productDTO dto);
	
	
	
}
