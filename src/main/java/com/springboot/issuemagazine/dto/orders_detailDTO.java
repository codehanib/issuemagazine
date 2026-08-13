package com.springboot.issuemagazine.dto;

import java.util.Date;

import lombok.Data;

@Data
public class orders_detailDTO {
	private int od_no;
	private String od_name;
	private int od_quantity;
	private String od_sub_date;
	private int od_price;
	private int o_no;
	private int p_no;
	private int m_no;
}
