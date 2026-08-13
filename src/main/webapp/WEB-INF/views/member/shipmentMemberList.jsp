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
        배송정보확인
    </div>
    <table border="1">
	   <tr>
            <th>운송장번호</th>
            <th>택배사</th>
            <th>배송상태</th>
        </tr>
       <c:forEach var="shipment" items="${shipmentMemberList}">
            <tr>
                <td>${shipment.s_d_no}</td>
                <td>${shipment.s_delivery}</td>
                <td>${shipment.s_status}</td>
            </tr>
		</c:forEach>
    </table>
    
</div>
</body>
</html>