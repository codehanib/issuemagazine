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
    gap: 24px;
}

.info-card {
    flex: 1;
    min-height: 220px;
    padding: 32px;
    border: 1px solid #eee;
    border-radius: 10px;
    background-color: #fff;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.info-card h3 {
    margin: 0 0 22px;
    padding-bottom: 14px;
    font-size: 17px;
    font-weight: bold;
    color: #222;
    border-bottom: 2px solid #0874df;
}

.info-card ul {
    list-style: none;
    margin: 0;
    padding: 0;
}

.info-card ul a {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 12px 4px;
    color: #555;
    text-decoration: none;
    font-size: 13px;
    border-bottom: 1px solid #f0f0f0;
}

.info-card ul li:last-child a {
    border-bottom: none;
}

.info-card ul a::after {
    content: "\203A";
    color: #ccc;
    font-size: 16px;
    margin-left: 8px;
}

.info-card ul a:hover {
    color: #0874df;
}

.info-card ul a:hover::after {
    color: #0874df;
}

.faq-title {
    display: block;
    margin-bottom: 14px;
    font-weight: bold;
    font-size: 14px;
}

.inquiry-box {
    margin-top: 24px;
    padding: 18px 20px;
    background-color: #f5f9ff;
    border-radius: 8px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
}

.inquiry-desc {
    font-size: 13px;
    color: #666;
    line-height: 1.6;
}

.inquiry-btn {
    flex-shrink: 0;
    display: inline-block;
    color: #fff;
    background-color: #0874df;
    font-weight: bold;
    font-size: 13px;
    padding: 9px 16px;
    border-radius: 6px;
    text-decoration: none;
    white-space: nowrap;
}

.inquiry-btn:hover {
    background-color: #065bb5;
}

@media (max-width: 768px) {
    .info-area {
        flex-direction: column;
        margin: 30px auto;
    }

    .inquiry-box {
        flex-direction: column;
        align-items: flex-start;
    }

    .inquiry-btn {
        align-self: flex-end;
    }
}
</style>

</head>

<body>
<%@ include file="header.jsp" %>

<section class="info-area">

    <div class="info-card">
        <h3>공지사항</h3>
        <ul>
            <c:forEach var="notice" items="${noticeList}">
                <li><a href="/notice/view?n_no=${notice.n_no}">${notice.n_title}</a></li>
            </c:forEach>
        </ul>
    </div>

    <div class="info-card">
        <h3>1:1 문의</h3>
        <span class="faq-title">자주 찾는 도움말</span>

        <ul class="faq-list">
            <li><a href="/notice/view?n_no=44">회원정보가 변경이 안 돼요</a></li>
            <li><a href="/notice/view?n_no=29">배송이 안와요</a></li>
            <li><a href="/notice/view?n_no=46">상품이 품절인데 언제와요?</a></li>
            <li><a href="/notice/view?n_no=48">갑자기 사이트가 안 돼요</a></li>
        </ul>

        <div class="inquiry-box">
            <p class="inquiry-desc">
                궁금하신 점이 있으신가요?<br>
                친절하게 안내해 드립니다.
            </p>
            <a href="/one_inquiry/writeForm" class="inquiry-btn">
                문의하기 &gt;
            </a>
        </div>
    </div>

</section>

<%@ include file="footer.jsp" %>
</body>
</html>