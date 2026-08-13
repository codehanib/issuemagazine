<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wishlist</title>
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
</style>

</head>
<body>
<div class="container">
	<div class="title">
        관심 상품
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