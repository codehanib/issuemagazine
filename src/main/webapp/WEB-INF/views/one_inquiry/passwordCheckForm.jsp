<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>
 <div class="login-wrapper">
    <h3>비밀번호 확인</h3>
    <p style="margin-bottom: 20px; font-size: 14px;">* 본인 확인을 위해 로그인 비밀번호를 다시 입력해주세요.</p>

    <form method="post" action="/one_inquiry/passwordCheck">
        <input type="hidden" name="oi_no" value="${oi_no}">

        <div class="form-row">
            <label class="title">비밀번호</label>
            <div class="input-content">
                <input type="password" name="m_passwd">
            </div>
        </div>

        <div class="form-row">
            <button type="submit">확인</button>
        </div>
    </form>

    <c:if test="${not empty msg}">
        <p class="msg-error" style="color:red;">${msg}</p>
    </c:if>
 </div>
</body>
</html>
