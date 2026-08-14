package com.springboot.issuemagazine.dto;

import java.util.Date;

import lombok.Data;

@Data
public class cartDTO {
	private int cart_no;
	private int cart_quantity;
	private int cart_price;
	private int m_no;
	private int p_no;
	private String p_name;
	private int p_price;
	private String P_image;
}
