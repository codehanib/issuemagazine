<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/">
<title>비밀번호 확인 폼</title>
</head>

<body>

<div class="container">

    <h3>비밀번호 확인</h3>

    <div class="info">
        회원정보 수정과 회원 탈퇴를 위해<br>
        비밀번호를 입력하세요.
    </div>

    <form name="passwordCheckForm" method="post" action="/member/passwordCheck">
        <input type="hidden" name="mode" value="${mode}">

        <input type="password" name="m_passwd" placeholder="PASSWORD">

        <input type="submit" value="확인">
    </form>

    <c:if test="${not empty msg}">
        <p>${msg}</p>
    </c:if>

</div>

</body>
</html>