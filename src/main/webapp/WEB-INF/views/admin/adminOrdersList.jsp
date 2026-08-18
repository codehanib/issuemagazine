<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 주문리스트</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    color: #222;
}

.container {
    width: 90%;
    max-width: 1100px;
    margin: 40px auto;
}

/* 제목 */
.title {
    font-size: 18px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

/* 테이블 */
.orders-table {
    width: 100%;
    border-collapse: collapse;
    border-top: 1px solid #ddd;
}

/* 헤더 */
.orders-table th {
    height: 42px;
    font-size: 12px;
    font-weight: normal;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* 내용 */
.orders-table td {
    height: 60px;
    font-size: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* 주문번호 */
.order-number {
    color: #222;
}

/* 가격 */
.price {
    text-align: right !important;
    padding-right: 20px;
}

/* 배송정보 확인 버튼 */
.check-btn {
    width: 60px;
    height: 25px;
    border: 1px solid #bbb;
    background: white;
    font-size: 11px;
    cursor: pointer;
}

.check-btn:hover {
    background: #f5f5f5;
}

/* 데이터가 없을 때 */
.empty {
    height: 120px !important;
    text-align: center !important;
    color: #999;
}
</style>

</head>

<body>

<%@ include file="../header.jsp" %>

<div class="container">
    <div class="title">주문 리스트</div>
    
    <table class="orders-table">
        <tr>
            <th style="width: 90px;">회원번호</th>
            <th style="width: 150px;">주문번호</th>
            <th style="width: 130px;">주문날짜</th>
            <th style="width: 200px;">상품명</th>
            <th style="width: 80px;">수량</th>
            <th style="width: 130px;">가격</th>
            <th style="width: 130px;">주문상태</th>
            <th style="width: 100px;">배송정보</th>
        </tr>
        <c:choose>
            <c:when test="${not empty ordersList}">
                <c:forEach var="orders" items="${ordersList}">
                    <tr>
                        <!-- 회원번호 -->
                        <td>
                            <a href="/member/memberviewForm?m_no=${orders.m_no}">
        						${orders.m_no}
    						</a>
                        </td>

                        <!-- 주문번호 -->
                        <td class="order-number">
                                ${orders.o_no}
                        </td>

                        <!-- 주문날짜 -->
                        <td>
                            <fmt:formatDate value="${orders.o_date}" pattern="yyyy-MM-dd"/>
                        </td>

                        <!-- 상품명 -->
                        <td>
                            ${orders.od_name}
                        </td>

                        <!-- 수량 -->
                        <td>
                            ${orders.od_quantity}
                        </td>

                        <!-- 가격 -->
                        <td class="price">
                            ${orders.od_price}원
                        </td>

                        <!-- 주문상태 -->
                        <td>
                            ${orders.o_status}
                        </td>

                        <!-- 배송정보 -->
                        <td>
                            <button type="button"
                                    class="check-btn"
                                    onclick="location.href='/admin/updateForm?o_no=${orders.o_no}'">
                                수정
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>

            <c:otherwise>

                <tr>
                    <td colspan="8" class="empty">
                        주문내역이 없습니다.
                    </td>
                </tr>

            </c:otherwise>

        </c:choose>

    </table>

</div>

<%@ include file="../footer.jsp" %>

</body>
</html>