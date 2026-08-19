<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지수정</title>
<link rel="stylesheet" href="/css/notice_detail.css">
<style>
    /* notice_detail.css 기반 수정 폼 전용 추가 스타일 */
    .notice-write-form .form-row {
        margin-bottom: 20px;
    }
    .notice-write-form .title {
        display: block;
        margin-bottom: 8px;
        font-size: 15px;
        font-weight: 600;
        color: #333333;
    }
    .notice-write-form input[type="text"] {
        width: 100%;
        height: 44px;
        padding: 0 16px;
        border: 1px solid #cccccc;
        border-radius: 6px;
        font-size: 15px;
        color: #444444;
        box-sizing: border-box;
        transition: 0.2s;
    }
    .notice-write-form input[type="text"]:focus,
    .notice-write-form textarea:focus {
        border-color: #0874df;
        outline: none;
    }
    .notice-write-form textarea {
        width: 100%;
        height: 200px;
        padding: 14px 16px;
        border: 1px solid #cccccc;
        border-radius: 6px;
        font-size: 15px;
        color: #444444;
        line-height: 1.6;
        resize: vertical;
        box-sizing: border-box;
        transition: 0.2s;
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
        border-color: #0874df;
        background-color: #0874df;
        color: #ffffff;
    }
    .notice-write-buttons button[type="submit"]:hover {
        background-color: #0066c8;
    }
    .notice-write-buttons a:hover {
        border-color: #0874df;
        color: #0874df;
    }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="notice-detail-wrapper">
    <h2 class="notice-detail-title">공지수정</h2>
    
    <form name="noticeForm" method="post" action="/notice/update" class="notice-write-form">
        <%-- CSRF 토큰 추가 (POST 요청 403 Forbidden 방지) --%>
        <sec:csrfInput/>
        
        <input type="hidden" name="n_no" value="${dto.n_no}">

        <div class="form-row">
            <label class="title">제목</label>
            <input type="text" name="n_title" value="${dto.n_title}" required>
        </div>

        <div class="form-row">
            <label class="title">내용</label>
            <textarea name="n_content" required>${dto.n_content}</textarea>
        </div>

        <div class="notice-write-buttons">
            <a href="/notice/view?n_no=${dto.n_no}">취소</a>
            <button type="submit">수정</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>