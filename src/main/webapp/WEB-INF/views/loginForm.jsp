<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/"></script>
<link rel="stylesheet" href="/">

<title>LOGIN</title>
</head>
<body>
	<form action="/j_spring_security_check" method="post" name="loginForm">
    <h3>LOGIN</h3>
		<table border="0" width="300">
			<tr>
				<td><input type="text" name="m_id"></td>
			</tr>
			<tr>
				<td><input type="password" name="m_passwd"></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인" onclick="return check()"><a href="/writeForm"><input type="button" value="회원가입"></a></td>
			</tr>
		</table>
	</form>
</body>
</html>