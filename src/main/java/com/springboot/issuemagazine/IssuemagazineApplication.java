package com.springboot.issuemagazine;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class IssuemagazineApplication {

	public static void main(String[] args) {
		SpringApplication.run(IssuemagazineApplication.class, args);
		
		//BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        //String encoded = encoder.encode("1234");
        //System.out.println("암호화 결과: " + encoded);
	}

}
