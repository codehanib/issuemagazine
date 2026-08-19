<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상태수정</title>

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

.title {
    position: relative;
    font-size: 18px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 20px;
    color: #222222;
    font-weight: 500;
}

/* 제목 글자 아래 두꺼운 밑줄 */
.title::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -1px;
    width: 104px;
    height: 2px;

    background-color: #222222;
}

.orders-table {
    width: 100%;
    border-collapse: collapse;
    border-top: 1px solid #ddd;
}

.orders-table th {
    height: 42px;
    font-size: 12px;
    font-weight: normal;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

.orders-table td {
    height: 70px;
    font-size: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

.orders-select {
    width: 100px;
    height: 30px;
    border: 1px solid #bbb;
    background: white;
    font-size: 12px;
}

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

    <div class="title">
        주문상태수정
    </div>
    <form action="/admin/statusUpdate" method="post">

        <input type="hidden" name="o_no" value="${orders.o_no}">

        <table class="orders-table">

            <tr>
                <th style="width: 180px;">주문번호</th>
                <th style="width: 180px;">주문날짜</th>
                <th style="width: 180px;">주문상태</th>
                <th style="width: 100px;">수정</th>
            </tr>

            <tr>

                <td>
                    ${orders.o_no}
                </td>

                <td>
                    <fmt:formatDate
                        value="${orders.o_date}"
                        pattern="yyyy-MM-dd"/>
                </td>

                <td>

                    <select name="o_status" class="orders-select">

                        <option value="상품준비중"
                            ${orders.o_status == '상품준비중' ? 'selected' : ''}>
                            상품준비중
                        </option>

                        <option value="구독중"
                            ${orders.o_status == '구독중' ? 'selected' : ''}>
                            구독중
                        </option>

                        <option value="구독만료"
                            ${orders.o_status == '구독만료' ? 'selected' : ''}>
                            구독만료
                        </option>

                    </select>

                </td>

                <td>
                    <button type="submit" class="check-btn">
                        확인
                    </button>
                </td>

            </tr>

        </table>

    </form>

</div>

<%@ include file="../footer.jsp" %>

</body>
</html>