<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문서</title>

    <!-- 포트원 V1 JavaScript SDK -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>

<body>
<%@ include file="header.jsp" %>
<h2>주문서</h2>
<form action="/member/ordersInsert" method="post" name="payForm" id="payForm">
	<!-- 결제 타입 -->
			<input type="hidden"
		           name="orderType"
		           value="${orderType}">
	<!-- 결제 정보 -->
			<input type="hidden" name="imp_uid" id="imp_uid">
			<input type="hidden" name="merchant_uid" id="merchant_uid">
	<section>
	<c:choose>
		<c:when test="${orderType == 'direct'}">
	<!-- 상품 정보 -->
			<input type="hidden" name="oddtoList[0].p_no" value="${p_no}">
			<input type="hidden" name="oddtoList[0].od_name" value="${p_name}">
			<input type="hidden" name="oddtoList[0].od_sub_date" value="${period}">
			<input type="hidden" name="oddtoList[0].od_quantity" value="${quantity}">
	<!-- 상품 이미지 -->
            <div class="order-product-image">
                <img src="${p_image}"
                     alt="결제 상품 이미지">
            </div>
            <!-- 상품 정보 -->
            <div class="order-product-info">
                <p> 상품명 </p>
                <h3>
                    ${p_name}
                </h3>
                <p>
                    구독기간 : ${period}
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
                    ${p_price2*quantity}원
                </strong>
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
			           
                <div class="order-product">
                    <!-- 상품 이미지 -->
                    <div class="order-product-image">
                        <img src="${cart.p_image}"
                             alt="${cart.p_name}">
                    </div>
                    <!-- 상품 정보 -->
                    <div class="order-product-info">
                        <p>상품명</p>
                        <h3>
                            ${cart.p_name}
                        </h3>
                        <p>
                            상품번호 : ${cart.p_no}
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
                            ${cart.p_price * cart.cart_quantity}원
                        </strong>
                    </div>
                </div>
            </c:forEach>			
        </c:when>
    </c:choose>
  
    <!-- 총 주문금액 -->
    <div class="order-total-price">
        <span>총 주문금액</span>
        <strong>
            ${totalPrice}원
        </strong>
    </div>
    </section>
    
    <!-- 주문자 정보 -->
    <table>
    	<tr><td colspan=2>배송 정보 확인</td></tr>
    	<tr>
    		<td>회원 아이디</td>
    		<td>${memId}</td>
    	</tr>
    	<tr>
    		<td>이름</td>
    		<td>${m_name}</td>
    	</tr>
    	<tr>
    		<td>연락처</td>
    		<td>${m_tel}</td>
    	</tr>
		<tr>
			<td>배송지</td>
			<td><input type="text" name="m_zipno" readonly value="${m_zipno}"> - <input type="button" onclick="goPopup();" value="우편번호"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="text" name="m_addr" readonly value="${m_addr}"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="text" name="m_addr2" readonly value="${m_addr2}"></td>
		</tr>
    </table>

    <!-- 결제 -->
    <button type="button"
            class="payment-button"
            onclick="requestPay()">
        카카오페이로 결제하기
    </button>
</form>
<%@ include file="footer.jsp" %>
<script>
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