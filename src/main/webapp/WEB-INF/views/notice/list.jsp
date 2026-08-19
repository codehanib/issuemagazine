<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지목록</title>
<link rel="stylesheet" href="/css/notice.css">
</head>
<body>
<%@ include file="../header.jsp" %>
    <div class="notice-wrapper">
    
        <div class="notice-header-area" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 32px;">
            <h3 class="notice-title" style="margin-bottom: 0;">공지 목록</h3>

            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <div class="bottom-button">
                    <a href="/notice/writeForm"><input type="button" value="공지작성"></a>
                </div>
            </sec:authorize>
        </div>
        
        <table class="notice-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>작성자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="notice" items="${list}">
                    <tr>
                        <td>${notice.n_no}</td>
                        <td class="notice-title-col">
                            <a href="/notice/view?n_no=${notice.n_no}">${notice.n_title}</a>
                        </td>
                        <td><fmt:formatDate value="${notice.n_reg_date}" pattern="yyyy-MM-dd"/></td>
                        <td>${notice.n_count}</td>
                        <td>ISSUE MAGAZINE</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list}">
                    <tr>
                        <td colspan="5" style="text-align: center;">게시글이 없습니다.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <!-- 하단 페이징 영역 -->
        <div class="pagination">
            <c:if test="${prev}">
                <a href="/notice/list?page=${startPage - 1}&searchType=${searchType}&keyword=${keyword}" class="page-nav">‹</a>
            </c:if>

            <c:forEach var="num" begin="${startPage}" end="${endPage}">
                <c:choose>
                    <c:when test="${num == page}">
                        <span class="active">${num}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="/notice/list?page=${num}&searchType=${searchType}&keyword=${keyword}">${num}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${next}">
                <a href="/notice/list?page=${endPage + 1}&searchType=${searchType}&keyword=${keyword}" class="page-nav">›</a>
            </c:if>
        </div>

        <!-- 검색 영역 -->
        <div class="search-box">
            <form action="/notice/list" method="get">
                <select name="searchType">
                    <option value="title" ${searchType == 'title' ? 'selected' : ''}>제목</option>
                    <option value="content" ${searchType == 'content' ? 'selected' : ''}>내용</option>
                </select>
                <input type="text" name="keyword" value="${keyword}" placeholder="검색어를 입력하세요">
                <button type="submit">찾기</button>
            </form>
        </div>

        <!-- 하단 버튼 영역 -->
        <div class="bottom-button">
            <a href="/main"><input type="button" value="메인으로"></a>
        </div>
        
    </div>
    <%@ include file="../footer.jsp" %>
</body>
</html>