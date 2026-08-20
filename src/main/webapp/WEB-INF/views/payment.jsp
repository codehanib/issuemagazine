<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문서</title>

    <!-- 포트원 V1 JavaScript SDK -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<style>
/* ================================
   //주문서 전체
================================ */

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    background: #fff;
    color: #333;
    font-family: "Noto Sans KR", "Malgun Gothic", Arial, sans-serif;
}

.order-page {
    width: 1100px;
    margin: 0 auto;
    padding: 45px 0 70px;
}


/* ================================
   페이지 제목
================================ */

.order-title {
    margin: 0 0 25px;
    padding-left: 16px;
    position: relative;

    color: #222;
    font-size: 30px;
    font-weight: 700;
}

.order-title::before {
    content: "";
    position: absolute;
    left: 0;
    top: 4px;

    width: 5px;
    height: 29px;

    background: #1478d4;
    border-radius: 3px;
}


/* ================================
   공통 카드
================================ */

.order-card {
    background: #fff;
    border: 1px solid #e2e8ef;
    border-radius: 12px;
    box-shadow: 0 3px 12px rgba(20, 90, 150, 0.06);
    margin-bottom: 25px;
}


/* 카드 제목 */
.card-title {
    margin: 0;
    padding: 20px 25px;

    color: #222;
    font-size: 18px;
    font-weight: 700;

    border-bottom: 1px solid #e5ebf1;
    
    text-align: left;
}

.card-title .blue {
    color: #1478d4;
}


/* ================================
   상품 영역
================================ */

.product-list {
    padding: 10px 30px 0;
}

.order-product {
    display: flex;
    align-items: center;

    min-height: 190px;
    padding: 20px 0;

    border-bottom: 1px solid #e8edf2;
}

.order-product:last-child {
    border-bottom: none;
}


/* ================================
   상품 이미지
================================ */

.order-product-image {
    width: 150px;
    height: 180px;

    flex-shrink: 0;

    display: flex;
    justify-content: center;
    align-items: center;

    overflow: hidden;

    background: #f5f8fb;
    border: 1px solid #e1e7ed;
    border-radius: 8px;
}

.order-product-image img {
    width: 100%;
    height: 100%;

    object-fit: cover;
}


/* ================================
   상품 정보
================================ */

.order-product-info {
    flex: 1;
    padding: 0 30px;
}

.order-product-info .product-label {
    margin: 0 0 8px;

    color: #1478d4;
    font-size: 13px;
    font-weight: 600;
}

.order-product-info h3 {
    margin: 0 0 12px;

    color: #222;
    font-size: 19px;
    font-weight: 700;
}

.order-product-info .product-detail {
    margin: 5px 0;

    color: #777;
    font-size: 13px;
}


/* ================================
   수량
================================ */

.order-product-quantity {
    width: 100px;
    flex-shrink: 0;

    text-align: center;
}

.order-product-quantity .label {
    display: block;
    margin-bottom: 8px;

    color: #888;
    font-size: 13px;
}

.order-product-quantity strong {
    color: #333;
    font-size: 15px;
}


/* ================================
   상품 가격
================================ */

.order-product-price {
    width: 180px;
    flex-shrink: 0;

    padding-right: 15px;

    text-align: right;
}

.order-product-price strong {
    color: #1478d4;
    font-size: 20px;
    font-weight: 700;
}


/* ================================
   총 주문금액
================================ */

.order-total {
    display: flex;
    justify-content: flex-end;
    align-items: center;

    margin: 20px 30px 25px;
    padding: 20px;

    background: #f4f8fc;
    border-radius: 8px;
}

.order-total .total-label {
    margin-right: 20px;

    color: #555;
    font-size: 15px;
}

.order-total .total-price {
    color: #1478d4;
    font-size: 26px;
    font-weight: 700;
}


/* ================================
   배송 정보
================================ */

.delivery-table {
    width: 100%;

    border-collapse: collapse;
}

.delivery-table tr {
    border-bottom: 1px solid #e8edf2;
}

.delivery-table tr:last-child {
    border-bottom: none;
}

.delivery-table th {
    width: 180px;

    padding: 17px 25px;

    background: #f7f9fb;

    color: #555;
    font-size: 14px;
    font-weight: 600;

    text-align: left;
}

.delivery-table td {
    padding: 12px 25px;

    color: #333;
    font-size: 14px;
}


/* 배송지 입력 */
.delivery-table input[type="text"] {
    height: 38px;

    padding: 0 12px;

    border: 1px solid #d5dde5;
    border-radius: 5px;

    background: #f8fafc;

    color: #444;
    font-size: 14px;

    outline: none;
}

.delivery-table input[type="text"]:focus {
    border-color: #1478d4;
}


/* 우편번호 */
.delivery-table .zip-code {
    width: 110px;
}


/* 주소 */
.delivery-table .address {
    width: 600px;
}


/* 우편번호 찾기 버튼 */
.zip-button {
    height: 38px;

    margin-left: 5px;
    padding: 0 15px;

    border: 1px solid #1478d4;
    border-radius: 5px;

    background: #fff;
    color: #1478d4;

    font-size: 13px;
    font-weight: 600;

    cursor: pointer;
}

.zip-button:hover {
    background: #f0f7ff;
}


/* ================================
   결제 영역
================================ */

.payment-card {
    padding-bottom: 30px;
    text-align: center;
}

.payment-summary {
    display: flex;
    justify-content: space-between;
    align-items: center;

    padding: 20px 25px;
    margin-bottom: 25px;

    background: #f4f8fc;
    border-radius: 8px;
}

.payment-summary span {
    color: #555;
    font-size: 15px;
}

.payment-summary strong {
    color: #1478d4;
    font-size: 24px;
}


/* 결제 버튼 */
.payment-button {
    width: 360px;
    height: 58px;

    border: none;
    border-radius: 7px;

    background: #1478d4;
    color: #fff;

    font-size: 17px;
    font-weight: 700;

    cursor: pointer;

    box-shadow: 0 4px 10px rgba(20, 120, 212, 0.2);

    transition: all 0.2s ease;
}

.payment-button:hover {
    background: #0968bd;

    transform: translateY(-1px);

    box-shadow: 0 6px 14px rgba(20, 120, 212, 0.28);
}

.payment-button:active {
    transform: translateY(0);
}

/* ================================
   결제수단
================================ */

.payment-method-area {
    margin: 0 30px 30px;
    text-align: left;
}

.payment-method-area h4 {
    margin: 0 0 15px;

    color: #333;
    font-size: 16px;
    font-weight: 700;
}

/* 결제수단 목록 */

.payment-method-list {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 10px;
}

/* 결제수단 버튼 */

.payment-method {
    position: relative;

    height: 65px;

    display: flex;
    align-items: center;

    padding: 0 18px;

    border: 1px solid #dfe5eb;
    border-radius: 7px;

    background: #fff;
    color: #333;

    cursor: pointer;

    transition: all 0.15s ease;
}

.payment-method:hover {
    border-color: #1478d4;
    background: #f7fbff;
}

/* 선택된 결제수단 */

.payment-method.active {
    border: 2px solid #1478d4;
    background: #f4f9ff;
}

/* 선택 표시 */

.payment-method.active::after {
    content: "✓";

    position: absolute;
    top: 7px;
    right: 9px;

    color: #1478d4;
    font-size: 14px;
    font-weight: 700;
}

/* 아이콘 */

.payment-icon {
    width: 36px;
    height: 36px;

    display: flex;
    justify-content: center;
    align-items: center;

    margin-right: 12px;

    border-radius: 8px;

    font-size: 17px;
    font-weight: 700;
}

/* 신용카드 */

.card-icon {
    background: #eef3f8;
}

/* 네이버페이 */

.naver-icon {
    background: #03c75a;
    color: #fff;
}

/* 카카오페이 */

.kakao-icon {
    background: #fee500;
    color: #3c1e1e;
}

/* 토스페이 */

.toss-icon {
    background: #0064ff;
    color: #fff;
}

/* 무통장입금 */

.bank-icon {
    background: #eef5ff;
}

/* 휴대폰 */

.phone-icon {
    background: #f1f3f5;
}

/* 결제수단 이름 */

.payment-method-name {
    font-size: 14px;
    font-weight: 600;
}

/* 결제 버튼 */

.payment-card .payment-button {
    margin-top: 5px;
}
</style>
</head>

<body>
<%@ include file="header.jsp" %>
<div class="order-page">
<h2 class="order-title">주문서</h2>
<form action="/member/ordersInsert" method="post" name="payForm" id="payForm">
	<!-- 결제 타입 -->
			<input type="hidden"
		           name="orderType"
		           value="${orderType}">
	<!-- 결제 정보 -->
			<input type="hidden" name="imp_uid" id="imp_uid">
			<input type="hidden" name="merchant_uid" id="merchant_uid">
	<section class="order-card">
		<h3 class="card-title">
			<span class="blue">01</span>
			주문 상품
		</h3>
		<div class="product-list">
	<c:choose>
		<c:when test="${orderType == 'direct'}">
	<!-- 상품 정보 -->
			<input type="hidden" name="oddtoList[0].p_no" value="${p_no}">
			<input type="hidden" name="oddtoList[0].od_name" value="${p_name}">
			<input type="hidden" name="oddtoList[0].od_sub_date" value="${period}">
			<input type="hidden" name="oddtoList[0].od_quantity" value="${quantity}">
	<!-- 상품 카드 -->
	<div class="order-product">
	<!-- 상품 이미지 -->
            <div class="order-product-image">
                <img src="${p_image}"
                     alt="결제 상품 이미지">
            </div>
            <!-- 상품 정보 -->
            <div class="order-product-info">
                <p class="product-label"> 상품명 </p>
                <h3>
                    ${p_name}
                </h3>
                <p class="product-detail">
                	상품 번호 : ${p_no}
               	</p>
                <p class="product-detail">
                    구독기간 : ${period} 개월
                </p>
            </div>
            <!-- 수량 -->
            <div class="order-product-quantity">
                <span class="label">수량</span>
                <strong>
                    ${quantity}개
                </strong>
            </div>
            <!-- 가격 -->
            <div class="order-product-price">
                <strong>
                <fmt:formatNumber value="${p_price2*quantity}" pattern="#,###"/>원
                </strong>
            </div>
    </div>
        </c:when>
    	<c:when test="${orderType == 'cart'}">
			<c:forEach var="cart"
                       items="${cartList}" varStatus="status">
			    <input type="hidden"
			           name="oddtoList[${status.index}].p_no"
			           value="${cart.p_no}">
			
			    <input type="hidden"
			           name="oddtoList[${status.index}].od_name"
			           value="${cart.p_name}">
			
			    <input type="hidden"
			           name="oddtoList[${status.index}].od_quantity"
			           value="${cart.cart_quantity}">
			           
			    <input type="hidden"
				       name="oddtoList[${status.index}].cart_no"
				       value="${cart.cart_no}">
	<!-- 상품 카드 -->
	<div class="order-product">	       
                    <!-- 상품 이미지 -->
                    <div class="order-product-image">
                        <img src="${cart.p_image}"
                             alt="${cart.p_name}">
                    </div>
                    <!-- 상품 정보 -->
                    <div class="order-product-info">
                        <p class="product-label">상품명</p>
                        <h3>
                            ${cart.p_name}
                        </h3>
                        <p class="product-detail">
                            상품번호 : ${cart.p_no}
                        </p>
                        <p class="product-detail">
                    		구독기간 : 12 개월
               		    </p>
                    </div>
                    <!-- 수량 -->
                    <div class="order-product-quantity">
                        <span class="label">수량</span>
                        <strong>
                            ${cart.cart_quantity}개
                        </strong>
                    </div>
                 	  <!-- 가격 -->
                    <div class="order-product-price">
                        <strong>
                        <fmt:formatNumber value="${cart.p_price2 * cart.cart_quantity}" pattern="#,###"/>원
                        </strong>
                    </div>
                </div>
            </c:forEach>			
        </c:when>
    </c:choose>
  	</div>
    <!-- 총 주문금액 -->
    <div class="order-total">
        <span class="total-label">
        	총 주문금액
        </span>
        <strong class="total-price">
        <fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원
        </strong>
    </div>
    </section>
    
    <!-- 주문자 정보 -->
    <section class="order-card">
    <h3 class="card-title">
    	<span class="blue">02</span>
    	배송 정보
    </h3>
    
    <table class="delivery-table">
    	<tr>
    		<th>회원 아이디</th>
    		<td>${memId}</td>
    	</tr>
    	<tr>
    		<th>이름</th>
    		<td>${m_name}</td>
    	</tr>
    	<tr>
    		<th>연락처</th>
    		<td>${m_tel}</td>
    	</tr>
		<tr>
			<th>배송지</th>
			<td><input type="text" name="m_zipno" readonly value="${m_zipno}"> - <input type="button" onclick="goPopup();" value="우편번호"></td>
		</tr>
		<tr>
			<th></th>
			<td><input type="text" name="m_addr" readonly value="${m_addr}"></td>
		</tr>
		<tr>
			<th></th>
			<td><input type="text" name="m_addr2" readonly value="${m_addr2}"></td>
		</tr>
    </table>
    </section>

    <!-- 결제 정보 -->
<section class="order-card payment-card">
    <h3 class="card-title">
        <span class="blue">03</span>
        결제 정보
    </h3>
    <!-- 총 결제금액 -->
    <div class="payment-summary">
        <span>
            총 결제금액
        </span>

        <strong>
        <fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원
        </strong>
    </div>

    <!-- 결제수단 -->
    <div class="payment-method-area">
        <h4>결제수단</h4>
        <div class="payment-method-list">
            <!-- 신용카드 -->
            <button type="button"
                    class="payment-method"
                    onclick="selectPayment(this, '신용카드', false)">
                <span class="payment-icon card-icon">
                    💳
                </span>
                <span class="payment-method-name">
                    신용카드
                </span>
            </button>
            <!-- 네이버페이 -->
            <button type="button"
                    class="payment-method"
                    onclick="selectPayment(this, '네이버페이', false)">
                <span class="payment-icon naver-icon">
                    N
                </span>
                <span class="payment-method-name">
                    네이버페이
                </span>
            </button>
            <!-- 카카오페이 -->
            <button type="button"
                    class="payment-method active"
                    onclick="selectPayment(this, '카카오페이', true)">
                <span class="payment-icon kakao-icon">
                    K
                </span>
                <span class="payment-method-name">
                    카카오페이
                </span>
            </button>
            <!-- 토스페이 -->
            <button type="button"
                    class="payment-method"
                    onclick="selectPayment(this, '토스페이', false)">
                <span class="payment-icon toss-icon">
                    T
                </span>
                <span class="payment-method-name">
                    토스페이
                </span>
            </button>
            <!-- 무통장입금 -->
            <button type="button"
                    class="payment-method"
                    onclick="selectPayment(this, '무통장입금', false)">
                <span class="payment-icon bank-icon">
                    🏦
                </span>
                <span class="payment-method-name">
                    무통장입금
                </span>
            </button>
            <!-- 휴대폰 결제 -->
            <button type="button"
                    class="payment-method"
                    onclick="selectPayment(this, '휴대폰 결제', false)">
                <span class="payment-icon phone-icon">
                    📱
                </span>
                <span class="payment-method-name">
                    휴대폰 결제
                </span>
            </button>
        </div>
    </div>
    <!-- 최종 결제 버튼 -->
    <button type="button"
            class="payment-button"
            id="paymentButton"
            onclick="processPayment()">
        카카오페이로 결제하기
    </button>
</section>
</form>
</div>
<%@ include file="footer.jsp" %>
<script>
	//================================
	//결제수단 선택
	//================================

	let selectedPayment = "카카오페이";
	let realPayment = true;

	//결제수단 선택
	function selectPayment(button, paymentName, isRealPayment) {
	
	 document.querySelectorAll(".payment-method")
	     .forEach(function(item) {
	         item.classList.remove("active");
	     });
	
	 button.classList.add("active");
	
	 selectedPayment = paymentName;
	 realPayment = isRealPayment;
	
	 const paymentButton =
	     document.getElementById("paymentButton");
	
	 paymentButton.textContent =
	     paymentName + "로 결제하기";
	}
	
	
	//실제 결제 버튼
	function processPayment() {
	
	 if (realPayment === true &&
	     selectedPayment === "카카오페이") {
	
	     requestPay();
	
	     return;
	 }
	
	 alert(
	     selectedPayment +
	     " 현재 준비 중입니다.\n"
	 );
	}

	// 배송지 설정
	function goPopup(){
		var pop = window.open("/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(m_addr,m_addr2,m_zipno){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.payForm.m_addr.value = m_addr;
			document.payForm.m_addr2.value = m_addr2;
			document.payForm.m_zipno.value = m_zipno;
	}

    // 포트원 고객사 식별코드
    IMP.init("imp43201174");

    function requestPay() {
    	console.log("===== 결제 버튼 클릭 =====");

        const merchantUid = "test_" + new Date().getTime();

        console.log("merchant_uid =", merchantUid);

        IMP.request_pay({

            // 카카오페이 테스트 채널
            channelKey:
                "channel-key-bde14f27-c9f7-4a0a-80f8-a96973609560",
                
            pay_method: "kakaopay",

            // 주문번호
            merchant_uid: merchantUid,

            // 상품명
            name: "${paymentName}",

            // 가격
            amount: ${totalPrice},

            // 구매자 정보
            buyer_email: "test@test.com",
            buyer_name: "${m_name}",
            buyer_tel: "${m_tel}"

        }, function(rsp) {

        	console.log("===== PortOne 응답 =====");
            console.log(rsp);

            console.log("success =", rsp.success);
            console.log("imp_uid =", rsp.imp_uid);
            console.log("merchant_uid =", rsp.merchant_uid);
            console.log("error_code =", rsp.error_code);
            console.log("error_msg =", rsp.error_msg);

             if (rsp.success && rsp.imp_uid) {
             	// 결제 정보 저장
             	document.getElementById("imp_uid").value = rsp.imp_uid;
             	document.getElementById("merchant_uid").value = rsp.merchant_uid;

                 fetch("/payment/verify", {
                     method: "POST",
                     headers: {
                         "Content-Type": "application/json"
                     },
                     body: JSON.stringify({
                         imp_uid: rsp.imp_uid,
                         merchant_uid: rsp.merchant_uid
                     })
                 })
                 .then(response => response.text())
                 .then(result => {

                     console.log("서버 응답:", result);

                     alert(
                         "결제 검증 요청 완료\n\n" +
                         "imp_uid : " + rsp.imp_uid + "\n" +
                         "서버 응답 : " + result
                     );
                     
                     if(result == "OK"){
                     	document.getElementById("payForm").submit();
                     }else{
                     	alert("결제 검증에 실패했습니다.");
                     }
                 })
                 .catch(error => {
                     console.error(error);
                     alert("서버 통신 오류");
                 });

             } else {

                 alert(
                     "결제 요청 실패\n\n" +
                     "error_code : " + rsp.error_code + "\n" +
                     "error_msg : " + rsp.error_msg
                 );
             }
         });
    }
</script>

</body>
</html>