package com.springboot.issuemagazine.dto;

import java.util.Date;

import lombok.Data;

@Data
public class productDTO {
	private int 	p_no;
	private String	p_name;
	private int 	p_price;
	private int 	p_price2;
	private String	p_country;
	private int 	p_code;
	private String 	p_period;
	private String 	p_image;
	private Date	p_reg_date;
	private int		c_no;
	
	private int 	pd_no;
	private String	pd_content;
	
	private int 	pdi_no;
	private String	pdi_image;
	private int		pdi_order;
}
