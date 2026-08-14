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

/* 제목 */
.title {
    font-size: 18px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

/* 테이블 */
.wishlist-table {
    width: 100%;
    border-collapse: collapse;
    border-top: 1px solid #ddd;
}

/* 헤더 */
.wishlist-table th {
    height: 42px;
    font-size: 12px;
    font-weight: normal;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* 내용 */
.wishlist-table td {
    height: 100px;
    font-size: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* 이미지 */
.product-image {
    width: 60px;
    height: 75px;
    object-fit: cover;
}

/* 상품명 */
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

/* 가격 */
.price {
    text-align: right !important;
    padding-right: 20px;
}

/* 삭제 버튼 */
.delete-btn {
    width: 45px;
    height: 25px;
    border: 1px solid #bbb;
    background: white;
    font-size: 11px;
    cursor: pointer;
}

.delete-btn:hover {
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
<div class="container">
    <div class="title">
        관심 상품
    </div>

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

</body>
</html>