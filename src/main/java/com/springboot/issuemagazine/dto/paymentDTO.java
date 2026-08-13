package com.springboot.issuemagazine.dto;

import java.util.Date;

import lombok.Data;

@Data
public class paymentDTO {
	private int pay_no;
	private int pay_price;
	private String pay_type;
	private String pay_status;
	private Date pay_date;
	private int o_no;
}
