<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>

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
    max-width: 1100px;
    margin: 40px auto;
}

/* 제목 */
.title {
    font-size: 18px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

/* 회원 테이블 */
.member-table {
    width: 100%;
    border-collapse: collapse;
    border-top: 1px solid #ddd;
}

/* 테이블 제목 */
.member-table th {
    height: 42px;
    font-size: 12px;
    font-weight: normal;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* 테이블 내용 */
.member-table td {
    height: 55px;
    font-size: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* 회원번호 */
.member-no {
    color: #777;
}

/* ID */
.member-id {
    text-align: left !important;
    padding-left: 20px;
    font-weight: bold;
}

/* 삭제 버튼 */
.delete-btn {
    width: 45px;
    height: 25px;
    border: 1px solid #bbb;
    background: white;
    font-size: 11px;
    cursor: pointer;
}

.delete-btn:hover {
    background-color: #f5f5f5;
}

/* 회원이 없을 때 */
.empty {
    height: 100px !important;
    color: #999;
}
</style>
</head>

<body>
<%@ include file="../header.jsp" %>
<div class="container">
    <div class="title">
        회원목록
    </div>
    <table class="member-table">
        <tr>
            <th style="width: 80px;">NO</th>
            <th style="width: 180px;">ID</th>
            <th style="width: 150px;">이름</th>
            <th style="width: 180px;">전화번호</th>
            <th>이메일</th>
            <th style="width: 80px;">삭제</th>
        </tr>
        <c:choose>
            <c:when test="${not empty memberList}">
                <c:forEach var="member" items="${memberList}">
                    <tr>
                        <td class="member-no">${member.m_no}</td>
                        <td class="member-id">${member.m_id}</td>
                        <td>${member.m_name}</td>
                        <td>${member.m_tel}</td>
                        <td>${member.m_email}</td>
                        <td>
                            <button type="button" class="delete-btn" onclick="location.href='/admin/memberDelete?m_no=${member.m_no}'">
                                삭제
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="6" class="empty">등록된 회원이 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>