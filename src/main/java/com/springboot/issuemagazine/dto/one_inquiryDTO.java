package com.springboot.issuemagazine.dto;

import java.util.Date;

import lombok.Data;

@Data
public class one_inquiryDTO {
	private int oi_no;
	private String oi_title;
	private String oi_content;
	private String oi_answer;
	private Date oi_reg_date;
	private String oi_status;
	private int m_no;
}
