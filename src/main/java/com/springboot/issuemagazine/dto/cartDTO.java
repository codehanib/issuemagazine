package com.springboot.issuemagazine.dto;

import lombok.Data;

@Data
public class cartDTO {
	private int cart_no;
	private int cart_quantity;
	private int cart_price;
	private int m_no;
	private int p_no;
	private String p_name;
	private int p_price2;
	private String P_image;
	private String cart_sub_date;
}
