package com.springboot.issuemagazine.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.springboot.issuemagazine.dao.memberDAO;
import com.springboot.issuemagazine.dto.memberDTO;


@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private memberDAO dao;

    @Override
    public UserDetails loadUserByUsername(String m_id)
            throws UsernameNotFoundException {

        memberDTO dto = dao.findById(m_id);

        if (dto == null) {
            throw new UsernameNotFoundException("회원이 없습니다.");
        }

        return User.builder()
                .username(dto.getM_id())
                .password(dto.getM_passwd())
                .roles(dto.getM_auth())
                .build();
    }
}