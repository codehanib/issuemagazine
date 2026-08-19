package com.springboot.issuemagazine.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ordersDTO {
	private int o_no;
	private Date o_date;
	private String o_status;
	private int m_no;
	
	// 주문 목록에서 사용할 상품 정보
    private int p_no;
    private String p_image;
    private String od_name;
    private int od_price;
    private int od_quantity;
    
    // 주문 상품 개수
    private int product_count;
    
    private List<orders_detailDTO> oddtoList;
}
