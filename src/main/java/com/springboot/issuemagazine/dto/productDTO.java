package com.springboot.issuemagazine.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class productDTO {
    private int p_no;
    private String p_name;
    private int p_price;
    private int p_price2;
    private String p_publisher;
    private String p_country;
    private String p_code;
    private String p_image;
    private Timestamp p_reg_date;
    private int c_no;

    
}