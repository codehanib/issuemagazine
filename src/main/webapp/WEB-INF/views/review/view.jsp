<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세보기</title>
<link rel="stylesheet" href="/css/review.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="notice-detail-wrapper">
    <h2 class="notice-detail-title">후기 상세보기</h2>

    <table class="review-table">
        <tbody>
            <tr>
                <th style="width: 20%;">번호</th>
                <td>${dto.oi_no}</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${dto.m_id}</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>${dto.oi_title}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td style="white-space: pre-wrap; word-break: break-all; line-height: 1.6;">${dto.oi_content}</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>${dto.oi_reg_date}</td>
            </tr>
            <tr>
                <th>상태</th>
                <td>${dto.oi_status}</td>
            </tr>
        </tbody>
    </table>

    <sec:authentication property="principal.username" var="loginId" />
    
    <div class="notice-write-buttons">
        <a href="/review/list">목록으로</a>
        
        <c:if test="${loginId == dto.m_id}">
            <a href="/review/updateForm?oi_no=${dto.oi_no}">수정</a>
            <a href="/review/deleteForm?oi_no=${dto.oi_no}" class="btn-delete-submit">삭제</a>
        </c:if>
    </div>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>