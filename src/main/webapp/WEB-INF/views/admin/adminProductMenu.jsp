<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 제품 관리 페이지</title>
<style>
* { box-sizing: border-box; }
body { margin: 0; font-family: Arial, sans-serif; color: #222; }

.mypage-container { width: 90%; max-width: 1100px; margin: 40px auto 80px; }
.mypage-title { position: relative; width: 100%; padding-bottom: 12px; margin-bottom: 30px; border-bottom: 1px solid #ddd; color: #222; font-size: 28px; font-weight: 600; }
.mypage-title::after { content: ""; position: absolute; left: 0; bottom: -1px; width: 115px; height: 2px; background-color: #222222; }

.member-info { position: relative; margin-bottom: 45px; padding: 35px 40px; display: flex; justify-content: space-between; align-items: center; background: #f7fbff; border: 1px solid #dcecff; border-radius: 14px; box-shadow: 0 5px 18px rgba(8, 116, 223, 0.06); overflow: hidden; }
.member-info::before { content: ""; position: absolute; top: 0; left: 0; width: 5px; height: 100%; background: #0874df; }
.member-info .mypage-logo { width: 45%; color: #0874df; font-size: 40px; font-weight: 700; letter-spacing: -1px; }
.member-info .mypage-logo span { color: #222; font-weight: normal; }
.member-info .mypage-text { margin-top: 14px; color: #666; font-size: 14px; line-height: 1.8; }

.mypage-menu { display: grid; grid-template-columns: repeat(2, 1fr); gap: 15px; border: none; }
.mypage-menu-item { min-height: 160px; padding: 28px 30px; position: relative; display: block; text-decoration: none; color: #222; background-color: #fff; border: 1px solid #e5e9ee; border-radius: 12px; transition: all 0.25s ease; }
.mypage-menu-item::before { content: ""; position: absolute; top: 25px; left: 0; width: 3px; height: 35px; background-color: #0874df; border-radius: 0 3px 3px 0; }
.mypage-menu-item:hover { transform: translateY(-3px); border-color: #b9d9f7; box-shadow: 0 8px 20px rgba(8, 116, 223, 0.10); }

.mypage-menu-title { margin-bottom: 15px; color: #222; font-size: 30px; font-weight: 600; letter-spacing: -0.5px; }
.mypage-menu-title span { margin-left: 7px; color: #777; font-size: 15px; font-weight: normal; }
.mypage-menu-desc { color: #777; font-size: 13px; line-height: 1.8; }

@media(max-width: 700px) {
    .mypage-container { width: 94%; }
    .member-info { display: block; padding: 30px; }
    .member-info .mypage-logo { width: 100%; margin-bottom: 20px; }
    .mypage-menu { grid-template-columns: 1fr; }
}
</style>
</head>
<body>

<jsp:include page="../header.jsp"/>

<!-- 관리자 권한 확인 -->
<sec:authorize access="hasRole('ADMIN')">

<div class="mypage-container">

    <div class="mypage-title">
        상품관리 페이지
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

    <!-- 상품 목록 -->
    <a href="/admin/productList" class="mypage-menu-item">
        <div class="mypage-menu-title">
            product
            <span>상품 목록</span>
        </div>
        <div class="mypage-menu-desc">
            등록된 전체 상품 목록을<br>
            확인하고 검색하실 수 있습니다.
        </div>
    </a>

    <!-- 상품 추가 -->
    <a href="/product/write" class="mypage-menu-item">
        <div class="mypage-menu-title">
            product
            <span>상품 추가</span>
        </div>
        <div class="mypage-menu-desc">
            신규 상품 정보와 이미지를<br>
            새롭게 등록하실 수 있습니다.
        </div>
    </a>


</div>

</div>

</sec:authorize>

<jsp:include page="../footer.jsp"/>

</body>
</html>