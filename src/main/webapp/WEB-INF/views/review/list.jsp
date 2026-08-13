<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기목록</title>
</head>
<body>
    <div class="list-wrapper">
        <h3>후기 목록</h3>

        <table class="member-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>작성일</th>
                    <th>멤버번호</th>
                    <th>상품번호번호</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="review" items="${list}">
                    <tr>
                        <td>${review.r_no}</td>
                        <td>
                            ${review.r_title}
                            <c:if test="${loginNo == review.m_no}">
                                <a href="/review/updateForm?r_no=${review.r_no}">수정</a>
                                &nbsp;|&nbsp;
                                <a href="/review/deleteForm?r_no=${review.r_no}">삭제</a>
                            </c:if>
                        </td>
                        <td>${review.r_content}</td>
                        <td>${review.r_reg_date}</td>
                        <td>${review.m_no}</td>
                        <td>${review.p_no}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
