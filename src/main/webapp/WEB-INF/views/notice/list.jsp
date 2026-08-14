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
<style>
    .pagination {
        margin-top: 15px;
        text-align: center;
    }
    .pagination a {
        margin: 0 4px;
        text-decoration: none;
        color: #333;
    }
    .pagination .active {
        font-weight: bold;
        color: red;
    }
    .search-box {
        margin-top: 15px;
        text-align: center;
    }
</style>
</head>
<body>
    <div class="list-wrapper">
        <h3>공지 목록</h3>
        <table class="member-table" border="1">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>멤버번호</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="notice" items="${list}">
                    <tr>
                        <td>${notice.n_no}</td>
                        <td>
                            <a href="/notice/view?n_no=${notice.n_no}">${notice.n_title}</a>
                        </td>
                        <td><fmt:formatDate value="${notice.n_reg_date}" pattern="yyyy-MM-dd"/></td>
                        <td>${notice.n_count}</td>
                        <td>${notice.m_no}</td>
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
                <a href="/notice/list?page=${startPage - 1}&searchType=${searchType}&keyword=${keyword}">[이전]</a>
            </c:if>

            <c:forEach var="num" begin="${startPage}" end="${endPage}">
                <c:choose>
                    <c:when test="${num == page}">
                        <span class="active">[${num}]</span>
                    </c:when>
                    <c:otherwise>
                        <a href="/notice/list?page=${num}&searchType=${searchType}&keyword=${keyword}">[${num}]</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${next}">
                <a href="/notice/list?page=${endPage + 1}&searchType=${searchType}&keyword=${keyword}">[다음]</a>
            </c:if>
        </div>

        <!-- 검색 영역 -->
        <div class="search-box">
            <form action="/notice/list" method="get">
                <select name="searchType">
                    <option value="title" ${searchType == 'title' ? 'selected' : ''}>제목</option>
                    <option value="content" ${searchType == 'content' ? 'selected' : ''}>내용</option>
                </select>

                <input type="text" name="keyword" value="${keyword}">
                <button type="submit">찾기</button>
            </form>
        </div>

        <br>
        <a href="/main"><input type="button" value="메인으로"></a>
    </div>
</body>
</html>