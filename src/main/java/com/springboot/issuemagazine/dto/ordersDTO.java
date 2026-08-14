package com.springboot.issuemagazine.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ordersDTO {
	private int o_no;
	private Date o_date;
	private String o_status;
	private int m_no;
	
	// 주문 상세
    private int od_no;
    private String od_name;
    private int od_quantity;
    private int od_price;

    // 상품
    private String p_image;
    private String p_name;
}
