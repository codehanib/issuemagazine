<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 목록</title>
<link rel="stylesheet" type="text/css" href="/css/notice_detail.css">
<style>
    .notice-list-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        font-size: 14px;
    }
    .notice-list-table th {
        background-color: #fafafa;
        color: #333333;
        font-weight: 600;
        padding: 14px 10px;
        border-top: 1px solid #333333;
        border-bottom: 1px solid #dddddd;
        text-align: center;
    }
    .notice-list-table td {
        padding: 14px 10px;
        border-bottom: 1px solid #eeeeee;
        color: #555555;
        text-align: center;
    }
    .notice-list-table td.title-cell {
        text-align: left;
    }
    .title-link {
        color: #222222;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.15s;
    }
    .title-link:hover {
        color: #0874df;
        text-decoration: underline;
    }
    .secret-title {
        color: #888888;
        cursor: pointer;
    }
    .secret-title:hover {
        color: #555555;
    }
    .badge {
        display: inline-block;
        padding: 4px 10px;
        font-size: 12px;
        font-weight: 600;
        border-radius: 12px;
    }
    .badge-completed {
        background-color: #e8f5e9;
        color: #2e7d32;
    }
    .badge-waiting {
        background-color: #fff3e0;
        color: #ef6c00;
    }
    .notice-pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 6px;
        margin-top: 30px;
    }
    .notice-pagination a,
    .notice-pagination span {
        display: inline-flex;
        justify-content: center;
        align-items: center;
        min-width: 34px;
        height: 34px;
        padding: 0 6px;
        border: 1px solid #e0e0e0;
        border-radius: 4px;
        color: #555555;
        font-size: 13px;
        text-decoration: none;
        transition: 0.15s;
    }
    .notice-pagination a:hover {
        border-color: #0874df;
        color: #0874df;
    }
    .notice-pagination .active {
        background-color: #0874df;
        border-color: #0874df;
        color: #ffffff;
        font-weight: 600;
    }
    .notice-search-box {
        margin-top: 25px;
        display: flex;
        justify-content: center;
    }
    .notice-search-box form {
        display: flex;
        gap: 8px;
    }
    .notice-search-box select,
    .notice-search-box input[type="text"] {
        height: 40px;
        padding: 0 12px;
        border: 1px solid #e0e0e0;
        border-radius: 6px;
        font-size: 14px;
        color: #333333;
    }
    .notice-search-box select:focus,
    .notice-search-box input[type="text"]:focus {
        border-color: #0874df;
        outline: none;
    }
    .notice-search-box button {
        height: 40px;
        padding: 0 18px;
        border: none;
        border-radius: 6px;
        background-color: #0874df;
        color: #ffffff;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.15s;
    }
    .notice-search-box button:hover {
        background-color: #0562c4;
    }
    /* 하단 버튼 바 */
    .notice-bottom-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid #eeeeee;
    }
    .btn-main, .btn-write {
        display: inline-flex;
        justify-content: center;
        align-items: center;
        height: 42px;
        padding: 0 20px;
        border-radius: 6px;
        font-size: 14px;
        font-weight: 600;
        text-decoration: none;
        cursor: pointer;
        transition: 0.15s;
    }
    .btn-main {
        border: 1px solid #cccccc;
        background-color: #ffffff;
        color: #555555;
    }
    .btn-main:hover {
        border-color: #0874df;
        color: #0874df;
    }
    .btn-write {
        border: 1px solid #0874df;
        background-color: #0874df;
        color: #ffffff;
    }
    .btn-write:hover {
        background-color: #0562c4;
    }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.username" var="loginId"/>
</sec:authorize>

<div class="notice-detail-wrapper">
    <h2 class="notice-detail-title">1:1 문의 게시판</h2>

    <table class="notice-list-table">
        <thead>
            <tr>
                <th style="width: 8%;">번호</th>
                <th style="width: 45%;">제목</th>
                <sec:authorize access="hasRole('ADMIN')">
                    <th style="width: 15%;">답변</th>
                </sec:authorize>
                <th style="width: 12%;">작성일</th>
                <th style="width: 10%;">상태</th>
                <th style="width: 10%;">작성자</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="one_inquiry" items="${list}">
                <tr>
                    <td>${one_inquiry.oi_no}</td>
                    <td class="title-cell">
                        <c:choose>
                            <c:when test="${isAdmin || pageContext.request.isUserInRole('ROLE_ADMIN')}">
                                <a href="/one_inquiry/view?oi_no=${one_inquiry.oi_no}" class="title-link">
                                    🔒 ${one_inquiry.oi_title}
                                </a>
                            </c:when>

                            <c:when test="${not empty loginId and loginId == one_inquiry.m_id}">
                                <a href="/one_inquiry/passwordCheckForm?oi_no=${one_inquiry.oi_no}" class="title-link">
                                    🔒 ${one_inquiry.oi_title}
                                </a>
                            </c:when>

                            <c:otherwise>
                                <span class="secret-title" onclick="alert('작성자 본인만 확인 가능합니다.');">
                                    🔒 비밀글입니다.
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <sec:authorize access="hasRole('ADMIN')">
                        <td>${one_inquiry.oi_answer}</td>
                    </sec:authorize>
                    
                    <td><fmt:formatDate value="${one_inquiry.oi_reg_date}" pattern="yyyy-MM-dd"/></td>
                    
                    <td>
                        <c:choose>
                            <c:when test="${one_inquiry.oi_status == '답변완료'}">
                                <span class="badge badge-completed">답변완료</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge badge-waiting">답변대기</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    
                    <td>${fn:substring(one_inquiry.m_id, 0, 2)}****</td>
                </tr>
            </c:forEach>

            <c:if test="${empty list}">
    <tr>
        <td colspan="6" style="padding: 40px 0; color: #888888;">
            등록된 문의 내역이 없습니다.
        </td>
    </tr>
</c:if>
        </tbody>
    </table>

    <div class="notice-pagination">
        <c:if test="${prev}">
            <a href="/one_inquiry/list?page=${startPage - 1}&searchType=${searchType}&keyword=${keyword}">이전</a>
        </c:if>

        <c:forEach var="num" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${num == page}">
                    <span class="active">${num}</span>
                </c:when>
                <c:otherwise>
                    <a href="/one_inquiry/list?page=${num}&searchType=${searchType}&keyword=${keyword}">${num}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${next}">
            <a href="/one_inquiry/list?page=${endPage + 1}&searchType=${searchType}&keyword=${keyword}">다음</a>
        </c:if>
    </div>

    <div class="notice-search-box">
        <form name="search" method="get" action="/one_inquiry/list">
            <select name="searchType">
                <option value="title" ${searchType == 'title' ? 'selected' : ''}>제목</option>
                <option value="writer" ${searchType == 'writer' ? 'selected' : ''}>글쓴이</option>
            </select>

            <input type="text" name="keyword" value="${keyword}" placeholder="검색어를 입력하세요">
            <button type="submit">검색</button>
        </form>
    </div>

    <div class="notice-bottom-bar">
        <a href="/main" class="btn-main">메인으로</a>
        <a href="/one_inquiry/writeForm" class="btn-write">문의 작성하기</a>
    </div>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>