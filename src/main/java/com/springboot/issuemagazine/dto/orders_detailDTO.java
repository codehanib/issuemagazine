package com.springboot.issuemagazine.dto;

import java.util.Date;

import lombok.Data;

@Data
public class orders_detailDTO {
	private int od_no;
	private String od_name;
	private int od_quantity;     //수량
	private String od_sub_date; // 구독기간
	private int od_price;      // 할인가 × 구독기간 × 수량
	private int o_no;
	private int p_no;
	
	// 상품 이미지
    private String p_image;
}
