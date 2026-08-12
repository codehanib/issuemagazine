package com.springboot.issuemagazine.dto;

import lombok.Data;

@Data
public class memberDTO {
	
	private int 	m_no;
	private String	m_id;
	private String 	m_passwd;
	private String	m_name;
	private String 	m_zipno;
	private String 	m_addr;
	private String 	m_tel;
	private String 	m_email;
	private String 	m_auth;
}
