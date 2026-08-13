<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="/js/write.js"></script>
<link rel="stylesheet" href="/">

</head>
<body>
    <h3>회원가입</h3>
    
	<form action="/memberInsert" method="post" name="member">
		<table width="500">
			<tr>
				<td>아이디 </td>
				<td><input type="text" name="m_id" placeholder="ID"></td>
			</tr>
			<tr>
				<td>비밀번호 </td>
				<td><input type="password" name="m_passwd" placeholder="PASSWORD"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="m_passwd2"></td>
			</tr>
			<tr>
				<td>이름 </td>
				<td><input type="text" name="m_name"></td>
			</tr>
			<tr>
				<td>주소 </td>
				<td><input type="text" name="m_zipno" readonly> - <input type="button" onclick="goPopup();" value="우편번호"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" name="m_addr" readonly></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" name="m_addr2" readonly></td>
			</tr>
			<tr>
				<td>휴대전화 </td>
				<td>
				<select name="m_tel">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select>
					<input type="text" name="m_tel2" size="4" maxlength="4"> - 
					<input type="text" name="m_tel3" size="4" maxlength="4">
				</td>
			</tr>
			<tr>
				<td>이메일 </td>
				<td>
					<input type="text" name="m_email">@
					<select name="m_email2">
						<option value="">선택</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.com">daum.com</option>
						<option value="nate.com">nate.com</option>
					</select>
				</td>
			</tr>
		</table>
		<div>
		 	<input type="reset" value="✕ 취소">
		    <input type="submit" value="✓ 회원가입" onclick="return check()">
		</div>
	</form>
</body>

</html>