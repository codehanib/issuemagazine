<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지목록</title>
</head>
</head>
<body>
    <div class="list-wrapper">
        <h3>공지 목록</h3>
        <table class="member-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>멤버번호</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="notice" items="${list}">
                    <tr>
                        <td>${notice.n_no}</td>
                        <td><a href="/notice/view?n_no=${notice.n_no}">
            ${notice.n_title}</a></td>
                        <td>${notice.n_content}</td> <!-- 나중에 내용 지워야함 이유 : 상세보기에서 내용을 봐야함 -->
                        <td>${notice.n_reg_date}</td>
                        <td>${notice.n_count}</td>
                        <td>${notice.m_no}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>