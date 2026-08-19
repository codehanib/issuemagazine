package com.springboot.issuemagazine.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


@Service
public class PaymentService {

	private final RestTemplate restTemplate = new RestTemplate();
    public String getAccessToken() {

    	String url = "https://api.iamport.kr/users/getToken";

        Map<String, String> body = new HashMap<>();
        body.put("imp_key", "7824385552788271");
        body.put("imp_secret",
        			"rjSAFrDHS2CYwYRjt3fcdsvlpqDbvt5hFFUxde2ZTCrKOa79YembJ8z6ltTeS7HzNujOFBbkwDhj2Gux");

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, String>> request =
                new HttpEntity<>(body, headers);

        ResponseEntity<Map> response =
                restTemplate.postForEntity(
                        url,
                        request,
                        Map.class
                );
        
        System.out.println("===== Access Token API 응답 =====");
        System.out.println(response.getBody());


        Map responseBody = response.getBody();

        Map responseResult =
                (Map) responseBody.get("response");

        String accessToken =
                (String) responseResult.get("access_token");

        System.out.println("Access Token 발급 성공");

        return accessToken;
    }
    
    public Map getPayment(String impUid) {

        String accessToken = getAccessToken();

        String url =
                "https://api.iamport.kr/payments/" + impUid;

        System.out.println("===== 결제 조회 =====");
        System.out.println("impUid = " + impUid);
        System.out.println("url = " + url);
        System.out.println("accessToken 발급 여부 = "
                + (accessToken != null));

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", accessToken);

        HttpEntity<Void> request =
                new HttpEntity<>(headers);

        try {

            ResponseEntity<Map> response =
                    restTemplate.exchange(
                            url,
                            HttpMethod.GET,
                            request,
                            Map.class
                    );

            System.out.println("===== PortOne 결제조회 성공 =====");
            System.out.println("HTTP 상태 = " + response.getStatusCode());
            System.out.println("응답 = " + response.getBody());

            return response.getBody();

        } catch (Exception e) {

            System.out.println("===== 결제 조회 실패 =====");
            System.out.println("impUid = " + impUid);
            System.out.println("url = " + url);
            System.out.println("에러 = " + e);

            throw e;
        }
    }
    
    public Map getPaymentByMerchantUid(String merchantUid) {

        String accessToken = getAccessToken();

        String url =
                "https://api.iamport.kr/payments/find/"
                + merchantUid
                + "/paid";

        System.out.println("===== merchant_uid 결제 조회 =====");
        System.out.println("merchantUid = " + merchantUid);
        System.out.println("url = " + url);

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", accessToken);

        HttpEntity<Void> request =
                new HttpEntity<>(headers);

        try {

            ResponseEntity<Map> response =
                    restTemplate.exchange(
                            url,
                            HttpMethod.GET,
                            request,
                            Map.class
                    );

            System.out.println("===== merchant_uid 조회 성공 =====");
            System.out.println("HTTP 상태 = " + response.getStatusCode());
            System.out.println("응답 = " + response.getBody());

            return response.getBody();

        } catch (Exception e) {

            System.out.println("===== merchant_uid 조회 실패 =====");
            System.out.println("merchantUid = " + merchantUid);
            System.out.println("url = " + url);
            System.out.println("에러 = " + e);

            throw e;
        }
    }
    
}