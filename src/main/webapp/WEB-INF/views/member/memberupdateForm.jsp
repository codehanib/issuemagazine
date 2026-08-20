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

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    color: #222;
}

/* 전체 영역 */
.update-main {
    width: 100%;
    padding: 50px 0 70px;
}

/* 수정 박스 */
.update-box {
    width: 600px;
    margin: 0 auto;
}

/* 제목 영역 */
.update-title {
    text-align: center;
    margin-bottom: 20px;
}

.update-title h3 {
    margin: 0 0 10px;
    font-size: 25px;
    font-weight: 600;
}

/* 수정 폼 */
.update-form {
    width: 100%;
}

/* 테이블 */
.update-table {
    width: 100%;
    border-collapse: collapse;
    border-top: 1px solid #ddd;
}

/* 왼쪽 항목 */
.update-table td:first-child {
    width: 130px;
    height: 55px;
    padding-left: 20px;
    background: #fafafa;
    font-size: 14px;
    border-bottom: 1px solid #eee;
}

/* 오른쪽 내용 */
.update-table td:last-child {
    height: 55px;
    padding: 10px 15px;
    font-size: 14px;
    border-bottom: 1px solid #eee;
}

/* 입력창 */
.update-table input[type="text"],
.update-table input[type="password"] {
    height: 34px;
    padding: 0 10px;
    border: 1px solid #ddd;
    font-size: 14px;
    outline: none;
}

.update-table input[type="text"]:focus,
.update-table input[type="password"]:focus {
    border-color: #aaa;
}

/* 아이디 / 이름 */
.update-table td:last-child {
    color: #444;
}

/* 이메일 */
.update-table input[name="m_email"] {
    width: 170px;
}

.update-table select {
    height: 34px;
    padding: 0 8px;
    border: 1px solid #ddd;
    background: white;
    font-size: 14px;
}

/* 비밀번호 */
.update-table input[name="m_passwd"] {
    width: 250px;
}

/* 우편번호 */
.update-table input[name="m_zipno"] {
    width: 120px;
}

/* 주소 */
.update-table input[name="m_addr"] {
    width: 340px;
}

/* 상세주소 */
.update-table input[name="m_addr2"] {
    width: 300px;
}

/* 주소검색 버튼 */
.update-table input[type="button"] {
    height: 34px;
    padding: 0 15px;
    margin-left: 5px;
    border: 1px solid #1877F2;
    color: #1877F2;
   	background-color: white;
    font-size: 14px;
    cursor: pointer;
}

.update-table input[type="button"]:hover {
    background: #F5FBFF;
}

/* 전화번호 */
.update-table input[name="m_tel"] {
    width: 70px;
}

.update-table input[name="m_tel2"],
.update-table input[name="m_tel3"] {
    width: 80px;
}

/* 버튼 영역 */
.update-buttons {
    display: flex;
    justify-content: center;
    gap: 8px;
    margin-top: 25px;
}

/* 수정 / 취소 버튼 */
.update-buttons input {
    width: 110px;
    height: 38px;
    border: 1px solid #bbb;
    background: white;
    font-size: 14px;
    cursor: pointer;
}

/* 수정취소 hover */
.update-buttons input:first-child:hover {
    background: #F5FBFF;
    border-color: #1877F2;
    color: #1877F2;
}

.update-blue{
	background-color: #1877F2 !important;
    color: white !important;
    border: 1px solid #1877F2 !important;
}
.update-blue:hover {
    background-color: #155ed4 !important;
    border-color: #155ed4 !important;
    color: white !important;
}

</style>

</head>

<body>

<%@ include file="../header.jsp" %>

<main class="update-main">

    <div class="update-box">

        <div class="update-title">
            <h3>회원정보수정</h3>
        </div>

        <form action="/member/update"
              method="post"
              name="member"
              class="update-form">

            <input type="hidden"
                   name="m_id"
                   value="${updateForm.m_id}">

            <table class="update-table">

                <tr>
                    <td>아이디</td>
                    <td>${updateForm.m_id}</td>
                </tr>

                <tr>
                    <td>비밀번호</td>
                    <td>
                        <input type="password"
                               name="m_passwd">
                    </td>
                </tr>

                <tr>
                    <td>이름</td>
                    <td>${updateForm.m_name}</td>
                </tr>

                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="text"
                               name="m_email"
                               value="${fn:split(updateForm.m_email,'@')[0]}">@

                        <select name="m_email2">
                            <option value="">선택</option>

                            <option value="naver.com"
                                <c:if test="${fn:contains(updateForm.m_email,'naver.com')}">
                                    selected
                                </c:if>>
                                naver.com
                            </option>

                            <option value="gmail.com"
                                <c:if test="${fn:contains(updateForm.m_email,'gmail.com')}">
                                    selected
                                </c:if>>
                                gmail.com
                            </option>

                            <option value="daum.com"
                                <c:if test="${fn:contains(updateForm.m_email,'daum.com')}">
                                    selected
                                </c:if>>
                                daum.com
                            </option>

                            <option value="nate.com"
                                <c:if test="${fn:contains(updateForm.m_email,'nate.com')}">
                                    selected
                                </c:if>>
                                nate.com
                            </option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>우편번호</td>
                    <td>
                        <input type="text"
                               name="m_zipno"
                               readonly
                               value="${updateForm.m_zipno}">
                    </td>
                </tr>

                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text"
                               name="m_addr"
                               readonly
                               value="${fn:split(updateForm.m_addr,',')[0]}">

                        <input type="button"
                               value="주소검색"
                               onclick="goPopup()">
                    </td>
                </tr>

                <tr>
                    <td>상세주소</td>
                    <td>
                        <input type="text"
                               name="m_addr2"
                               readonly
                               value="${fn:split(updateForm.m_addr,',')[1]}">
                    </td>
                </tr>

                <tr>
                    <td>전화번호</td>
                    <td>
                        <input type="text"
                               name="m_tel"
                               size="3"
                               maxlength="3"
                               value="${fn:split(updateForm.m_tel,'-')[0]}">
                        -
                        <input type="text"
                               name="m_tel2"
                               size="4"
                               maxlength="4"
                               value="${fn:split(updateForm.m_tel,'-')[1]}">
                        -
                        <input type="text"
                               name="m_tel3"
                               size="4"
                               maxlength="4"
                               value="${fn:split(updateForm.m_tel,'-')[2]}">
                    </td>
                </tr>

            </table>

            <div class="update-buttons">
                <input type="reset"
                       value="수정취소">
			
                <input type="submit" value="수정하기" onclick="return check()" class="update-blue">
            </div>

        </form>

    </div>

</main>

<%@ include file="../footer.jsp" %>

</body>
</html>