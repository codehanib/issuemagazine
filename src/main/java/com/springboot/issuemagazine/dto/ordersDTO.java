package com.springboot.issuemagazine.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ordersDTO {
	private int o_no;
	private Date o_date;
	private String o_status;
	private int m_no;
}
