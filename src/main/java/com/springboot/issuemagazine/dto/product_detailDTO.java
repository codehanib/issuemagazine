package com.springboot.issuemagazine.dto;

import java.util.Date;

import lombok.Data;

@Data
public class product_detailDTO {
	private int pd_no;
	private String pd_content;
	private int p_no;
	private int pdi_no;
	private String pdi_image;
	private int pdi_order;
}
