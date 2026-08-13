<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의목록</title>
</head>
<body>
    <div class="list-wrapper">
        <h3>문의 목록</h3>

        <table class="member-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>답변</th>
                    <th>작성일</th>
                    <th>상태</th>
                    <th>멤버번호</th>
                    <th>작성자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="one_inquiry" items="${list}">
                    <tr>
                        <td>
                            <%-- 관리자는 비밀번호 확인 없이 바로 열람 --%>
                            <sec:authorize access="hasRole('ADMIN')">
                                <a href="/one_inquiry/view?oi_no=${one_inquiry.oi_no}">${one_inquiry.oi_no}</a>
                            </sec:authorize>
                            <%-- 일반 회원은 비밀번호 확인 절차를 거침 --%>
                            <sec:authorize access="!hasRole('ADMIN')">
                                <a href="/one_inquiry/passwordCheckForm?oi_no=${one_inquiry.oi_no}">${one_inquiry.oi_no}</a>
                            </sec:authorize>
                        </td>
                        <td>${one_inquiry.oi_title}</td>
                        <td>${one_inquiry.oi_content}</td>
                        <td>${one_inquiry.oi_answer}</td>
                        <td>${one_inquiry.oi_reg_date}</td>
                        <td>${one_inquiry.oi_status}</td>
                        <td>${one_inquiry.m_no}</td>
						<td>${fn:substring(one_inquiry.m_id, 0, 2)}****</td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
