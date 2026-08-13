<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

.container {
    width: 90%;
    max-width: 1100px;
    margin: 40px auto;
}

.title {
    font-size: 18px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 30px;
}

/* 회원 정보 영역 */
.member-info {
    border: 10px solid #DCE6F1;
    padding: 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 50px;
}

.member-info .logo {
    width: 45%;
    font-size: 42px;
    font-weight: bold;
}

.member-info .logo span {
    font-weight: normal;
}

.member-info .text {
    font-size: 13px;
    color: #555;
    margin-top: 10px;
}

.point {
    width: 40%;
}

.point table {
    width: 100%;
}

.point td {
    padding: 7px;
}

.point td:first-child {
    text-align: left;
}

.point td:last-child {
    text-align: right;
}

/* 마이페이지 메뉴 */
.menu {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    border-top: 1px solid #c7d2e3 !important;
    border-left: 1px solid #c7d2e3 !important;
}

.menu-item {
	display: block !important;
    min-height: 170px;
    padding: 30px;
    box-sizing: border-box;
    border-right: 1px solid #ddd !important;
    border-bottom: 1px solid #ddd !important;
    text-decoration: none;
    color: #222;
    transition: 0.2s;
}

.menu-item:nth-child(3n) {
    border-right: none;
}

.menu-item:hover {
    background-color: #fafafa;
}

.menu-title {
    font-size: 28px;
    margin-bottom: 15px;
}

.menu-title span {
    font-size: 13px;
    color: #777;
    margin-left: 5px;
}

.menu-desc {
    font-size: 13px;
    color: #aaa;
    line-height: 1.6;
}

/* 모바일 */
@media(max-width: 700px) {
    .member-info {
        display: block;
    }

    .member-info .logo,
    .point {
        width: 100%;
        margin-bottom: 20px;
    }

    .menu {
        grid-template-columns: 1fr;
    }

    .menu-item {
        border-right: none;
    }
}
</style>

</head>

<body>

<div class="container">

    <div class="title">
        마이 쇼핑
    </div>

    <!-- 회원 정보 -->
    <div class="member-info">

        <div class="logo">
            MY<span>SHOP</span>

            <div class="text">
                마이페이지에서는 고객님의<br>
                쇼핑관련 정보를 확인하고<br>
                수정하실 수 있습니다.
            </div>
        </div>

        <div class="point">
            <table>
                <tr>
                    <td>총 주문</td>
                    <td>0회</td>
                </tr>
                <tr>
                    <td>관심상품</td>
                    <td>0개</td>
                </tr>
                <tr>
                    <td>1:1 문의</td>
                    <td>0개</td>
                </tr>
            </table>
        </div>

    </div>


    <!-- 메뉴 -->
    <div class="menu">

        <!-- 주문내역 -->
        <a href="/member/ordersList" class="menu-item">
            <div class="menu-title">
                order
                <span>주문내역조회</span>
            </div>

            <div class="menu-desc">
                고객님께서 주문하신 상품의<br>
                주문내역을 확인하실 수 있습니다.
            </div>
        </a>

        <!-- 관심상품 -->
        <a href="/member/wishlist" class="menu-item">
            <div class="menu-title">
                wishlist
                <span>관심상품</span>
            </div>

            <div class="menu-desc">
                관심상품으로 등록한 상품을<br>
                확인하실 수 있습니다.
            </div>
        </a>

 		<!-- 회원정보 -->
        <a href="/member/memberviewForm" class="menu-item">
            <div class="menu-title">
                profile
                <span>회원정보</span>
            </div>

            <div class="menu-desc">
                회원님의 개인정보를 확인하고<br>
                회원정보를 수정하실 수 있습니다.
            </div>
        </a>

        <!-- 1:1 문의 -->
        <a href="/member/inquiryList" class="menu-item">
            <div class="menu-title">
                inquiry
                <span>1:1 문의</span>
            </div>

            <div class="menu-desc">
                작성하신 1:1 문의 내역을<br>
                확인하실 수 있습니다.
            </div>
        </a>

    </div>

</div>

</body>
</html>