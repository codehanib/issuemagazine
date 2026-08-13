package com.springboot.issuemagazine.dto;

import java.util.Date;

import lombok.Data;

@Data
public class noticeDTO {
	private int n_no;
	private String n_title;
	private String n_content;
	private Date n_reg_date;
	private int n_count;
	private int m_no;
}
