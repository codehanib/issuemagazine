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
<!-- 외부 CSS 연결 -->
<link rel="stylesheet" type="text/css" href="/css/one_inquiry.css">
</head>
<body>
    <!-- Spring Security에서 로그인한 사용자 ID 가져오기 -->
    <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal.username" var="loginId"/>
    </sec:authorize>

    <div class="list-wrapper">
        <h3>1:1 문의 게시판</h3>

        <table class="member-table">
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
                                <%-- 1. 관리자인 경우: 클릭 가능 --%>
                                <c:when test="${isAdmin || pageContext.request.isUserInRole('ROLE_ADMIN')}">
                                    <a href="/one_inquiry/view?oi_no=${one_inquiry.oi_no}" class="title-link">
                                        🔒 ${one_inquiry.oi_title}
                                    </a>
                                </c:when>

                                <%-- 2. 작성자 본인인 경우: 클릭 가능 --%>
                                <c:when test="${not empty loginId and loginId == one_inquiry.m_id}">
                                    <a href="/one_inquiry/passwordCheckForm?oi_no=${one_inquiry.oi_no}" class="title-link">
                                        🔒 ${one_inquiry.oi_title}
                                    </a>
                                </c:when>

                                <%-- 3. 타인 또는 비로그인: 마스킹 및 경고창 --%>
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
                        
                        <!-- 답변 상태 태그 -->
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
                        <td colspan="7" style="text-align: center; padding: 40px 0; color: #888;">
                            등록된 문의 내역이 없습니다.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <!-- 페이징 영역 -->
        <div class="pagination">
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

        <!-- 검색 영역 -->
        <div class="search-box">
            <form name="search" method="get" action="/one_inquiry/list">
                <select name="searchType">
                    <option value="title" ${searchType == 'title' ? 'selected' : ''}>제목</option>
                    <option value="writer" ${searchType == 'writer' ? 'selected' : ''}>글쓴이</option>
                </select>

                <input type="text" name="keyword" value="${keyword}" placeholder="검색어를 입력하세요">
                <button type="submit">검색</button>
            </form>
        </div>

        <div class="bottom-bar">
            <a href="/main"><button type="button" class="btn-main">메인으로</button></a>
        </div>
    </div>
</body>
</html>