<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 검색 결과 페이지</title>
    <link rel="stylesheet" href="/css/style.css">
<style>
/* =========================================================
   상품 리스트 - 한 줄에 4개
========================================================= */

.category-product-list {
    width: 100%;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 25px;
    margin-top: 25px;
}


/* 상품 카드 */
.list-product-card {
    min-width: 0;
    padding: 15px;
    border: 1px solid #eeeeee;
    border-radius: 10px;
    background-color: #ffffff;
    transition: 0.25s;
}

.list-product-card:hover {
    transform: translateY(-5px);
    border-color: #d9e6f5;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
}

/* 상품 이미지 */
.list-product-image {
    width: 100%;
    height: 270px;
    margin-bottom: 15px;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    background-color: #f6f7f9;
    border-radius: 7px;
}

.list-product-image img {
    width: 100%;
    height: 100%;
    object-fit: contain;
    transition: 0.3s;
}

.list-product-card:hover .list-product-image img {
    transform: scale(1.03);
}

/* 상품명 */
.list-product-name {
    min-height: 45px;
    margin-bottom: 8px;
    display: block;
    color: #222222;
    font-size: 15px;
    font-weight: 600;
    line-height: 1.5;
}

.list-product-name:hover {
    color: #0874df;
}

/* 정가 */
.list-original-price {
    margin-bottom: 4px;
    color: #999999;
    font-size: 13px;
}

/* 할인가 */
.list-sale-price {
    margin-bottom: 15px;
    color: #0874df;
    font-size: 18px;
    font-weight: bold;
}

/* 장바구니 폼 */
.list-product-card form {
    width: 100%;
}

/* 장바구니 버튼 */
.list-cart-button {
    width: 100%;
    height: 38px;
    border: 1px solid #0874df;
    border-radius: 5px;
    background-color: #ffffff;
    color: #0874df;
    font-size: 13px;
    cursor: pointer;
    transition: 0.2s;
}

.list-cart-button:hover {
    background-color: #0874df;
    color: #ffffff;
}


/* =========================================================
   반응형
========================================================= */

@media (max-width: 1000px) {
    .category-product-list {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (max-width: 700px) {
    .category-product-list {
        grid-template-columns: repeat(2, 1fr);
        gap: 15px;
    }

}

@media (max-width: 450px) {
    .category-product-list {
        grid-template-columns: 1fr;
    }
}


/* 상품 목록 전체 */
.product-list-content {
    width: 100%;

    margin-top: 50px;
    margin-bottom: 70px;
}


/* 상품 목록 제목 */
.list-section-title {
    width: 100%;

    border-bottom: 1px solid #dddddd;

    margin-bottom: 0;
}


.list-section-title h2 {
    display: inline-block;

    margin: 0;

    padding-bottom: 10px;

    border-bottom: 2px solid #222222;

    color: #222222;

    font-size: 18px;
    font-weight: 500;
}

.product-list-toolbar {
    width: 100%;

    min-height: 55px;

    display: flex;

    justify-content: space-between;
    align-items: center;

    border-bottom: 1px solid #eeeeee;
}

/* 등록 제품 수 */
.product-count {
    color: #777777;

    font-size: 12px;
}

/* 정렬 영역 */
.product-sort {
    display: flex;
    align-items: center;
    gap: 10px;
    color: #777777;
    font-size: 12px;
}

/* 정렬 링크 */
.product-sort a {
    color: #555555;
    text-decoration: none;
    transition: 0.2s;
}

.product-sort a:hover {
    color: #0874df;
}


/* | 구분선 */
.product-sort span {
    color: #cccccc;

    font-size: 11px;
}

/* ================================
   페이지 번호
================================ */
.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 6px;

    margin: 50px 0 70px;
}

.pagination a {
    width: 34px;
    height: 34px;

    display: flex;
    justify-content: center;
    align-items: center;

    border: 1px solid #d6e5f5;
    border-radius: 5px;

    background-color: #ffffff;
    color: #0874df;

    font-size: 13px;
    text-decoration: none;

    transition: all 0.2s ease;
}

.pagination a:hover {
    background-color: #eaf4ff;
    border-color: #0874df;
}

/* 현재 페이지 */
.pagination a.active {
    background-color: #0874df;
    border-color: #0874df;
    color: #ffffff;
    font-weight: bold;
}

/* 이전 / 다음 버튼 */
.pagination a:first-child,
.pagination a:last-child {
    font-size: 15px;
}
</style>

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


            </div>

            <!-- =================================================
                 상품 목록
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
			                <span>정가 : </span><del><fmt:formatNumber value="${product.p_price}" pattern="#,###" />원</del>
			            </div>
			
			            <!-- 할인가 -->
			            <div class="list-sale-price">
			                <span>판매가 : </span><strong><fmt:formatNumber value="${product.p_price2}" pattern="#,###" />원</strong>
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
				<c:forEach var="p" begin="${startPage}" end="${endPage}">
				    <a href="/product/list?page=${p}&c_no=${c_no}&sort=${sort}"
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