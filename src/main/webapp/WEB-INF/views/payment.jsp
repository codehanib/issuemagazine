<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>카카오페이 테스트</title>

    <!-- 포트원 V1 JavaScript SDK -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>

<body>

<h2>주문서</h2>
<form action="/ordersInput" method="post" name="payForm" id="payForm">
	<!-- 상품 정보 -->
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
        </div>
    </section>
    <!-- 주문자 정보 -->
    <table>
    	<tr><td colspan=2>배송 정보</td></tr>
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
    		<td>주소</td>
    		<td>${m_addr}</td>
    	</tr>
    	<tr>
    		<td>우편번호</td>
    		<td>${m_zipno}</td>
    	</tr>
    </table>

    <!-- 배송 정보 -->
    <input type="text" id="receiverName" name="receiverName">
    <input type="text" id="receiverPhone" name="receiverPhone">

    <input type="text" id="zipcode" name="zipcode">
    <input type="text" id="address" name="address">
    <input type="text" id="detailAddress" name="detailAddress">

    <input type="text" id="deliveryMemo" name="deliveryMemo">

    <!-- 결제 -->
    <button type="button"
            class="payment-button"
            onclick="requestPay()">
        카카오페이로 결제하기
    </button>
</form>
<script>
    // 포트원 고객사 식별코드
    IMP.init("imp43201174");

    function requestPay() {

        const merchantUid = "test_" + new Date().getTime();

        IMP.request_pay({

            // 카카오페이 테스트 채널키
            channelKey:
                "channel-key-bde14f27-c9f7-4a0a-80f8-a96973609560",

            // 주문번호
            merchant_uid: merchantUid,

            // 상품명
            name: "${p_name}",

            // 결제금액
            amount: 1000,

            // 구매자 정보
            buyer_email: "test@test.com",
            buyer_name: "${m_name}",
            buyer_tel: "${m_tel}"

        }, function(rsp) {

            console.log("PortOne 응답");
            console.log(rsp);

            if (rsp.imp_uid) {

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