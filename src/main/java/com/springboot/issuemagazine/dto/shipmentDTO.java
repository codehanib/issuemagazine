package com.springboot.issuemagazine.dto;

import java.util.Date;

import lombok.Data;

@Data
public class shipmentDTO {
	private int s_no;
	private String s_delivery;
	private String s_d_no;
	private String s_status;
	private int o_no;
	private int m_no;
}
