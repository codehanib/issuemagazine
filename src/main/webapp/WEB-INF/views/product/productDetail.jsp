<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISSUEMAGAZINE</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/product-detail.css">
    <link rel="stylesheet" href="/css/review.css">
	<style>
		.btn-write {
		    display: inline-block;
		    padding: 7px 15px;
		    background-color: #0874df;
		    color: #ffffff !important;
		    font-size: 13px;
		    font-weight: bold;
		    text-decoration: none;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    transition: background-color 0.2s ease;
				}

/* 마우스 올렸을 때 효과 */
.btn-write:hover {
    background-color: #005bb5;
}
	
	</style>
</head>
<body>
	<%@ include file="../header.jsp" %>
    <main class="product-detail-main">
        <!-- =========================================
            1. 상품 상세 상단 영역
        ========================================== -->
        <section class="product-detail">

            <!-- ==============================
                왼쪽 : 상품 이미지 영역
            =============================== -->
            <div class="product-image-area">

                <!-- 메인 상품 이미지 -->
                <div class="product-main-image">
                    <img src="${product.p_image}" alt="${product.p_name}" id="mainProductImage">
                </div>

				<div class="product-thumbnails">
				    <button type="button" id="prevBtn">
				        &lt;
				    </button>
				    <div class="thumbnail-list">
				        <c:forEach var="detail" items="${productDetails}">
				            <c:if test="${not empty detail.pdi_image}">
				                <img src="${detail.pdi_image}"
				                     alt="상품 이미지 ${detail.pdi_order}"
				                     class="thumbnail"
				                     onclick="changeMainImage(this.src)">
				            </c:if>
				        </c:forEach>
				    </div>
				    <button type="button" id="nextBtn">
				        &gt;
				    </button>
				</div>

            </div>

            <!-- ==============================
                오른쪽 : 상품 정보 영역
            =============================== -->
            <div class="product-info-area">
				<form method="post" name="productDetail">
				    <!-- 상품 이미지 -->
				    <input type="hidden" name="p_image"
				    	value="${product.p_image}">
                    <!-- 상품 번호 -->
				    <input type="hidden"
				           name="p_no"
				           value="${product.p_no}">
				    <!-- 상품명 -->
				    <input type="hidden"
				           name="p_name"
				           value="${product.p_name}">
				    <!-- 할인가 -->
				    <input type="hidden"
				           name="p_price2"
				           value="${product.p_price2}">
				    <!-- 결제 타입 -->
				    <input type="hidden" name="orderType" value="direct">
                
                <!-- 현재 위치 -->
                <div class="product-location">

                    <a href="/main">홈</a>
                    &gt;
                     <c:choose>
				        <c:when test="${product.c_no == 1}">
				            <a href="/product/list?c_no=1">패션/여성</a>
				        </c:when>
				        <c:when test="${product.c_no == 2}">
				            <a href="/product/list?c_no=2">인테리어/건축/디자인</a>
				        </c:when>
				        <c:when test="${product.c_no == 3}">
				            <a href="/product/list?c_no=3">과학/논술</a>
				        </c:when>
				        <c:when test="${product.c_no == 4}">
				            <a href="/product/list?c_no=4">교육/어학</a>
				        </c:when>
				        <c:when test="${product.c_no == 5}">
				            <a href="/product/list?c_no=5">시사/경제/경영</a>
				        </c:when>
						<c:when test="${product.c_no == 6}">
				            <a href="/product/list?c_no=6">여행/레저/취미</a>
				        </c:when>
				        <c:when test="${product.c_no == 7}">
				            <a href="/product/list?c_no=7">라이프/힐링</a>
				        </c:when>
				        <c:when test="${product.c_no == 8}">
				            <a href="/product/list?c_no=8">해외잡지/해외신문</a>
				        </c:when>
				        <c:otherwise>
				            <a href="#">전체상품</a>
				        </c:otherwise>
				    </c:choose>
                    &gt;
                    ${product.p_name}
                </div>

                <!-- 상품 제목 -->
                <div class="product-title">
                    <h1>${product.p_name}</h1>
                </div>

                <!-- 가격 -->
                <div class="product-price">
                	<div class="sale-price">
	                   <span>판매가 : </span><strong><fmt:formatNumber value="${product.p_price2}" pattern="#,###" />원</strong>
					</div>
					<div class="original-price">
	                   <span>정가 : </span><del><fmt:formatNumber value="${product.p_price}" pattern="#,###" />원</del>
	                </div>
                </div>
                <!-- ==========================
                    기본 상품 정보
                =========================== -->
                <div class="product-basic-info">
                <div class="info-item">
                    <span class="info-title">발행사/형태 :</span>
                    <span class="info-value">${product.p_publisher}</span></div>
                <div class="info-item">
			        <span class="info-title">발행국/언어 :</span>
			        <span class="info-value">${product.p_country}</span></div>
			    <div class="info-item">
			        <span class="info-title">잡지코드 :</span>
			        <span class="info-value">${product.p_code}</span></div>
                </div>
                <!-- ==========================
                    주문 옵션
                =========================== -->
                <div class="product-option-area">
                    <!-- 왼쪽 옵션 -->
                    <div class="product-options">
                        <!-- 수량 -->
                        <div>
                            <label for="quantity">
                                수량
                            </label>
                            <input
                                type="number"
                                id="quantity"
                                name="quantity"
                                value="1"
                                min="1"
                            >
                        </div>

                        <!-- 구독기간 -->
                        <div>
                            <label for="period">
                                구독기간
                            </label>
                            <select id="period" name="period">
                                <option value="12">
			                        1년 (12회)
			                    </option>
			                    <option value="6">
			                        6개월
			                    </option>
			                    <option value="3">
			                        3개월
			                    </option>
			                    <option value="1">
			                        1개월
			                    </option>
                            </select>
                        </div>
                </div>
				<br>
                <!-- ==========================
                    구매 버튼
                =========================== -->
                <div class="product-buttons">
                    <button type="submit"
                            class="buy-button" formaction="/payment">
                        바로구매
                    </button>
                    <button type="submit"
                            class="cart-button"
                            formaction="/cartInsert">
                        장바구니
                    </button>
                    <button type="submit"
                            class="wish-button"
                            formaction="/member/wishlistInsert">
                        관심상품
                    </button>
				</div>
				</form>
            </div>
        </section>

        <!-- =========================================
            2. 상세페이지 메뉴 탭
        ========================================== -->
        <section class="product-tabs">

            <a href="#product-description"
            class="active">
                상품 상세 정보
            </a>

            <a href="#product-exchange">
                교환/환불안내
            </a>

            <a href="#product-review">
    상품 사용 후기 (${reviewCount})
</a>

        </section>

        <!-- =========================================
            3. 상품 상세 설명
        ========================================== -->
        <section class="product-description"
                 id="product-description">

            <!-- DB 상세 이미지 출력 영역 -->
                <div class="detail-image-list">
				<img src="${productDetails[0].pdi_image}">
                </div>

            <!-- DB 상세 텍스트 출력 영역 -->
                <div class="detail-text">
				<p>
				< 이 달의 표지 >
				</p>
                </div>
				
				<div class="detail-image-list">
				<c:forEach var="detail" items="${productDetails}" begin="1">
    				<img src="${detail.pdi_image}">
				</c:forEach>
                </div>
        </section>

        <!-- =========================================
            4. 구독 / 교환 / 환불 / 배송 안내
        ========================================== -->
        <section class="product-guide" id="product-exchange">

            <!-- 안내 상단 설명 -->
            <div class="guide-intro">

                <p>
                    &lt;ISSUEMAGAZINE&gt;은 구독자에게 최대한 가격 혜택을 드리기 위해
                    발행사와 협의하에 정기간행물 낱권가보다 할인된 정기구독가로
                    제공하고 있습니다.
                </p>

                <p>
                    &lt;ISSUEMAGAZINE&gt;은 배송사고로 누락이 되거나 배송상에 문제가
                    발생할 경우, ONE-STOP SYSTEM으로 구독자를 대신하여 각각의 해당
                    잡지사에 사고를 통보하고 재발송 요청을 통해 신속하게 문제를
                    해결함으로써 구독자의 편의를 제공하고 있습니다.
                </p>

            </div>

            <!-- =====================================
                구독 안내
            ====================================== -->
            <div class="guide-row">

                <!-- 왼쪽 제목 -->
                <div class="guide-title">
                    <h3>구독 안내</h3>
                </div>

                <!-- 오른쪽 내용 -->
                <div class="guide-content">

                    <!-- 결제 안내 -->
                    <div class="guide-section">

                        <h4>※ 결제 안내</h4>

                        <p>
                            - ISSUEMAGAZINE의 결제방법으로는
                            (무통장 입금), (신용카드 결제),
                            (휴대폰 결제), (실시간계좌이체) 등이 있으며
                            선택하여 이용하시기 바랍니다.
                        </p>

                        <p>
                            - 학교, 기관, 도서관 등과 같이 대량의 정기간행물을
                            구독하는 기관이나 단체의 경우 행정처리의 편의를 위하여
                            행정서류 지원 및 선주문 후결제를 지원하고 있습니다.
                            (후결제가 필요한 기관이나 단체에서는 사전에
                            ISSUEMAGAZINE 고객센터로 연락주시기 바랍니다.)
                        </p>

                    </div>

                    <!-- 교환 / 반품 안내 -->
                    <div class="guide-section">

                        <h4>※ 교환 / 반품 안내</h4>

                        <p>
                            - 발행사/배송사 부주의로 제품의 불량, 파손 등의
                            잡지 반품 및 교환은 물품 수령 후 7일 이내 요청해야 합니다.
                            (교환/반품 배송비 발행사 부담)
                        </p>

                        <p>
                            - 고객님의 변심으로 받으신 상품을 사용하지 않으셨다면
                            상품 수령일로부터 7일 이내 교환 또는 반품이 가능합니다.
                            (배송료 고객부담)
                        </p>

                    </div>

                    <!-- 교환 / 반품 불가능 -->
                    <div class="guide-section">

                        <h4>
                            ※ 상품(잡지+사은품/부록) 교환 및 반품이 불가능한 경우
                        </h4>

                        <p>
                            - 배송완료 후 7일이 경과한 경우
                        </p>

                        <p>
                            - 포장 개봉 후 상품 가치가 훼손된 경우
                        </p>

                        <p>
                            - 소비자 부주의로 인한 제품의 파손
                        </p>
                    </div>
                </div>
            </div>

            <!-- =====================================
                환불 안내
            ====================================== -->
            <div class="guide-row">

                <!-- 왼쪽 제목 -->
                <div class="guide-title">
                    <h3>환불 안내</h3>
                </div>

                <!-- 오른쪽 내용 -->
                <div class="guide-content">

                    <!-- 중도 취소 -->
                    <div class="guide-section">
                        <h4>※ 중도 취소 · 환불 안내</h4>
                        <p>
                            - 잡지 배송 전 환불 : 전액 환불
                        </p>
                        <p>
                            - 잡지 배송 후 환불 :
                            구독총액 - 차감(배송된 잡지 정가 + 배송료 + 사은품)
                        </p>

                        <p>
                            - 위약금(해지수수료) :
                            해당 발행사의 규정에 따라 위약금(법정 10%)을
                            부과하는 발행사도 있습니다.
                            (해당 상품페이지 공지)
                        </p>

                        <p>
                            - 취소불가 :
                            이벤트나 기획(패키지) 등으로 행사하는 상품은
                            중도취소가 불가능한 발행사도 있습니다.
                            (해당 상품페이지 공지)
                        </p>

                    </div>
                    <!-- 환불 절차 -->
                    <div class="guide-section">

                        <h4>※ 환불 절차</h4>
                        <p>
                            - 정기구독 중도 취소 :
                            신용카드 결제는 해당 카드사 청구취소는 약 7일 소요되며,
                            현금결제 시 환불은 3~5일 소요됩니다.
                        </p>
                        <p>
                            - 반품 취소 :
                            상품이 해당 발송처로 도착한 이후 처리됩니다.
                        </p>
                    </div>
                </div>
            </div>

            <!-- =====================================
                증빙서류 발급 안내
            ====================================== -->
            <div class="guide-row">
                <!-- 왼쪽 제목 -->
                <div class="guide-title">
                    <h3>
                        증빙서류<br>
                        발급안내
                    </h3>
                </div>

                <!-- 오른쪽 내용 -->
                <div class="guide-content">

                    <div class="guide-section">

                        <h4>※ 증빙서류 발급안내</h4>

                        <p>
                            - 기관이나 단체, 기타 서비스업체 등과 같이
                            대량의 정기간행물을 구독하는 경우 기관품의 및
                            행정처리의 편의를 위해 모든 행정서류를
                            지원하고 있습니다.
                        </p>

                        <p>
                            - 사업자 계산서 발급
                        </p>

                        <p>
                            - 개인 현금영수증(소득공제용) 발급
                        </p>

                        <p>
                            - 사업자 현금영수증(지출증빙용) 발급
                            (계산서와 동일하게 매입비용공제 받을 수 있음)
                        </p>

                    </div>

                </div>

            </div>

            <!-- =====================================
                배송 / 발행 안내
            ====================================== -->
            <div class="guide-row">

                <!-- 왼쪽 제목 -->
                <div class="guide-title">
                    <h3>
                        배송 / 발행 안내
                    </h3>
                </div>

                <!-- 오른쪽 내용 -->
                <div class="guide-content">

                    <!-- 국내 배송 -->
                    <div class="guide-section">

                        <h4>※ 배송 / 발행기간</h4>

                        <p>
                            - 배송은 각 발행사마다 택배발송 및 우편발송 등의
                            차이가 있으며 택배는 2~3일 소요되며
                            우편은 5~7일 소요됩니다.
                        </p>

                        <p>
                            - 사은품은 발행사에 따라 잡지와 함께 배송되거나
                            잡지 배송 후 별도로 배송됩니다.
                        </p>

                        <p>
                            - 패션계 여성지의 경우 매월 15~20일 발행되며,
                            그 외 시사, 경제, 레저, 문화, 교육지 등은
                            매월 20~25일 발행되어 당월 말 도착됩니다.
                        </p>
                        <p>
                            - 주간지는 매주 월요일 발송되어
                            수요일~금요일 도착됩니다.
                        </p>
                    </div>

                    <!-- 해외잡지 -->
                    <div class="guide-section">
                        <h4>※ 해외잡지 배송안내</h4>
                        <p>
                            <strong>- 재고없을시 :</strong>
                            해외잡지는 기본적으로 국내 입고되기까지
                            선적, 통관, 물류 등의 여러 절차를 거치므로
                            기간이 약 3주 소요됩니다.
                            주문 신청 후 독자님께 배송되기까지
                            총 약 25일 정도 소요됩니다.
                            (일본판, 아시아판 등)
                        </p>
                        <p>
                            <strong>- 재고있을시 :</strong>
                            주문 신청 후 약 2~5일 소요됩니다.
                            (영국판, 이태리판 등)
                        </p>
                    </div>
                </div>
            </div>
        </section>
                <!-- =========================================
            5. 상품 후기
        ========================================== -->
        <section class="product-review" id="product-review">
            <div class="review-header">
                <h3 class="notice-detail-title">상품 사용 후기 (${reviewCount})</h3>
            </div>

            <table class="review-table">
                <thead>
                    <tr>
                        <th style="width: 8%;">번호</th>
                        <th style="width: 47%;">제목</th>
                        <th style="width: 15%;">작성자</th>
                        <th style="width: 15%;">작성일</th>
                        <th style="width: 15%;" class="rating-col">평점</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="review" items="${reviewList}">
                        <c:set var="hasRating" value="${fn:contains(review.r_content, '(평점:')}" />

                        <c:choose>
                            <c:when test="${hasRating}">
                                <c:set var="contentOnly" value="${fn:substringBefore(review.r_content, ' (평점:')}" />
                                <c:set var="ratingRaw" value="${fn:substringAfter(review.r_content, '(평점: ')}" />
                                <c:set var="rating" value="${fn:substringBefore(ratingRaw, ')')}" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="contentOnly" value="${review.r_content}" />
                                <c:set var="rating" value="0" />
                            </c:otherwise>
                        </c:choose>

                        <tr class="review-title-row">
                            <td>${review.r_no}</td>
                            <td><strong>${review.r_title}</strong></td>
                            <td>${fn:substring(review.m_id, 0, 2)}****</td>
                            <td><fmt:formatDate value="${review.r_reg_date}" pattern="yyyy-MM-dd"/></td>
                            <td class="rating-col">
                                <span class="star-display">
                                    <c:forEach begin="1" end="5" var="i">
                                        <span class="${i <= rating ? 'filled' : ''}">★</span>
                                    </c:forEach>
                                </span>
                            </td>
                        </tr>

                        <tr class="review-preview-row">
                            <td colspan="5">
                                <div class="review-content-body">
                                    <span>${contentOnly}</span>
                                    <c:if test="${loginNo == review.m_no}">
                                        <span class="edit-link">
                                            <a href="/review/updateForm?r_no=${review.r_no}">수정</a>
                                            <a href="/review/deleteForm?r_no=${review.r_no}">삭제</a>
                                        </span>
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty reviewList}">
                        <tr>
                            <td colspan="5" style="text-align: center; padding: 40px 0; color: #888;">
                                등록된 후기가 없습니다. 첫 번째 후기를 남겨보세요!
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </section>

        <!-- 페이징 영역 -->
        <div class="pagination">
            <c:if test="${reviewPrev}">
                <a href="/product/detail?p_no=${product.p_no}&reviewPage=${reviewStartPage - 1}#product-review">이전</a>
            </c:if>

            <c:forEach var="num" begin="${reviewStartPage}" end="${reviewEndPage}">
                <c:choose>
                    <c:when test="${num == reviewPage}">
                        <span class="active">${num}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="/product/detail?p_no=${product.p_no}&reviewPage=${num}#product-review">${num}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${reviewNext}">
                <a href="/product/detail?p_no=${product.p_no}&reviewPage=${reviewEndPage + 1}#product-review">다음</a>
            </c:if>
        </div>
    </main>
    <%@ include file="../footer.jsp" %>
    <script>
    // ==========================================
    // 상품 썸네일
    // ==========================================
    const thumbnails = document.querySelectorAll(".thumbnail");
    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");
    // 현재 시작 위치
    let currentIndex = 0;
    // 한 번에 보여줄 이미지 개수
    const visibleCount = 4;
    // ==========================================
    // 썸네일 화면 업데이트
    // ==========================================
    function updateThumbnails() {
        thumbnails.forEach((img, index) => {
            if (index >= currentIndex &&
                index < currentIndex + visibleCount) {
                img.style.display = "block";
            } else {
                img.style.display = "none";
            }
        });
    }
    // ==========================================
    // 이전 버튼
    // ==========================================
    prevBtn.addEventListener("click", function() {
        if (currentIndex > 0) {
            currentIndex--;
            updateThumbnails();
        }
    });
    // ==========================================
    // 다음 버튼
    // ==========================================
    nextBtn.addEventListener("click", function() {
        if (currentIndex + visibleCount < thumbnails.length) {
            currentIndex++;
            updateThumbnails();
        }
    });
    // ==========================================
    // 썸네일 클릭 → 메인 이미지 변경
    // ==========================================
    function changeMainImage(imageUrl) {
        document.getElementById("mainProductImage").src = imageUrl;
    }
    // ==========================================
    // 처음 페이지가 열렸을 때 실행
    // ==========================================

    updateThumbnails();
 
	</script>
</body>
</html>