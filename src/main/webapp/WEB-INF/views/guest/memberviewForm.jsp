<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세정보</title>
<link rel="stylesheet" href="/">
</head>
<body>
        <h3>회원정보</h3>

        <a href="/">HOME</a> / 
        <a href="/logout">LOGOUT</a>


	<table width="400" border="1">
			<tr>
				<td>아이디 </td>
				<td>${view.m_id}</td>
			</tr>
			<tr>
				<td>이름 </td>
				<td>${view.m_name}</td>
			</tr>
			<tr>
				<td>이메일 </td>
				<td>${view.m_email}</td>
			</tr>
			<tr>
				<td>우편번호 </td>
				<td>${view.m_zipno}</td>
			</tr>
			<tr>
				<td>주소 </td>
				<td>${view.m_addr}</td>
			</tr>
			<tr>
				<td>전화번호 </td>
				<td>${view.m_tel}</td>
			</tr>
		</table>
		
		<a href="/member/passwordCheckForm?mode=update">회원정보 수정</a> / 
		<a href="/member/passwordCheckForm?mode=delete">회원 탈퇴</a>
		
	</div>
</body>

</html>