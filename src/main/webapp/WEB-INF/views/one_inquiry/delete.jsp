<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 삭제 확인</title>
</head>
<body>
    <div class="delete-check-wrapper">
        <h3>문의 삭제 확인</h3>
        <form method="post" action="/one_inquiry/delete">
        <p style="margin-bottom: 20px; font-size: 14px;">* 삭제하시겠습니까?</p>

            <div class="form-row">
                <label class="title">${dto.oi_title}</label>
                <input type= "hidden" name= "oi_no" value="${dto.oi_no}">
                <input type="submit" value="삭제하기" class="login-btn btn-submit" style="background-color: #dc3545; border: none; padding: 10px 20px; color: white; cursor: pointer; border-radius: 4px;">
                
            </div>
        </form>

        <c:if test="${not empty msg}">
            <p class="msg-error">${msg}</p>
        </c:if>
    </div>

</body>
</html>