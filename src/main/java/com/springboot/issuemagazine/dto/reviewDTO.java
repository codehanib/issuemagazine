package com.springboot.issuemagazine.dto;

import java.util.Date;

import lombok.Data;

@Data
public class reviewDTO {
	private int r_no;
	private String r_title;
	private String r_content;
	private Date r_reg_date;
	private int m_no;
	private int p_no;
	private String m_id;
}
