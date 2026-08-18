<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>마이페이지</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    color: #222;
}

.mypage-container {
    width: 90%;
    max-width: 1100px;
    margin: 40px auto 80px;
}

.mypage-title {
    font-size: 18px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 30px;
}

.member-info {
    border: 10px solid #DCE6F1;
    padding: 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 50px;
}

.member-info .mypage-logo {
    width: 45%;
    font-size: 42px;
    font-weight: bold;
}

.member-info .mypage-logo span {
    font-weight: normal;
}

.member-info .mypage-text {
    font-size: 13px;
    color: #555;
    margin-top: 10px;
    line-height: 1.6;
}

.mypage-menu {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    border-top: 1px solid #c7d2e3;
    border-left: 1px solid #c7d2e3;
}

.mypage-menu-item {
    display: block;
    min-height: 170px;
    padding: 30px;
    border-right: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    text-decoration: none;
    color: #222;
    transition: 0.2s;
}

.mypage-menu-item:hover {
    background-color: #fafafa;
}

.mypage-menu-title {
    font-size: 28px;
    margin-bottom: 15px;
    color: #222;
}

.mypage-menu-title span {
    font-size: 13px;
    color: #777;
    margin-left: 5px;
}

.mypage-menu-desc {
    font-size: 13px;
    color: #aaa;
    line-height: 1.6;
}

.shipment-link {
    display: inline-block;
    margin-top: 15px;
    color: #222;
    font-size: 13px;
    text-decoration: none;
}

.shipment-link:hover {
    text-decoration: underline;
}

@media(max-width: 700px) {

    .mypage-container {
        width: 94%;
    }

    .member-info {
        display: block;
    }

    .member-info .mypage-logo,
    .mypage-point {
        width: 100%;
        margin-bottom: 20px;
    }

    .mypage-menu {
        grid-template-columns: 1fr;
    }
}

</style>
</head>

<body>

<%@ include file="../header.jsp" %>


<!-- 관리자 -->
<sec:authorize access="hasRole('ADMIN')">

<div class="mypage-container">

    <div class="mypage-title">
        관리자 페이지
    </div>

    <div class="member-info">

        <div class="mypage-logo">

            ADMIN<span> PAGE</span>

            <div class="mypage-text">
                관리자페이지에서는 회원, 주문, 상품, 배송리스트를<br>
                확인하고 수정하실 수 있습니다.
            </div>

        </div>

    </div>


    <div class="mypage-menu">

        <!-- 회원관리 -->
        <a href="/admin/memberList" class="mypage-menu-item">

            <div class="mypage-menu-title">
                member
                <span>회원관리</span>
            </div>

            <div class="mypage-menu-desc">
                회원 목록을 확인하고<br>
                회원 정보를 관리하실 수 있습니다.
            </div>

        </a>


        <!-- 주문관리 -->
        <a href="/admin/adminOrdersList" class="mypage-menu-item">

            <div class="mypage-menu-title">
                order
                <span>주문관리</span>
            </div>

            <div class="mypage-menu-desc">
                전체 주문내역을 확인하고<br>
                주문 정보를 관리하실 수 있습니다.
            </div>

        </a>


        <!-- 배송관리 -->
        <a href="/admin/shipmentList" class="mypage-menu-item">

            <div class="mypage-menu-title">
                shipment
                <span>배송관리</span>
            </div>

            <div class="mypage-menu-desc">
                배송정보를 확인하고<br>
                배송상태를 수정하실 수 있습니다.
            </div>

        </a>


        <!-- 상품관리 -->
        <a href="/product/list" class="mypage-menu-item">

            <div class="mypage-menu-title">
                product
                <span>상품관리</span>
            </div>

            <div class="mypage-menu-desc">
                상품 목록을 확인하고<br>
                상품 정보를 관리하실 수 있습니다.
            </div>

        </a>

    </div>

</div>

</sec:authorize>



<!-- 일반 회원 ADMIN이 아닌 USER만 표시 -->

<sec:authorize access="hasRole('USER') and !hasRole('ADMIN')">

<div class="mypage-container">

    <div class="mypage-title">
        마이 쇼핑
    </div>

    <div class="member-info">

        <div class="mypage-logo">

            MY<span> SHOP</span>

            <div class="mypage-text">
                마이페이지에서는 고객님의<br>
                쇼핑관련 정보를 확인하고<br>
                수정하실 수 있습니다.
            </div>

        </div>

        <div class="mypage-point">

            <table>

                <tr>
                    <td>총 주문</td>
                    <td>${orderCount}회</td>
                </tr>

                <tr>
                    <td>관심상품</td>
                    <td>${wishlistCount}개</td>
                </tr>

                <tr>
                    <td>1:1 문의</td>
                    <td>${one_inquiryCount}개</td>
                </tr>

            </table>

        </div>

    </div>


    <div class="mypage-menu">

        <!-- 주문내역 -->
        <a href="/member/ordersList"
           class="mypage-menu-item">

            <div class="mypage-menu-title">
                order
                <span>주문내역조회</span>
            </div>

            <div class="mypage-menu-desc">
                고객님께서 주문하신 상품의<br>
                주문내역을 확인하실 수 있습니다.
            </div>

        </a>


        <!-- 관심상품 -->
        <a href="/member/wishlistList"
           class="mypage-menu-item">

            <div class="mypage-menu-title">
                wishlist
                <span>관심상품</span>
            </div>

            <div class="mypage-menu-desc">
                관심상품으로 등록한 상품을<br>
                확인하실 수 있습니다.
            </div>

        </a>


        <!-- 회원정보 -->
        <a href="/member/memberviewForm"
           class="mypage-menu-item">

            <div class="mypage-menu-title">
                profile
                <span>회원정보</span>
            </div>

            <div class="mypage-menu-desc">
                회원님의 개인정보를 확인하고<br>
                회원정보를 수정하실 수 있습니다.
            </div>

        </a>


        <!-- 1:1 문의 -->
        <a href="/one_inquiry/list"
           class="mypage-menu-item">

            <div class="mypage-menu-title">
                inquiry
                <span>1:1 문의</span>
            </div>

            <div class="mypage-menu-desc">
                작성하신 1:1 문의 내역을<br>
                확인하실 수 있습니다.
            </div>

        </a>

    </div>

</div>

</sec:authorize>


<%@ include file="../footer.jsp" %>

</body>
</html>