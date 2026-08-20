<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


/* =========================================================
   마이페이지 전체
========================================================= */

.mypage-container {
    width: 90%;
    max-width: 1100px;

    margin: 40px auto 80px;
}


/* =========================================================
   제목
========================================================= */
.mypage-title {
    position: relative;
    width: 100%;
    padding-bottom: 12px;
    margin-bottom: 30px;
    border-bottom: 1px solid #ddd;
    color: #222;
    font-size: 28px;
    font-weight: 600;
}

.mypage-title::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -1px;
    width: 115px;
    height: 2px;
    background-color: #222222;
}
/* =========================================================
   회원 정보 영역
========================================================= */

.member-info {
    position: relative;

    margin-bottom: 45px;

    padding: 35px 40px;

    display: flex;

    justify-content: space-between;
    align-items: center;

    background: #f7fbff;

    border: 1px solid #dcecff;
    border-radius: 14px;

    box-shadow: 0 5px 18px rgba(8, 116, 223, 0.06);

    overflow: hidden;
}


/* 왼쪽 파란 포인트 */

.member-info::before {
    content: "";

    position: absolute;

    top: 0;
    left: 0;

    width: 5px;
    height: 100%;

    background: #0874df;
}


/* =========================================================
   MY SHOP / ADMIN PAGE
========================================================= */

.member-info .mypage-logo {
    width: 45%;

    color: #0874df;

    font-size: 40px;
    font-weight: 700;

    letter-spacing: -1px;
}


.member-info .mypage-logo span {
    color: #222;

    font-weight: normal;
}


/* 설명 */

.member-info .mypage-text {
    margin-top: 14px;

    color: #666;

    font-size: 14px;

    line-height: 1.8;
}


/* =========================================================
   주문 / 관심상품 / 문의 정보
========================================================= */

.mypage-point {
    padding: 15px 20px;

    border-left: 1px solid #dcecff;
}


.mypage-point table {
    border-collapse: collapse;
}


.mypage-point td {
    padding: 7px 0;

    color: #555;

    font-size: 14px;

    line-height: 1.4;
}


/* 왼쪽 항목 */

.mypage-point td:first-child {
    width: 85px;

    color: #777;

    text-align: left;
}


/* 오른쪽 숫자 */

.mypage-point td:last-child {
    width: 45px;

    color: #0874df;

    font-size: 14px;
    font-weight: bold;

    text-align: right;
}


/* =========================================================
   메뉴 카드
========================================================= */

.mypage-menu {
    display: grid;

    grid-template-columns: repeat(2, 1fr);

    gap: 15px;

    border: none;
}


/* 메뉴 하나 */

.mypage-menu-item {
    min-height: 160px;

    padding: 28px 30px;

    position: relative;

    display: block;

    text-decoration: none;

    color: #222;

    background-color: #fff;

    border: 1px solid #e5e9ee;
    border-radius: 12px;

    transition: all 0.25s ease;
}


/* 카드 왼쪽 작은 파란선 */

.mypage-menu-item::before {
    content: "";

    position: absolute;

    top: 25px;
    left: 0;

    width: 3px;
    height: 35px;

    background-color: #0874df;

    border-radius: 0 3px 3px 0;
}


/* Hover */

.mypage-menu-item:hover {
    transform: translateY(-3px);

    border-color: #b9d9f7;

    box-shadow: 0 8px 20px rgba(8, 116, 223, 0.10);
}


/* =========================================================
   메뉴 제목
========================================================= */

.mypage-menu-title {
    margin-bottom: 15px;

    color: #222;

    font-size: 30px;
    font-weight: 600;

    letter-spacing: -0.5px;
}


.mypage-menu-title span {
    margin-left: 7px;

    color: #777;

    font-size: 15px;
    font-weight: normal;
}


/* =========================================================
   메뉴 설명
========================================================= */

.mypage-menu-desc {
    color: #777;

    font-size: 13px;

    line-height: 1.8;
}


/* =========================================================
   배송 링크
========================================================= */

.shipment-link {
    display: inline-block;

    margin-top: 15px;

    color: #0874df;

    font-size: 13px;

    text-decoration: none;
}


.shipment-link:hover {
    text-decoration: underline;
}


/* =========================================================
   모바일
========================================================= */

@media(max-width: 700px) {

    .mypage-container {
        width: 94%;
    }


    .member-info {
        display: block;

        padding: 30px;
    }


    .member-info .mypage-logo,
    .mypage-point {
        width: 100%;

        margin-bottom: 20px;
    }


    .mypage-point {
        padding: 15px 0;

        border-left: none;
        border-top: 1px solid #dcecff;
    }


    .mypage-menu {
        grid-template-columns: 1fr;
    }
}
</style>
</head>

<body>

<jsp:include page="../header.jsp"/>

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
                상품 목록을 확인하실 수 있습니다.
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

<jsp:include page="../footer.jsp"/>

</body>
</html>