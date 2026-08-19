<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세정보</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    color: #222;
}

.container {
    width: 90%;
    max-width: 700px;
    margin: 40px auto;
}

/* 제목 */
.title {
    position: relative;
    font-size: 18px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 20px;
    color: #222222;
    font-weight: 500;
}

/* 제목 글자 아래 두꺼운 밑줄 */
.title::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -1px;
    width: 68px;
    height: 2px;

    background-color: #222222;
}

/* 회원정보 테이블 */
.member-info {
    width: 100%;
    border-collapse: collapse;
    border-top: 1px solid #ddd;
}

/* 왼쪽 항목 */
.member-info th {
    width: 150px;
    height: 50px;
    background-color: #fafafa;
    border-bottom: 1px solid #ddd;
    font-size: 12px;
    font-weight: normal;
    text-align: left;
    padding-left: 20px;
}

/* 오른쪽 내용 */
.member-info td {
    height: 50px;
    border-bottom: 1px solid #ddd;
    font-size: 13px;
    padding-left: 20px;
}

/* 버튼 영역 */
.button-area {
    margin-top: 25px;
    text-align: center;
}

/* 버튼 공통 */
.btn {
    display: inline-block;
    width: 180px;
    padding: 10px 20px;
    margin: 0 3px;
    font-size: 12px;
    text-decoration: none;
    text-align: center;
    cursor: pointer;
}

/* 회원정보 수정 - 파란색 */
.btn-update {
    background-color: #1877F2;
    color: white;
    border: 1px solid #1877F2;
}

.btn-update:hover {
    background-color: #1468D5;
}

/* 회원 탈퇴 - 흰색 + 파란 */
.btn-delete {
    background-color: white;
    color: #1877F2;
    border: 1px solid #1877F2;
}

.btn-delete:hover {
    background-color: #F5FBFF;
}

</style>

</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container">

    <!-- 제목 -->
    <div class="title">
        회원정보
    </div>

    <!-- 회원정보 -->
    <table class="member-info">
        <tr>
            <th>아이디</th>
            <td>${view.m_id}</td>
        </tr>

        <tr>
            <th>이름</th>
            <td>${view.m_name}</td>
        </tr>

        <tr>
            <th>이메일</th>
            <td>${view.m_email}</td>
        </tr>

        <tr>
            <th>우편번호</th>
            <td>${view.m_zipno}</td>
        </tr>

        <tr>
            <th>주소</th>
            <td>${view.m_addr}</td>
        </tr>

        <tr>
            <th>전화번호</th>
            <td>${view.m_tel}</td>
        </tr>
    </table>

    <!-- 버튼 -->
    <div class="button-area">

        <a href="/member/passwordCheckForm?mode=update"
           class="btn btn-update">
            회원정보 수정
        </a>
        <a href="/member/passwordCheckForm?mode=delete"
           class="btn btn-delete">
            회원 탈퇴
        </a>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>