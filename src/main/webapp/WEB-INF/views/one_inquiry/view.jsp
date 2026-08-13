<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세보기</title>
</head>
<body>

<h2>1:1 문의 상세보기</h2>

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

<%-- ===================== 답변 영역 ===================== --%>
<c:choose>

	<%-- 이미 답변이 등록된 경우: 답변 내용 표시 --%>
	<c:when test="${not empty dto.oi_answer}">
		<h3>답변 내용</h3>
		<table border="1" cellpadding="8" cellspacing="0">
			<tr>
				<th>답변</th>
				<td><pre>${dto.oi_answer}</pre></td>
			</tr>
		</table>
	</c:when>

	<%-- 답변이 없는 경우: 관리자에게만 답변 입력 폼 노출 --%>
	<%-- TODO: 실제 프로젝트의 관리자 판별 방식(session, Spring Security 등)에 맞게 조건 수정 필요 --%>
	<c:otherwise>
		<sec:authorize access="hasRole('ADMIN')">
			<h3>답변 작성</h3>
			<form action="/one_inquiry/answer" method="post">
				<input type="hidden" name="oi_no" value="${dto.oi_no}">
				<textarea name="oi_answer" rows="6" cols="60" placeholder="답변 내용을 입력하세요" required></textarea>
				<br>
				<button type="submit">답변 등록</button>
			</form>
		</sec:authorize>
		<sec:authorize access="!hasRole('ADMIN')">
			<p>아직 답변이 등록되지 않았습니다.</p>
		</sec:authorize>
	</c:otherwise>

</c:choose>

<hr>

<%-- 작성자 본인만 수정/삭제 가능 --%>
<sec:authentication property="principal.username" var="loginId" /><c:if test="${loginId == dto.m_id}">
	<a href="/one_inquiry/updateForm?oi_no=${dto.oi_no}">수정</a>
	&nbsp;|&nbsp;
	<a href="/one_inquiry/deleteForm?oi_no=${dto.oi_no}">삭제</a>
	&nbsp;|&nbsp;
</c:if>

<a href="/one_inquiry/list">목록으로</a>

</body>
</html>
