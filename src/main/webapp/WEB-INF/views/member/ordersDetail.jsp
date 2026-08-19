<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역상세</title>

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

/* 안내문 */
.text {
    font-size: 13px;
    color: #aaa;
    line-height: 1.6;
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
    height: 100px;
    font-size: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* 상품 이미지 */
.product-image {
    width: 60px;
    height: 75px;
    object-fit: cover;
}

/* 가격 */
.price {
    text-align: right !important;
    padding-right: 30px;
}

/* 총 가격 */
.total-row td {
    height: 60px;
    font-weight: bold;
    background: #fafafa;
}

/* 총 가격 금액 */
.total-price {
    text-align: right !important;
    padding-right: 30px;
    font-size: 14px !important;
}

/* 주문번호 */
.order-number {
    font-size: 13px;
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
        주문 상세 내역
    </div>

    <div class="text">
        주문하신 상품의 상세 내역을 확인하실 수 있습니다.
    </div>

    <br><br>

    <table class="orders-table">
        <tr>
            <th style="width: 150px;">이미지</th>
            <th style="width: 250px;">제품이름</th>
            <th style="width: 180px;">구독기간</th>
            <th style="width: 120px;">수량</th>
            <th style="width: 200px;">가격</th>
        </tr>


        <c:choose>

            <c:when test="${not empty ordersDetailList}">

                <c:forEach var="detail" items="${ordersDetailList}">

                    <tr>
                        <td>
						    <img src="${detail.p_image}" class="product-image" alt="상품 이미지">
						</td>
						<td>
                            ${detail.od_name}
                        </td>

                        <td>
					    	${detail.od_sub_date}
						</td>
					     <td>
                            ${detail.od_quantity}
                        </td>
                        <td class="price">
                            <fmt:formatNumber
                                value="${detail.od_price}"
                                pattern="#,###"/>원
                        </td>
                    </tr>
                </c:forEach>

					<tr class="total-row">
					
					    <td colspan="4">
					        총 가격
					    </td>
					
					    <td class="total-price">
					        <fmt:formatNumber
					            value="${totalPrice}"
					            pattern="#,###"/>원
					    </td>
					
					</tr>

            </c:when>

            <c:otherwise>

                <tr>
                    <td colspan="5" class="empty">
                        주문 상세 내역이 없습니다.
                    </td>
                </tr>

            </c:otherwise>

        </c:choose>

    </table>

</div>

<%@ include file="../footer.jsp" %>

</body>
</html>