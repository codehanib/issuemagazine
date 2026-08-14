<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>비밀번호 확인</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    padding: 0;
    background: #f2f6fc;
    font-family: Arial, "Noto Sans KR", sans-serif;
    color: #26384d;
}

/* 전체 중앙 영역 */
.container {
    width: 420px;
    margin: 150px auto;
    padding: 42px 45px 40px;

    background: #ffffff;
    border-radius: 8px;

    box-shadow: 0 5px 18px rgba(60, 80, 110, 0.10);

    text-align: center;
}

/* 제목 */
h3 {
    margin: 0 0 22px;

    font-size: 22px;
    font-weight: 700;

    color: #26384d;
}

/* 안내 문구 */
.info {
    margin-bottom: 24px;

    font-size: 13px;
    line-height: 1.7;

    color: #68788a;
}

/* 비밀번호 입력 */
input[type="password"] {
    width: 100%;
    height: 45px;

    padding: 0 14px;

    border: 1px solid #d5dfe9;
    border-radius: 4px;

    background: #ffffff;

    font-size: 13px;
    color: #26384d;

    outline: none;
}

input[type="password"]::placeholder {
    color: #a4afbb;
}

input[type="password"]:focus {
    border-color: #1c6df1;
    box-shadow: 0 0 0 2px rgba(28, 109, 241, 0.08);
}

/* 확인 버튼 */
input[type="submit"] {
    width: 100%;
    height: 44px;

    margin-top: 12px;

    border: 1px solid #1c6df1;
    border-radius: 4px;

    background: #1c6df1;
    color: #ffffff;

    font-size: 13px;
    font-weight: 600;

    cursor: pointer;

    transition: 0.2s;
}

input[type="submit"]:hover {
    background: #165dcc;
    border-color: #165dcc;
}

/* 비밀번호 오류 메시지 */
p {
    margin: 16px 0 0;

    font-size: 12px;
    color: #e05b62;
}
</style>

</head>

<body>

<div class="container">

    <h3>비밀번호 확인</h3>

    <div class="info">
        회원정보 수정과 회원 탈퇴를 위해<br>
        비밀번호를 입력하세요.
    </div>

    <form name="passwordCheckForm"
          method="post"
          action="/member/passwordCheck">

        <input type="hidden"
               name="mode"
               value="${mode}">

        <input type="password"
               name="m_passwd"
               placeholder="PASSWORD">

        <input type="submit"
               value="확인">

    </form>

    <c:if test="${not empty msg}">
        <p>${msg}</p>
    </c:if>

</div>

</body>
</html>