<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기수정</title>
</head>
<body>
 <div class="login-wrapper">
    <h3>후기수정</h3>
    <form name="one_inquiry" method="post" action="/one_inquiry/update">
        <input type="hidden" name="oi_no" value="${dto.oi_no}">

        <div class="form-row">
            <label class="title">제목</label>
            <div class="input-content"><input type="text" name="oi_title" value="${dto.oi_title}"></div>
        </div>

        <div class="form-row">
            <label class="title">내용</label>
            <div class="input-content"><input type="text" name="oi_content" value="${dto.oi_content}"></div>
        </div>

        <div class="form-row">
            <button type="submit">수정</button>
        </div>
    </form>
 </div>
</body>
</html>
