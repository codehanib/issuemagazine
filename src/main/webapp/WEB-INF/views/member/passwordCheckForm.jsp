<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>비밀번호 확인</title>

<style>

/* =========================================
   기본 설정
========================================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}


body {
    min-height: 100vh;

    font-family: Arial, "Noto Sans KR", sans-serif;

    background: linear-gradient(
        135deg,
        #f8faff,
        #eef3fa
    );

    color: #222;

    position: relative;

    overflow: hidden;
}



/* =========================================
   배경 장식
========================================= */

body::before {
    content: "";

    position: absolute;

    top: -80px;
    left: -80px;

    width: 230px;
    height: 230px;

    border-radius: 50%;

    background-color: rgba(31, 109, 240, 0.07);
}


body::after {
    content: "";

    position: absolute;

    right: -100px;
    bottom: -100px;

    width: 280px;
    height: 280px;

    border-radius: 50%;

    background-color: rgba(31, 109, 240, 0.07);
}



/* =========================================
   전체 영역
========================================= */

.page-wrapper {
    min-height: 100vh;

    display: flex;

    justify-content: center;
    align-items: center;

    position: relative;

    z-index: 10;
}



/* =========================================
   비밀번호 확인 카드
========================================= */

.container {
    width: 420px;

    max-width: calc(100% - 40px);

    padding: 45px 45px 40px;

    background-color: #ffffff;

    border-radius: 18px;

    box-shadow:
        0 15px 40px
        rgba(0, 0, 0, 0.09);

    text-align: center;
}



/* =========================================
   제목
========================================= */

h3 {
    margin: 0 0 22px;

    font-size: 25px;

    font-weight: 800;

    color: #102948;
}



/* =========================================
   안내 문구
========================================= */

.info {
    margin-bottom: 26px;

    font-size: 14px;

    line-height: 1.7;

    color: #68788a;
}



/* =========================================
   비밀번호 입력
========================================= */

input[type="password"] {
    width: 100%;

    height: 48px;

    padding: 0 15px;

    border: 1px solid #d5dfe9;

    border-radius: 8px;

    background-color: #ffffff;

    font-size: 13px;

    color: #26384d;

    outline: none;

    transition: 0.2s;
}


input[type="password"]::placeholder {
    color: #a4afbb;
}


input[type="password"]:focus {
    border-color: #1f6df0;

    box-shadow:
        0 0 0 3px
        rgba(31, 109, 240, 0.08);
}



/* =========================================
   확인 버튼
========================================= */

input[type="submit"] {
    width: 100%;

    height: 50px;

    margin-top: 12px;

    border: 1px solid #1f6df0;

    border-radius: 8px;

    background-color: #1f6df0;

    color: #ffffff;

    font-size: 14px;

    font-weight: bold;

    cursor: pointer;

    transition: 0.2s;
}


input[type="submit"]:hover {
    background-color: #155ed4;

    border-color: #155ed4;

    transform: translateY(-2px);

    box-shadow:
        0 7px 16px
        rgba(31, 109, 240, 0.20);
}



/* =========================================
   비밀번호 오류 메시지
========================================= */

p {
    margin: 17px 0 0;

    font-size: 12px;

    color: #e05b62;

}



/* =========================================
   작은 화면
========================================= */

@media (max-width: 600px) {

    .container {
        padding: 38px 25px 32px;
    }


    h3 {
        font-size: 23px;
    }

}

</style>

</head>


<body>

<div class="page-wrapper">

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
			<input type="hidden"
			       name="o_no"
			       value="${o_no}">

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

</div>

</body>
</html>