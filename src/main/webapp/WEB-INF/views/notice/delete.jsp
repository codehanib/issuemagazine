<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 삭제</title>
<link rel="stylesheet" href="/css/notice_detail.css">
<style>
    .notice-delete-box {
        text-align: center;
        padding: 10px 0 20px;
    }
    .notice-delete-msg {
        font-size: 15px;
        color: #555555;
        margin-bottom: 25px;
        line-height: 1.5;
    }
    .notice-target-title {
        font-size: 16px;
        font-weight: 600;
        color: #222222;
        background-color: #fafafa;
        border: 1px solid #eeeeee;
        border-radius: 8px;
        padding: 16px 20px;
        margin-bottom: 30px;
        word-break: break-all;
    }
    .notice-write-buttons {
        display: flex;
        justify-content: flex-end;
        gap: 12px;
        margin-top: 30px;
    }
    .notice-write-buttons button,
    .notice-write-buttons a {
        display: inline-flex;
        justify-content: center;
        align-items: center;
        height: 44px;
        padding: 0 22px;
        border: 1px solid #cccccc;
        border-radius: 6px;
        background-color: #ffffff;
        color: #555555;
        font-size: 14px;
        font-weight: 600;
        text-decoration: none;
        cursor: pointer;
        transition: 0.2s;
    }
    .notice-write-buttons button[type="submit"] {
        border-color: #dc3545;
        background-color: #dc3545;
        color: #ffffff;
    }
    .notice-write-buttons button[type="submit"]:hover {
        background-color: #c82333;
    }
    .notice-write-buttons a:hover {
        border-color: #0874df;
        color: #0874df;
    }
    .msg-error {
        margin-top: 15px;
        font-size: 14px;
        color: #dc3545;
    }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="notice-detail-wrapper">
    <h2 class="notice-detail-title">공지 삭제</h2>
    
    <div class="notice-delete-box">
        <p class="notice-delete-msg">선택하신 공지사항을 정말 삭제하시겠습니까?</p>
        
        <div class="notice-target-title">
            ${dto.n_title}
        </div>

        <form method="post" action="/notice/delete">
            <sec:csrfInput/>
            
            <input type="hidden" name="n_no" value="${dto.n_no}">

            <div class="notice-write-buttons">
                <a href="/notice/view?n_no=${dto.n_no}">취소</a>
                <button type="submit">삭제하기</button>
            </div>
        </form>

        <c:if test="${not empty msg}">
            <p class="msg-error">${msg}</p>
        </c:if>
    </div>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>