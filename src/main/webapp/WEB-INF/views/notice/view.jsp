<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세보기</title>
</head>
<body>

<h2>공지 상세보기</h2>

<table border="1" cellpadding="8" cellspacing="0">
	<tr>
		<th>번호</th>
		<td>${dto.n_no}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.n_title}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><pre>${dto.n_content}</pre></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${dto.n_reg_date}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${dto.n_count}</td>
	</tr>
</table>

<hr>

<hr>

<sec:authorize access="hasRole('ADMIN')">
	<a href="/notice/updateForm?n_no=${dto.n_no}">수정</a>
	&nbsp;|&nbsp;
	<a href="/notice/deleteForm?n_no=${dto.n_no}">삭제</a>
	&nbsp;|&nbsp;
</sec:authorize>

<a href="/notice/list">목록으로</a>
<div class="prev-next-wrap">
    <c:if test="${prevDto != null}">
        <div class="prev-row">
            <span class="label">이전글 ^</span>
            <a href="/notice/view?n_no=${prevDto.n_no}">${prevDto.n_title}</a>
        </div>
    </c:if>

    <c:if test="${nextDto != null}">
        <div class="next-row">
            <span class="label">다음글 v</span>
            <a href="/notice/view?n_no=${nextDto.n_no}">${nextDto.n_title}</a>
        </div>
    </c:if>
</div>

</body>
</html>
