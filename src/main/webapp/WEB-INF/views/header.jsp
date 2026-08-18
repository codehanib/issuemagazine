<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="/css/header.css">
<title>header</title>

    <header>

        <!-- ====== 최상단 바 ====== -->
        <div class="top-bar">

            <!-- 왼쪽 구역 -->
            <div>
                <a href="writeForm">신규 회원가입시 3,000원 쿠폰 지급!</a>
                첫 구매 고객 무료배송 혜택
            </div>


            <!-- 오른쪽 구역 -->
            <div>
                <a href="#">고객센터</a> | 
                <a href="/one_inquiry/list">1:1문의</a> |
                <a href="/member/ordersList">주문조회</a> |
                <a href="/cartForm">장바구니</a>
            </div>

        </div>


        <!-- ====== 메인 상단바 ====== -->
        <div class="main-header">

            <!-- 왼쪽 구역 : 검색창 -->
            <div class="search-area">

                <input type="text" placeholder="매거진 검색">

                <button type="button">
                    검색
                </button>

            </div>


            <!-- 가운데 구역 : 로고 -->
            <div class="logo">

                <a href="/main">
                    <img src="/images/logo.png" alt="ISSUEMAGAZINE 로고">
                </a>

            </div>


            <!-- 오른쪽 구역 : 로그인 / 회원가입 / 장바구니 -->
            <div class="member-menu">
            
            <sec:authorize access="isAnonymous()">
                <a href="/loginForm">로그인</a> |
                <a href="/writeForm">회원가입</a>
            </sec:authorize>
            <!-- 일반회원 -->
            <sec:authorize access="hasRole('USER')">
            	<sec:authentication property="name" var="loginId"/>
                <span>${loginId} 님, 반갑습니다!</span> |
                <a href="/member/mypage">마이페이지</a> |
                <a href="/logout">로그아웃</a>
            </sec:authorize>
            <!-- 관리자 -->
            <sec:authorize access="hasRole('ADMIN')">
            	<span>관리자 님, 반갑습니다!</span> |
                <a href="/member/mypage">게시판관리</a> |
                <a href="/logout">로그아웃</a>
            </sec:authorize>

            </div>

        </div>


        <!-- ====== 카테고리 구역 ====== -->
        <nav class="nav">

            <!-- 전체 카테고리 -->
            <div class="all-category">


                <!-- 클릭할 영역 -->
                <div class="category-button">

                    <div class="hamburger">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>

                    전체 카테고리

                </div>


                <!-- 햄버거 클릭 시 펼쳐질 카테고리 -->
                <div class="category-menu">

                    <a href="/product/list?c_no=1">패션/여성</a>
                    <a href="/product/list?c_no=2">인테리어/건축/디자인</a>
                    <a href="/product/list?c_no=3">과학/논술</a>
                    <a href="/product/list?c_no=4">교육/어학</a>
                    <a href="/product/list?c_no=5">시사/경제/경영</a>
                    <a href="/product/list?c_no=6">여행/레저/취미</a>
                    <a href="/product/list?c_no=7">라이프/힐링</a>
                    <a href="/product/list?c_no=8">해외잡지/해외신문</a>
                    

                </div>

            </div>


            <!-- 메인 메뉴 -->
            <div class="main-menu">

                <a href="/product/list">추천 매거진</a>
                <a href="/product/list">분야별 매거진</a>
                <a href="/product/list?c_no=9">디지털 매거진</a>
                <a href="/notice/list">공지사항</a>
                <a href="#">고객센터</a>

            </div>

        </nav>

    </header>
    <script src="/js/header.js"></script>
    
    
    

