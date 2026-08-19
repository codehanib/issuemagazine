<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 삭제 확인</title>
<link rel="stylesheet" href="/css/review.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="notice-detail-wrapper">
    <h2 class="notice-detail-title">후기 삭제</h2>

    <div class="notice-delete-box">
        <p class="notice-delete-msg">선택하신 후기를 정말 삭제하시겠습니까?</p>

        <label class="notice-form-label" style="text-align: center;">삭제 대상 후기 제목</label>
        <div class="notice-target-title">
            ${dto.r_title}
        </div>

        <form method="post" action="/review/delete">
            <sec:csrfInput/>
            <input type="hidden" name="r_no" value="${dto.r_no}">
            <input type="hidden" name="p_no" value="${dto.p_no}">

            <!-- 버튼 클래스 정돈 및 가로 스크롤 방지 -->
            <div class="notice-delete-buttons">
                <a href="/product/detail?p_no=${dto.p_no}#product-review" class="btn-cancel">취소</a>
                <button type="submit" class="btn-delete-submit">삭제하기</button>
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