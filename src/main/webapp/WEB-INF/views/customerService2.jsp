<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    margin-top: 12px; /* 기본 여백을 12px로 통일 */
    color: #555;
    text-decoration: none;
    font-size: 13px;
}

.info-area a:hover {
    text-decoration: underline;
}

.faq-list a {
    margin-top: 8px !important; /* 글자 사이 간격을 좁게 설정 */
    color: #555;
    font-size: 13px;
}

.inquiry-btn {
    margin-top: 20px !important;
    display: inline-block !important;
    color: #0874df !important;
    font-weight: bold;
}
</style>

</head>

<body>
<%@ include file="header.jsp" %>

<section class="info-area">

    <div>
        <h3>공지사항</h3>
        <c:forEach var="notice" items="${noticeList}">
            <a href="/notice/view?n_no=${notice.n_no}">${notice.n_title}</a>
        </c:forEach>
    </div>

    <div>
        <h3>1:1 문의</h3>
        <b style="display: block; margin-bottom: 10px;">자주 찾는 도움말</b>
        
        <div class="faq-list">
            <a href="/notice/view?n_no=44">회원정보가 변경이 안되요</a>
            <a href="/notice/view?n_no=29">배송이 안와요</a>
            <a href="/notice/view?n_no=46">상품이 품절인데 언제와요?</a>
            <a href="/notice/view?n_no=48">갑자기 사이트가 안되요</a>
        </div>

        <div style="margin-top: 25px; font-size: 13px; color: #666; line-height: 1.6;">
            궁금하신 점이 있으신가요?<br>
            친절하게 안내해 드립니다.
        </div>

        <a href="/one_inquiry/writeForm" class="inquiry-btn">
            문의하기 &gt;
        </a>
    </div>

</section>

<%@ include file="footer.jsp" %>
</body>
</html>