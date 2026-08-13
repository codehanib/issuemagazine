package com.springboot.issuemagazine.dto;

import lombok.Data;

@Data
public class wishlistDTO {

	private int w_no;
	private int	m_no;
	private int p_no;
	
	// 상품 정보
    private String p_name;
    private int p_price2;
    private String p_image;

}
