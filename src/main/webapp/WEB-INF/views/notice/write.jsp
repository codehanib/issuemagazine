<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지작성</title>
</head>
<body>
 <div>
    <h3>공지등록</h3>
    <form name="review" method="post" action="/notice/write">
        <div class="input-content">
            <label class="title">제목</label>
            <div><input type="text" name="n_title"></div>
        </div>
        <div>
            <label class="title">내용</label>
            <div class="input-content"><input type="text" name="n_content"></div>
        </div>
        <input type="hidden" name="m_no" value="1001">
        <div class="input-content">
            <button type="submit">등록</button>
        </div>
    </form>
 </div>
</body>
</html>
