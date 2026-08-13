<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문리스트</title>

<style>
* {
    box-sizing: border-box;
}
.container {
    width: 90%;
    max-width: 1100px;
    margin: 40px auto;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    color: #222;
}

.title {
    font-size: 18px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 30px;
}

.text {
    font-size: 13px;
    color: #aaa;
    line-height: 1.6;
}
</style>

</head>
<body>
<div class="container">
	<div class="title">
        주문 내역 조회
    </div>
    <div class="text">
        주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.<br>
        개별상품에 대한 배송조회는 상세내역에서 확인하시기 바랍니다.
    </div><br>
    
    <table border="1">
    <tr>
        <td>주문일자</td>
        <td>주문번호</td>
        <td>주문상품</td>
        <td>주문금액</td>
        <td>주문처리상태</td>
    </tr>
    <c:forEach var="orders" items="${list}">
        <tr>
            <td>
                <a href="/member/ordersView?o_no=${orders.o_no}">
                    ${orders.o_no}
                </a>
            </td>

            <td>
                ${orders.p_no}
            </td>
        </tr>
    </c:forEach>
    </table>
    
</div>

</body>
</html>