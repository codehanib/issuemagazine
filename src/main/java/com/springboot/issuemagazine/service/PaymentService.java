package com.springboot.issuemagazine.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class PaymentService {

    public void getAccessToken() {

        String url = "https://api.iamport.kr/users/getToken";

        // 포트원 REST API 인증 정보
        Map<String, String> body = new HashMap<>();
        body.put("imp_key", "7824385552788271");
        body.put("imp_secret", "AAAAA");

        // HTTP 요청
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, String>> request =
                new HttpEntity<>(body, headers);

        ResponseEntity<String> response =
                restTemplate.postForEntity(
                        url,
                        request,
                        String.class
                );

        System.out.println("포트원 응답:");
        System.out.println(response.getBody());
    }
}