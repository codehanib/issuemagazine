<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/">
<title>메인</title>
</head>
<body>
<div class="container">
	    

    <!-- 비회원 -->
    <sec:authorize access="isAnonymous()">
            <p>환영합니다.</p>

        <div>
            <a href="/loginForm">
                <input type="button" value="로그인">
            </a>

            <a href="/writeForm">
                <input type="button" value="회원가입">
            </a>
        </div>

    </sec:authorize>


    <!-- 일반회원 -->
    <sec:authorize access="hasRole('USER')">
		<div>
   			<span>
        		<sec:authentication property="principal.username"/>
    		</span>님 환영합니다 😊
		</div>

        <div>
            <a href="/main">
            </a>

            <a href="/logout">
                <input type="button" value="로그아웃">
            </a>
            <br>
            <a href="/member/memberviewForm">
                <input type="button" value="회원정보">
            </a>
            <br>
            <a href="/member/mypage">
                <input type="button" value="마이페이지">
            </a>
        </div>

    </sec:authorize>


    <!-- 관리자 -->
    <sec:authorize access="hasRole('ADMIN')">

        <div>
        	관리자
        	<span>
       		 	<sec:authentication property="principal.username"/>
    		</span> 님 환영합니다.
        </div>

        <div >
            <a href="/admin/memberList">
                <input type="button" value="회원관리">
            </a>
            <a href="/logout">
                <input type="button" value="로그아웃">
            </a>
        </div>

    </sec:authorize>

</div>
</body>
</html>