<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송정보확인</title>

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
    height: 70px;
    font-size: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* 배송번호 */
.shipment-number {
    color: #222;
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

    <div class="title">
        배송정보확인
    </div>

    <table class="orders-table">

        <tr>
            <th style="width: 180px;">배송번호</th>
            <th style="width: 220px;">택배사</th>
            <th style="width: 220px;">운송장번호</th>
            <th style="width: 220px;">배송상태</th>
        </tr>

        <c:choose>

            <c:when test="${not empty shipmentMemberList}">

                <c:forEach var="shipment" items="${shipmentMemberList}">

                    <tr>

                        <!-- 배송번호 -->
                        <td class="shipment-number">
                            ${shipment.s_no}
                        </td>

                        <!-- 택배사 -->
                        <td>
                            ${shipment.s_delivery}
                        </td>

                        <!-- 운송장번호 -->
                        <td>
                            ${shipment.s_d_no}
                        </td>

                        <!-- 배송상태 -->
                        <td>
                            ${shipment.s_status}
                        </td>

                    </tr>

                </c:forEach>

            </c:when>

            <c:otherwise>

                <tr>
                    <td colspan="4" class="empty">
                        배송정보가 없습니다.
                    </td>
                </tr>

            </c:otherwise>

        </c:choose>

    </table>

</div>

<%@ include file="../footer.jsp" %>

</body>
</html>