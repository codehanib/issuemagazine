<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 삭제 확인</title>
<!-- 리뷰 CSS 연결 -->
<link rel="stylesheet" href="/css/review.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="notice-detail-wrapper">
    <div class="review-header">
        <h2 class="notice-detail-title">문의 삭제</h2>
    </div>

    <div class="notice-delete-box">
        <p class="notice-delete-msg">* 정말 이 문의글을 삭제하시겠습니까?</p>

        <!-- 삭제 대상 제목 표시 -->
        <div class="notice-target-title">
            ${dto.oi_title}
        </div>

        <form method="post" action="/one_inquiry/delete">
            <sec:csrfInput/>
            <input type="hidden" name="oi_no" value="${dto.oi_no}">

            <div class="notice-delete-buttons">
                <a href="/one_inquiry/list" class="btn-cancel">취소</a>
                <button type="submit" class="btn-delete-submit" style="background-color: #dc3545 !important; color: #ffffff !important; border: none !important; box-shadow: 0 4px 14px rgba(220, 53, 69, 0.25) !important;">삭제하기</button>
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