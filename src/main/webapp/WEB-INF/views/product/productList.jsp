<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트보기</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<%@ include file="../header.jsp" %>
	 <main>
        <!-- ==================================================
             1. 분야별 카테고리 아이콘
        =================================================== -->
        <div class="category-icons">

            <a href="/product/list?c_no=1">
                <span>👗</span>
                <p>패션/여성</p>
            </a>

            <a href="/product/list?c_no=2">
                <span>🏠</span>
                <p>인테리어/건축/디자인</p>
            </a>

            <a href="/product/list?c_no=3">
                <span>🔬</span>
                <p>과학/논술</p>
            </a>

            <a href="/product/list?c_no=4">
                <span>📚</span>
                <p>교육/어학</p>
            </a>

            <a href="/product/list?c_no=5">
                <span>💼</span>
                <p>시사/경제/경영</p>
            </a>

            <a href="/product/list?c_no=6">
                <span>✈️</span>
                <p>여행/레저/취미</p>
            </a>

            <a href="/product/list?c_no=7">
                <span>🌿</span>
                <p>라이프/힐링</p>
            </a>

            <a href="/product/list?c_no=8">
                <span>🌍</span>
                <p>해외잡지/해외신문</p>
            </a>

            <a href="/product/list">
                <span>☰</span>
                <p>전체 보기</p>
            </a>

        </div>

            <!-- =================================================
                 상품목록 제목
            ================================================== -->
        <section class="product-list-content">
            <div class="list-section-title">

                <h2>일반 상품</h2>
            </div>

            <!-- =================================================
                 등록상품수 / 정렬
            ================================================== -->
            <div class="product-list-toolbar">


                <!-- 상품수 -->
                <div class="product-count">
                    등록 제품 : ${productCount} 개
                </div>

                <!-- 정렬 -->
                <div class="product-sort">

                    <a href="#">
                        낮은가격
                    </a>

                    <span>|</span>

                    <a href="#">
                        높은가격
                    </a>

                    <span>|</span>

                    <a href="#">
                        신상품
                    </a>

                    <span>|</span>

                    <a href="#">
                        인기상품
                    </a>

                </div>

            </div>

            <!-- =================================================
                 상품 목록

                 DB에서 조회된 개수만큼 자동 반복
            ================================================== -->
			<div class="category-product-list">
			
			    <c:forEach var="product" items="${productList}">
			
			        <!-- 상품 하나 -->
			        <div class="list-product-card">
			
			            <!-- 상품 이미지 -->
			            <a
			                href="/product/detail?p_no=${product.p_no}"
			                class="list-product-image"
			            >
			                <img
			                    src="${product.p_image}"
			                    alt="${product.p_name}"
			                >
			            </a>
			
			
			            <!-- 상품명 -->
			            <a
			                href="/product/detail?p_no=${product.p_no}"
			                class="list-product-name"
			            >
			                ${product.p_name}
			            </a>
			
			
			            <!-- 정가 -->
			            <div class="list-original-price">
			
			                <del>
			                    ${product.p_price}
			                </del>
			
			            </div>
			
			
			            <!-- 할인가 -->
			            <div class="list-sale-price">
			
			                ${product.p_price2}
			
			            </div>
			
			
			            <!-- 장바구니 버튼 -->
			            <form action="/cartInsert" method="post">
					    <input type="hidden"
					           name="p_no"
					           value="${product.p_no}">
					    <input type="hidden"
				               name="quantity"
				               value="1">
			            <button
			                type="submit"
			                class="list-cart-button"
			            >
			                장바구니
			            </button>
			            </form>
			
			        </div>
			
			    </c:forEach>
			
			</div>
			
            <!-- 페이지 번호 -->
			<div class="pagination">
		
		    <!-- 이전 10페이지 -->
		    <c:if test="${startPage > 1}">
		        <a href="/product/list?page=${startPage - 1}&c_no=${c_no}">
		            &lt;
		        </a>
		    </c:if>
		    <!-- 페이지 번호 -->
			    <c:forEach var="p"
			               begin="${startPage}"
			               end="${endPage}">
			        <a href="/product/list?page=${p}&c_no=${c_no}"
			           class="${p == page ? 'active' : ''}">
			            ${p}
			        </a>
			    </c:forEach>
			    <!-- 다음 10페이지 -->
			    <c:if test="${endPage < totalPage}">
			        <a href="/product/list?page=${endPage + 1}&c_no=${c_no}">
			            &gt;
			        </a>
			    </c:if>
			</div>
        </section>



        <!-- 6. 공지사항 / 배송안내 / 1:1 문의 -->
        <section class="info-area">
            <!-- 공지사항 -->
            <div>
                <h3>공지사항</h3>
                <c:forEach var="notice" items="${noticeList}">
                 <a href="/notice/view?n_no=${notice.n_no}">
                 ${notice.n_title}</a>
                </c:forEach>
            </div>


            <!-- 배송안내 -->
            <div>

                <h3>배송안내</h3>

                평일 오후 2시 이전 주문 시<br>
                당일 출고됩니다.

            </div>


            <!-- 1:1 문의 -->
            <div>

                <h3>1:1 문의</h3>

                궁금하신 점이 있으신가요?<br>
                친절하게 안내해 드립니다.

                <a href="/one_inquiry/writeForm">
                    문의하기
                </a>

            </div>

        </section>

    </main>
    <%@ include file="../footer.jsp" %>
</body>
</html>