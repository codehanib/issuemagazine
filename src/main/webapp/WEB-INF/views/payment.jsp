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

<h2>카카오페이 테스트 결제</h2>

<div>
    <p>상품명 : 테스트 상품</p>
    <p>이미지 : </p>
    <p>수량 : </p>
    <p>배송비 : [무료]</p>
    <p>구독기간 : </p>
    <p>결제금액 : 1,000원</p>
</div>

<button type="button" onclick="requestPay()">
    카카오페이로 결제하기
</button>

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
            name: "카카오페이 테스트 상품",

            // 결제금액
            amount: 1000,

            // 구매자 정보
            buyer_email: "test@test.com",
            buyer_name: "테스트 구매자",
            buyer_tel: "010-1234-5678"

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