<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ISSUEMAGAZINE</title>

    <link rel="stylesheet" href="css/style_LDH.css">
</head>

<body>

    <header>

        <!-- ====== 최상단 바 ====== -->
        <div class="top-bar">

            <!-- 왼쪽 구역 -->
            <div>
                <a href="#">신규 회원가입시 3,000원 쿠폰 지급!</a>
                첫 구매 고객 무료배송 혜택
            </div>


            <!-- 오른쪽 구역 -->
            <div>
                <a href="#">고객센터</a> |
                <a href="#">FAQ</a> |
                <a href="#">1:1문의</a> |
                <a href="#">주문조회</a> |
                <a href="#">마이페이지</a>
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

                <a href="#">
                    <img src="" alt="ISSUEMAGAZINE 로고">
                </a>

            </div>


            <!-- 오른쪽 구역 : 로그인 / 회원가입 / 장바구니 -->
            <div class="member-menu">

                <a href="#">로그인</a>
                <a href="#">회원가입</a>
                <a href="#">장바구니</a>

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

                    <a href="#">패션/여성</a>
                    <a href="#">인테리어/건축/디자인</a>
                    <a href="#">과학/논술</a>
                    <a href="#">교육/어학</a>
                    <a href="#">시사/경제/경영</a>
                    <a href="#">여행/레저/취미</a>
                    <a href="#">라이프/힐링</a>
                    <a href="#">해외잡지/해외신문</a>

                </div>

            </div>


            <!-- 메인 메뉴 -->
            <div class="main-menu">

                <a href="#">정기구독</a>
                <a href="#">추천 매거진</a>
                <a href="#">분야별 매거진</a>
                <a href="#">디지털 매거진</a>
                <a href="#">이벤트</a>
                <a href="#">고객센터</a>

            </div>

        </nav>

    </header>

    <main>
        <!-- 장바구니 타이틀 -->
        <h1 class="cart_title">장바구니</h1>

        <div class="cart_box">

            <!-- 장바구니 창 -->
            <div class="cart_list">
				<c:forEach var="cart" items="${cartList}">

				    장바구니 번호 : ${cart.cart_no} <br>
				    상품번호 : ${cart.p_no} <br>
				    상품명 : ${cart.p_name} <br>
				    상품가격 : ${cart.p_price} <br>
				    장바구니 가격 : ${cart.cart_price} <br>
				    수량 : ${cart.cart_quantity} <br>
				
				    <hr>

				</c:forEach>
            </div> 

            <!-- 총가격 -->
            <div class="cart_total">
                총가격 :
            </div>


            <!-- 버튼영역 -->   
            <div class="cart_buttons">
                <!-- 왼쪽 -->
                <div class="cart_buttons_left">
                    <button>선택상품 삭제</button> 

                    <button>장바구니 비우기</button>

                </div>

                <!-- 오른쪽 -->
                <div class="cart_buttons_right">
                    <button>쇼핑 계속하기</button>

                    <button>전체 상품 주문</button>
                </div>

            </div>

        </div>    

        <!-- 장바구니 이용안내 -->
        <div class="cart_Information">
            <h2>장바구니 이용안내</h2>
                *무이자할부 상품 주문의 경우, 무이자할부 혜택을 받으시려면
                '장부구니-무이자할부 상품' 아래의 [주문하기]버튼을 눌러 
                주문/결제 하기면 됩니다.<br>

                *[전체 상품 주문]버튼을 누르시면 장바구니의 구분없이
                선택된 모든 상품에 대한 주문/결제가 이루어집니다. 
                단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 
                혜택을 받으실 수 없습니다.<br>

                *선택하신 상품의 수량을 변경하시려면 수량변경 후 
                [수정]버튼을 누르시면 됩니다. [쇼핑계속]버튼을 누르시면 
                쇼핑을 계속 하실 수 있습니다.<br>

                *장바구니에 담긴 상품은 30일 동안 보관됩니다.
                 보관된 상품은 30일 이후에 삭제되오니 장바구니에서 
                 삭제된 경우 다시 장바구니에 담으시기 바랍니다.<br>

                *장바구니와 관심상품을 이용하여 원하시는 상품만
                 주문하거나 관심상품으로 등록하실 수 있습니다.

            </div> 
         
    </main>

    <!-- ==================================================
         FOOTER
    =================================================== -->
    <footer class="footer">


        <!-- 1. 왼쪽 : 로고 -->
        <div class="footer-logo">

            <img src="" alt="ISSUEMAGAZINE 로고">

        </div>


        <!-- 2. 가운데 : 회사정보 -->
        <div class="footer-company">

            <h3>ISSUEMAGAZINE</h3>

            상호명 : ISSUEMAGAZINE <br>

            사업자등록번호 : 123-45-67890
            대표자명 : 홍길동 <br>

            주소 : 서울특별시 강남구 테헤란로 123,
            5층 (우)06132 <br>

            통신판매업신고 : 제2024-서울강남-0000호
            개인정보보호책임자 : 홍길순 <br>

            이메일 : issuemagazine@naver.com <br>

            고객센터 :
            <b>1644-6451</b>
            (평일 09:00~18:00)

        </div>


        <!-- 3. 오른쪽 : 이용안내 -->
        <div class="footer-menu">

            <div>

                <a href="#">회사소개</a>
                <a href="#">이용약관</a>
                <a href="#">개인정보처리방침</a>
                <a href="#">청소년보호정책</a>

            </div>


            <div>

                <img src="" alt="안내로고">

            </div>

        </div>


        <!-- 4. Copyright -->
        <div class="footer-bottom">

            Copyright © 2026 ISSUEMAGAZINE.
            All Rights Reserved.

        </div>

    </footer>

</body>
</html>