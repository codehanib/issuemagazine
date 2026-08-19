<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
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

.text { font-size: 13px; color: #aaa; line-height: 1.6; }

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

/* 확인 버튼 */
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

/* 주문번호 */
.order-number {
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
        주문 내역 조회
    </div>
    
	<div class="text"> 
		이미지나 주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.<br> 
		개별상품에 대한 배송조회는 상세내역에서 확인하시기 바랍니다. 
	</div><br><br>
	
    <table class="orders-table">
        <tr>
            <th style="width: 100px;"> 이미지</th>
			<th style="width: 180px;">주문번호</th>
            <th style="width: 180px;">주문날짜</th>
            <th style="width: 180px;">가격</th>
            <th style="width: 150px;">배송정보</th>
            <th style="width: 150px;">주문취소</th>
        </tr>
        <c:choose>
            <c:when test="${not empty ordersList}">
                <c:forEach var="orders" items="${ordersList}">
                    <tr>
                        <!-- 제품 이미지 -->
                        <td>
                            <a href="/member/ordersDetail?o_no=${orders.o_no}">
							    <img src="${orders.p_image}"
                                     class="product-image">
							</a>
						</td>

                        <!-- 주문번호 -->
                        <td class="order-number">
                        	<a href="/member/ordersDetail?o_no=${orders.o_no}">
							    ${orders.o_no}
							</a>
                        </td>

                        <!-- 주문날짜 -->
                        <td>
                            <fmt:formatDate value="${orders.o_date}" pattern="yyyy-MM-dd"/>
                        </td>

                        <!-- 가격 -->
                        <td class="price">${orders.od_price}원</td>

                        <!-- 배송정보 확인 -->
                        <td>
                            <button type="button"
                                    class="check-btn"
                                    onclick="location.href='/member/shipmentMemberList?o_no=${orders.o_no}'">
                              	확인
                            </button>
                        </td>
                    	<td>
							<button type="button"
					        class="check-btn"
					        onclick="if(confirm('정말 주문을 취소하시겠습니까?\n취소한 주문은 복구할 수 없습니다.')) {
					            location.href='/member/ordersdelete?o_no=${orders.o_no}';
					        }">
					    	주문취소
						</button>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5" class="empty">주문내역이 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
</div>

<%@ include file="../footer.jsp" %>

</body>
</html>