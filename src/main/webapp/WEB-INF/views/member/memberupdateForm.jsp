<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script src="/js/memberupdate.js"></script>
<link rel="stylesheet" href="/">
</head>
<body>
        <h3>회원정보수정</h3>
        <a href="/">HOME</a>
        <a href="/logout">LOGOUT</a>

<form action="/member/update" method="post" name="member">
<input type="hidden" name="m_id" value="${updateForm.m_id}">

	<table>
		<tr>
			<td>아이디 </td>
			<td>${updateForm.m_id}</td>
		</tr>
		<tr>
		<td>비밀번호 </td>
			<td> <input type="password" name="m_passwd"></td>
		</tr>
		<tr>
			<td>이름 </td>
			<td>${updateForm.m_name}</td>
		</tr>
		<tr>
			<td>이메일 </td>
			<td>
				<input type="text" name="m_email" value="${fn:split(updateForm.m_email,'@')[0] }">@
				<select name="m_email2">
					<option value="">선택</option>
					<option value="naver.com" <c:if test="${fn:contains(updateForm.m_email,'naver.com')}">selected</c:if>>naver.com</option>
					<option value="gmail.com" <c:if test="${fn:contains(updateForm.m_email,'gmail.com')}">selected</c:if>>gmail.com</option>
					<option value="daum.com" <c:if test="${fn:contains(updateForm.m_email,'daum.com')}">selected</c:if>>daum.com</option>
					<option value="nate.com" <c:if test="${fn:contains(updateForm.m_email,'nate.com')}">selected</c:if>>nate.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>우편번호 </td>
			<td><input type="text" name="m_zipno" readonly value="${updateForm.m_zipno}"></td>
		</tr>
		<tr>
			<td>주소 </td>
			<td><input type="text" name="m_addr" readonly value="${fn:split(updateForm.m_addr,',')[0] }">
			<input type="button" value="주소검색" onclick="goPopup()"></td>
		</tr>
		<tr>
			<td>상세주소 </td>
			<td><input type="text" name="m_addr2" readonly value="${fn:split(updateForm.m_addr,',')[1] }"></td>
		</tr>
		<tr>
			<td>전화번호 </td>
			<td><input type="text" name="m_tel" size="3" maxlength="3" value="${fn:split(updateForm.m_tel,'-')[0] }"> - 
				<input type="text" name="m_tel2" size="4" maxlength="4" value="${fn:split(updateForm.m_tel,'-')[1] }"> - 
				<input type="text" name="m_tel3" size="4" maxlength="4" value="${fn:split(updateForm.m_tel,'-')[2] }"></td>
		</tr>
	</table>
	
		<input type="submit" value="수정하기" onclick="return check()">
		<input type="reset" value="수정취소">
</form>
</body>
</html>