<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ISSUEMAGAZINE</title>

	<!-- 메인 css -->
    <link rel="stylesheet" href="/css/style.css">
    
     <!-- 헤더 CSS -->
    <link rel="stylesheet" href="/css/header.css">
    
     <!-- 풋터 CSS -->
    <link rel="stylesheet" href="/css/footer.css">
    

</head>

<body>

	<jsp:include page="header.jsp"/>
	<iframe name="cartFrame" style="display:none;"></iframe>

    <main>

        <!-- ==================================================
             1. 메인 자동 배너
        =================================================== -->
        <div class="main-banner">
        
			<!-- 1번 배너 -->
            <div class="slide active">
            	<a href="/product/detail?p_no=2506">
                	<img src="/images/메인 페이지 광고1.png" alt="메인배너1">
                </a>
            </div>
            
			<!-- 2번 배너 -->
            <div class="slide">
            	<a href="/product/detail?p_no=2543">
                	<img src="/images/메인 페이지 광고2.png" alt="메인배너2">
                </a>
            </div>
            
			<!-- 3번 배너 -->
            <div class="slide">
            	<a href="/product/detail?p_no=2159">
                	<img src="/images/메인 페이지 광고3.png" alt="메인배너3">
                </a>
            </div>
            
			<!-- 4번 배너 -->
            <div class="slide">
            	<a href="/product/detail?p_no=2334">
               		<img src="/images/메인 페이지 광고4.png" alt="메인배너4">
               	</a>
            </div>
            
			<!-- 5번 배너 -->           
            <div class="slide">
            	<a href="/product/detail?p_no=2449">
                	<img src="/images/메인 페이지 광고5.png" alt="메인배너5">
                </a>
            </div>
            
 			<!-- 6번 배너 -->          
            <div class="slide">
            	<a href="/product/detail?p_no=2005">
                	<img src="/images/메인 페이지 광고6.png" alt="메인배너6">
                </a>
            </div>
            
            <!-- 7번 배너 -->          
            <div class="slide">
            	<a href="/product/detail?p_no=2076">
                	<img src="/images/메인 페이지 광고7.png" alt="메인배너7">
                </a>
            </div>
            
            <!-- 8번 배너 -->          
            <div class="slide">
            	<a href="/product/detail?p_no=2113">
                	<img src="/images/메인 페이지 광고8.png" alt="메인배너8">
                </a>
            </div>
            
            <!-- 9번 배너 -->          
            <div class="slide">
            	<a href="/product/detail?p_no=2187">
                	<img src="/images/메인 페이지 광고9.png" alt="메인배너9">
                </a>
            </div>
            
            
            <!-- 이전 버튼 -->
            <button class="banner-prev" type="button">
            	&lt;
            </button>
            
             <!-- 다음 버튼 -->
            <button class="banner-next" type="button">
            	&gt;
            </button>

        </div>



        <!-- ==================================================
             2. 분야별 카테고리 아이콘
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



        <!-- ==================================================
             3. 추천 매거진
        =================================================== -->
        <section class="recommend-magazine" id="recommend">

            <!-- 상단 제목 -->
            <div class="section-title">

                <h2>추천 매거진</h2>


            </div>


            <!-- 추천 상품 -->
            
            <div class="recommend-wrap">
            	<div class="recommend-track"> 
            	
	            	<c:forEach var="product"
	            			   items="${productList}"
	            			   begin="0"
	            			   end="11">			
		                <!-- 상품 1 -->
		                <div class="recommend-product">
		                
		                
		
		                    <a href="/product/detail?p_no=${product.p_no}">
		                        <img src="${product.p_image}" alt="${product.p_name}">
		                    </a>
		
		                    <a href="/product/detail?p_no=${product.p_no}"> 
		                    <p>${product.p_name}</p>
		                    </a>
		
		                    <p> <fmt:formatNumber value="${product.p_price2}" pattern="#,###" />원 </p>
							
							<div class="product-buttons">
			                    <a href="/product/detail?p_no=${product.p_no}">구매하기</a>
									
								<form action="/cartInsert" method="post" target="cartFrame">
								<input type="hidden" name="p_no" value="${product.p_no}">
								<input type="hidden" name="quantity" value="1">
			                    <button type="submit" class="list_cart_button" onclick="alert('장바구니에 추가되었습니다.')">
			                        장바구니
			                    </button>
			                    </form>
							</div>
		                </div>
		             
		             </c:forEach>
	           
	          </div>
	          
	      </div>

        </section>



        <!-- ==================================================
             4. 분야별 베스트
        =================================================== -->
        <section class="category-best" id="categoryBest">

            <!-- 상단 제목 -->
            <div class="section-title">

                <h2>분야별 베스트</h2>


                <!-- 카테고리 선택 버튼 -->
                <div class="category-buttons">

                    <button type="button"
                    		class="category-best-btn active"
                    		data-category="1">
                        패션/여성
                    </button>

                    <button type="button"
                    		class="category-best-btn"
                    		data-category="2">
                        인테리어/건축/디자인
                    </button>

                    <button type="button"
                    		class="category-best-btn"
                    		data-category="3">
                        과학/논술
                    </button>

                    <button type="button"
                            class="category-best-btn"
                    		data-category="4">
                        교육/어학
                    </button>

                    <button type="button"
                    		class="category-best-btn"
                    data-category="5">
                        시사/경제/경영
                    </button>

                    <button type="button"
		                    class="category-best-btn"
		                    data-category="6">
                        여행/레저/취미
                    </button>

                    <button type="button"
                    		class="category-best-btn"
                    		data-category="7">
                        라이프/힐링
                    </button>

                    <button type="button"
                    		class="category-best-btn"
                    		data-category="8">
                        해외잡지/해외신문
                    </button>

                </div>



            </div>


            <!-- 분야별 베스트 상품 -->
  				<div class="recommend-wrap">
  				
            		<div class="recommend-track"> 
            	
		            	<c:forEach var="product" items="${productList}">
		            			   
			
			                <div class="category-recommend-product"
			                	  data-category="${product.c_no}">
			
								<!--  상품 이미지 -->
			                    <a href="/product/detail?p_no=${product.p_no}">
			                        <img src="${product.p_image}" 
			                        	 alt="${product.p_name}">
			                    </a>
								
								<!--  상품명 -->
			                    <a href="/product/detail?p_no=${product.p_no}"
			                       class="category-recommend-name"> 
			                    ${product.p_name}
			                    </a>
			                    
			                    
								<!-- 가격 -->
			                    <p><fmt:formatNumber value="${product.p_price2}" pattern="#,###" />원</p>
			                    
			                    
								<!-- 구매 -->
								<div class="product-buttons">
								
					                    <a href="/product/detail?p_no=${product.p_no}">
					                    구매하기
					                    </a>
										
										<!-- 장바구니 -->
										<form action="/cartInsert" method="post" target="cartFrame">
										<input type="hidden" name="p_no" value="${product.p_no}">
										<input type="hidden" name="quantity" value="1">
				                    	<button type="submit" class="list_cart_button" onclick="alert('장바구니에 추가되었습니다.')">
				                        	장바구니
				                    	</button>
				                    	</form>
								</div>
								
			                </div>
			             
			             </c:forEach>
		           
	          	</div>
	          
	      </div>


        </section>



<!-- ==================================================
     5. 디지털 매거진
=================================================== -->
<section class="digital-magazine" id="digital">

    <!-- 상단 제목 -->
    <div class="section-title">

        <h2>디지털 매거진</h2>


    </div>


    <!-- 디지털 매거진 상품 -->
    <div class="digital-wrap">

        <div class="digital-track">

            <!-- 출력 개수 -->
            <c:set var="digitalCount" value="0" />

            <c:forEach var="product" items="${productList}">

                <!-- 디지털 매거진(c_no=9)만 최대 12개 -->
                <c:if test="${product.c_no == 9 && digitalCount < 12}">

                    <div class="digital-product">

                        <!-- 상품 이미지 -->
                        <a href="/product/detail?p_no=${product.p_no}">
                            <img src="${product.p_image}"
                                 alt="${product.p_name}">
                        </a>


                        <!-- 상품명 -->
                        <a href="/product/detail?p_no=${product.p_no}"
                           class="digital-product-name">
                            ${product.p_name}
                        </a>


                        <!-- 가격 -->
                        <p>
                            <fmt:formatNumber value="${product.p_price2}" pattern="#,###" />원
                        </p>


                        <!-- 구매 -->
                        <div class="product-buttons">
	                        <a href="/product/detail?p_no=${product.p_no}">
	                            구매하기
	                        </a>
	
	
	                        <!-- 장바구니 -->
							<form action="/cartInsert" method="post" target="cartFrame">
							<input type="hidden" name="p_no" value="${product.p_no}">
							<input type="hidden" name="quantity" value="1">
			                <button type="submit" class="list_cart_button" onclick="alert('장바구니에 추가되었습니다.')">
			                      장바구니
			                </button>
			                </form>
			             </div>
                    </div>

                    <!-- 출력 개수 +1 -->
                    <c:set var="digitalCount"
                           value="${digitalCount + 1}" />

                </c:if>

            </c:forEach>

        </div>

    </div>

</section>

        <!-- ==================================================
             6. 공지사항 / 배송안내 / 1:1 문의 
        =================================================== -->
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

                <a href="/one_inquiry/write">
                    문의하기
                </a>

            </div>



        </section>

    </main>



    <!-- ==================================================
         FOOTER
    =================================================== -->
   
   <jsp:include page="footer.jsp"/>
   
       <!-- 메인 자동 배너  -->
    <script src="/js/main.js"></script>
   
</body>
</html>