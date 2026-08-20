<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Service(고객센터)</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    color: #222;
}

.info-area {
    width: 90%;
    max-width: 1100px;

    margin: 50px auto;

    display: flex;

    gap: 20px;
}

.info-area > div {
    flex: 1;

    min-height: 220px;

    padding: 30px;

    border: 1px solid #ddd;

    background-color: #fff;
}

.info-area h3 {
    margin: 0 0 25px;

    padding-bottom: 15px;

    border-bottom: 1px solid #ddd;

    font-size: 16px;

    font-weight: normal;
}

.info-area a {
    display: block;

    margin-top: 15px;

    color: #555;

    text-decoration: none;

    font-size: 13px;
}

.info-area a:hover {
    text-decoration: underline;
}

.info-area > div:first-child a {
    margin-top: 12px;
}

.info-area > div:nth-child(2),
.info-area > div:nth-child(3) {
    line-height: 1.8;

    font-size: 13px;
}

.info-area > div:nth-child(2) a,
.info-area > div:nth-child(3) a {
    margin-top: 25px;

    font-size: 12px;
}
</style>

</head>

<body>



<section class="info-area">

    <div>
        <h3>공지사항</h3>

        <a href="#">게시글 불러오기1</a>
        <a href="#">게시글 불러오기2</a>
        <a href="#">게시글 불러오기3</a>
    </div>

    <div>
        <h3>배송안내</h3>
        평일 오후 2시 이전 주문 시<br>
        당일 출고됩니다.

        <a href="#">자세히 보기</a>
    </div>

    <div>
        <h3>1:1 문의</h3>

        궁금하신 점이 있으신가요?<br>
        친절하게 안내해 드립니다.

        <a href="#">문의하기</a>
    </div>

</section>

</body>
</html>