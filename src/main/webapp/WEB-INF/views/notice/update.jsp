<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지수정</title>
</head>
<body>
 <div class="login-wrapper">
    <h3>공지수정</h3>
    <form name="notice" method="post" action="/notice/update">
	<input type="hidden" name="n_no" value="${dto.n_no}">
        <div class="form-row">
            <label class="title">제목</label>
            <div class="input-content"><input type="text" name="n_title" value="${dto.n_title}"></div>
        </div>

        <div class="form-row">
            <label class="title">내용</label>
            <div class="input-content"><input type="text" name="n_content" value="${dto.n_content}"></div>
        </div>

        <div class="form-row">
            <button type="submit">수정</button>
        </div>
    </form>
 </div>
</body>
</html>
