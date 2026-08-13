<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
</head>
<body>
 <div>
    <h3>후기등록</h3>
    <form name="review" method="post" action="/review/write">
    <div class="form-row">
        <label class="title">제목</label>
        <div class="input-content"><input type="text" name="r_title"></div>
    </div>
    <div class="form-row">
        <label class="title">내용</label>
        <div class="input-content"><input type="text" name="r_content"></div>
    </div>
    <input type="hidden" name="p_no" value="2037">  
    <!-- p_no 처리할방법생각해야됨 일단 임시로 숫자지정해놓음 상품이랑 연관해야되서 지금은 처리안될거같음 -->
    <div class="form-row">
        <button type="submit">등록</button>
    </div>
</form>
 </div>
</body>
</html>
