<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 - 관리자</title>
<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    color: #222;
    background-color: #fff;
}

/* 컨테이너 */
.update-container {
    width: 90%;
    max-width: 900px;
    margin: 40px auto 80px;
}

/* 페이지 제목 */
.update-title {
    position: relative;
    width: 100%;
    padding-bottom: 12px;
    margin-bottom: 30px;
    border-bottom: 1px solid #ddd;
    color: #222;
    font-size: 28px;
    font-weight: 600;
}

.update-title::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -1px;
    width: 115px;
    height: 2px;
    background-color: #222222;
}

/* 폼 카드 스타일 */
.form-card {
    background: #fff;
    border: 1px solid #e5e9ee;
    border-radius: 14px;
    padding: 35px 40px;
    box-shadow: 0 5px 18px rgba(8, 116, 223, 0.04);
}

.form-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px 24px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

.form-group.full-width {
    grid-column: span 2;
}

.form-group label {
    font-size: 14px;
    font-weight: 600;
    color: #444;
    margin-bottom: 8px;
}

.form-group label span {
    color: #0874df;
}

.form-group input,
.form-group select {
    width: 100%;
    height: 46px;
    padding: 0 14px;
    font-size: 14px;
    border: 1px solid #dcecff;
    border-radius: 8px;
    background-color: #f7fbff;
    outline: none;
    transition: all 0.2s ease;
}

.form-group input:focus,
.form-group select:focus {
    border-color: #0874df;
    background-color: #fff;
    box-shadow: 0 0 0 3px rgba(8, 116, 223, 0.12);
}

/* 버튼 영역 */
.btn-group {
    display: flex;
    justify-content: flex-end;
    gap: 12px;
    margin-top: 35px;
    padding-top: 20px;
    border-top: 1px solid #f0f4f8;
}

.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    height: 48px;
    padding: 0 28px;
    font-size: 15px;
    font-weight: 600;
    border-radius: 8px;
    cursor: pointer;
    text-decoration: none;
    transition: all 0.2s ease;
}

.btn-submit {
    background-color: #0874df;
    color: #fff;
    border: none;
}

.btn-submit:hover {
    background-color: #005bb5;
}

.btn-cancel {
    background-color: #fff;
    color: #666;
    border: 1px solid #dcecff;
}

.btn-cancel:hover {
    background-color: #f7fbff;
    color: #222;
}

@media (max-width: 700px) {
    .update-container {
        width: 94%;
    }
    .form-grid {
        grid-template-columns: 1fr;
    }
    .form-group.full-width {
        grid-column: span 1;
    }
    .form-card {
        padding: 25px 20px;
    }
}
</style>
</head>
<body>

<jsp:include page="../header.jsp"/>

<div class="update-container">

    <div class="update-title">
        상품 수정
    </div>

    <div class="form-card">
        <form action="/product/update" method="post">
            
            <!-- 수정 기준이 되는 상품 PK 번호 전달 -->
            <input type="hidden" name="p_no" value="${product.p_no}">

            <div class="form-grid">
                
                <!-- 카테고리 -->
                <div class="form-group">
                    <label>카테고리 번호 <span>*</span></label>
                    <input type="number" name="c_no" value="${product.c_no}" placeholder="예: 10" required>
                </div>

                <!-- 상품 코드 -->
                <div class="form-group">
                    <label>상품 코드</label>
                    <input type="text" name="p_code" value="${product.p_code}" placeholder="예: PROD-202601">
                </div>

                <!-- 상품명 -->
                <div class="form-group full-width">
                    <label>상품명 <span>*</span></label>
                    <input type="text" name="p_name" value="${product.p_name}" placeholder="상품 이름을 입력하세요" required>
                </div>

                <!-- 정가 -->
                <div class="form-group">
                    <label>정가 (원) <span>*</span></label>
                    <input type="number" name="p_price" value="${product.p_price}" placeholder="예: 25000" required>
                </div>

                <!-- 할인가 -->
                <div class="form-group">
                    <label>할인가 (원) <span>*</span></label>
                    <input type="number" name="p_price2" value="${product.p_price2}" placeholder="예: 22500" required>
                </div>

                <!-- 출판사 / 제조사 -->
                <div class="form-group">
                    <label>출판사 / 제조사</label>
                    <input type="text" name="p_publisher" value="${product.p_publisher}" placeholder="출판사 또는 제조사 입력">
                </div>

                <!-- 원산지 -->
                <div class="form-group">
                    <label>제조국 / 원산지</label>
                    <input type="text" name="p_country" value="${product.p_country}" placeholder="예: 대한민국">
                </div>

                <!-- 이미지 경로 -->
                <div class="form-group full-width">
                    <label>상품 이미지 파일명/경로</label>
                    <input type="text" name="p_image" value="${product.p_image}" placeholder="예: /images/product/sample.jpg">
                </div>
                
                <div class="form-group full-width">
                	<label>상품 상세 설명</label>
                	<input type="text" name="p_desc" placeholder="예: 이 달의 표지">
                </div>

            </div>

            <div class="btn-group">
                <a href="/admin/productList" class="btn btn-cancel">취소</a>
                <button type="submit" class="btn btn-submit">상품 수정 완료</button>
            </div>
        </form>
    </div>

</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>