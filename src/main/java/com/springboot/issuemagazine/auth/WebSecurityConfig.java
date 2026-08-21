package com.springboot.issuemagazine.auth;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

@Configuration
public class WebSecurityConfig {
	@Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		http.csrf((csrf) -> csrf.disable())
			.cors((cors) -> cors.disable())
			.authorizeHttpRequests(request -> request
					.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
					.requestMatchers("/","/writeForm","/loginForm","/jusoPopup","/memberInsert",
									"/product/**","/header","/footer","/main","/customerService2","/product/productDetail","/product/productList").permitAll()
					
					.requestMatchers("/notice/list", "/notice/view","/product/productDetail").permitAll()
					.requestMatchers("/notice/write*", "/notice/update*", "/notice/delete*").hasRole("ADMIN")
										
					// [수정] .webp 등 다양한 이미지 확장자 및 루트 정적 파일/업로드 경로 추가
					.requestMatchers("/css/**", "/js/**", "/images/**", "/*.webp", "/*.jpg", "/*.png", "/upload/**").permitAll() 
					.requestMatchers("/guest/**").permitAll()
					.requestMatchers("/member/**").hasAnyRole("USER","ADMIN")
					.requestMatchers("/admin/**").hasAnyRole("ADMIN")
					.anyRequest().authenticated()
			);
			
		
		// 로그인
		http.formLogin((formLogin) -> formLogin
				.loginPage("/main")
				.loginProcessingUrl("/j_spring_security_check")
				// [수정] 두 번째 인자로 true를 전달하여 로그인 후 이전 요청을 무시하고 무조건 "/" 로 이동시킵니다.
				.defaultSuccessUrl("/", true) 
				.failureUrl("/loginError")
				.usernameParameter("m_id")
				.passwordParameter("m_passwd")
				.permitAll()
				);
		
		// 로그아웃
		http.logout((logout) -> logout
				.logoutUrl("/logout")
				.logoutSuccessUrl("/")
				.permitAll()
				);
		
		return http.build();
	}
}