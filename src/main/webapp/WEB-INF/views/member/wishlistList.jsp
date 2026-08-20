<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 상품</title>

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
    font-size: 28px;
    font-weight: 600;
}

.title::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -1px;
    width: 115px;
    height: 2px;

    background-color: #222222;
}

.wishlist-table {
    width: 100%;
    border-collapse: collapse;
    border-top: 1px solid #ddd;
}

.wishlist-table th {
    height: 42px;
    font-size: 14px;
    font-weight:bold;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

.wishlist-table td {
    height: 100px;
    font-size: 14px;
    text-align: center !important;
    border-bottom: 1px solid #ddd;
}

.product-image {
    width: 60px;
    height: 75px;
    object-fit: cover;
}

.product-name {
    text-align: left !important;
    padding-left: 10px;
}

.product-name a {
    color: #222;
    text-decoration: none;
}

.product-name a:hover {
    text-decoration: underline;
}


.price {
    text-align: right !important;
    padding-right: 20px;
}

.delete-btn {
    width: 70px;
    height: 27px;
    border: 1px solid #0874df;
    color: #0874df;
    background: white;
    font-size: 13px;
    cursor: pointer;
    border-radius: 6px;
}

.delete-btn:hover {
    background-color: #f1f7ff;
    border-color: #0874df;
    color: #0874df;
}

.empty {
    height: 120px !important;
    text-align: center !important;
    color: #999;
}
.text { font-size: 14px; color: #aaa; line-height: 1.6; }
</style>

</head>
<body>

<%@ include file="../header.jsp" %>

<div class="container">
    <div class="title">
        관심 상품
    </div>
    <br>
	<div class="text"> 
		이미지나 주문번호를 클릭하시면 상품 상세를 확인하실 수 있습니다.<br> 
	</div><br><br>
    <table class="wishlist-table">

        <tr>
            <th style="width: 100px;">이미지</th>
            <th>상품명</th>
            <th style="width: 150px;">판매가</th>
            <th style="width: 80px;">주문</th>
        </tr>

        <c:choose>
            <c:when test="${not empty wishlist}">
                <c:forEach var="wishlist" items="${wishlist}">
                    <tr>
                        <!-- 이미지 -->
                        <td>
                            <a href="/product/detail?p_no=${wishlist.p_no}">
                                <img src="${wishlist.p_image}"
                                     class="product-image">
                            </a>
                        </td>

                        <!-- 상품명 -->
                        <td class="product-name">
                            <a href="/product/detail?p_no=${wishlist.p_no}">
                                ${wishlist.p_name}
                            </a>
                        </td>

                        <!-- 가격 -->
                        <td class="price">
                            ${wishlist.p_price2}원
                        </td>

                        <!-- 삭제 -->
                        <td>
                            <button type="button"
                                    class="delete-btn"
                                    onclick="location.href='/member/wishlistDelete?w_no=${wishlist.w_no}'">
                                삭제
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4" class="empty">
                        관심상품이 없습니다.
                    </td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
</div>

<%@ include file="../footer.jsp" %>

</body>
</html>