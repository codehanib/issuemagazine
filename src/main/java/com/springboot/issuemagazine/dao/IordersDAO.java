package com.springboot.issuemagazine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springboot.issuemagazine.dto.ordersDTO;
import com.springboot.issuemagazine.dto.orders_detailDTO;

@Mapper
public interface IordersDAO {

    // 주문 생성
    public int ordersInsert(ordersDTO odto);

    // 주문 상세 생성
    public int ordersDetailInsert(orders_detailDTO oddto);

    // 특정 회원의 주문 목록
    public List<ordersDTO> ordersList(int m_no);

    // 특정 회원의 주문 상세
    public List<orders_detailDTO> ordersDetailList(
            @Param("m_no") int m_no,
            @Param("o_no") int o_no
    );

    // 주문 취소
    public int ordersDelete(
            @Param("m_no") int m_no,
            @Param("o_no") int o_no);
    
    
    // 관리자: 전체 주문 목록
    public List<ordersDTO> adminOrdersList();
    
    // 관리자: 주문 상태 수정
    public int statusUpdate(ordersDTO dto);
    
    // 관리자: 주문 상태 수정 폼 조회
    public ordersDTO statusUpdateForm(int o_no);
}