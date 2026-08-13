<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세보기</title>
</head>
<body>

<h2>후기 상세보기</h2>

<table border="1" cellpadding="8" cellspacing="0">
	<tr>
		<th>번호</th>
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
		<td><pre>${dto.oi_content}</pre></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${dto.oi_reg_date}</td>
	</tr>
	<tr>
		<th>상태</th>
		<td>${dto.oi_status}</td>
	</tr>
</table>

<hr>
<sec:authentication property="principal.username" var="loginId" /><c:if test="${loginId == dto.m_id}">
	<a href="/review/updateForm?oi_no=${dto.oi_no}">수정</a>
	&nbsp;|&nbsp;
	<a href="/review/deleteForm?oi_no=${dto.oi_no}">삭제</a>
	&nbsp;|&nbsp;
</c:if>

<a href="/review/list">목록으로</a>

</body>
</html>
