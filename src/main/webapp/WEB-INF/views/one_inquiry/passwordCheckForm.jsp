<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<link rel="stylesheet" href="/css/review.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="notice-detail-wrapper">
    <h2 class="notice-detail-title">비밀번호 확인</h2>

    <div class="notice-delete-box">
        <p class="notice-delete-msg">* 본인 확인을 위해 비밀번호를 다시 입력해 주세요.</p>

        <form method="post" action="/one_inquiry/passwordCheck">
            <sec:csrfInput/>
            <input type="hidden" name="oi_no" value="${oi_no}">

            <div class="notice-form-group" style="max-width: 400px; margin: 0 auto 24px;">
                <label class="notice-form-label" style="text-align: left;">비밀번호</label>
                <input type="password" name="m_passwd" class="notice-form-input" placeholder="비밀번호를 입력해주세요." required autofocus>
            </div>

            <div class="notice-delete-buttons">
                <a href="/one_inquiry/list" class="btn-cancel">취소</a>
                <button type="submit" class="btn-submit">확인</button>
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