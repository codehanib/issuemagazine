<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 수정</title>
<!-- 리뷰 CSS 연결 -->
<link rel="stylesheet" href="/css/review.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="notice-detail-wrapper">
    <div class="review-header">
        <h2 class="notice-detail-title">문의 수정</h2>
    </div>

    <form name="one_inquiry" method="post" action="/one_inquiry/update">
        <sec:csrfInput/>
        <input type="hidden" name="oi_no" value="${dto.oi_no}">

        <!-- 제목 선택 (Select Box) -->
        <div class="notice-form-group">
            <label class="notice-form-label">제목</label>
            <select name="oi_title" class="notice-form-input" required>
                <option value="주소지변경/회원정보수정 신청" ${dto.oi_title == '주소지변경/회원정보수정 신청' ? 'selected' : ''}>주소지변경/회원정보수정 신청</option>
                <option value="사은품/부록 문의" ${dto.oi_title == '사은품/부록 문의' ? 'selected' : ''}>사은품/부록 문의</option>
                <option value="배송 문의" ${dto.oi_title == '배송 문의' ? 'selected' : ''}>배송 문의</option>
                <option value="결제관계 문의" ${dto.oi_title == '결제관계 문의' ? 'selected' : ''}>결제관계 문의</option>
                <option value="잡지내용 문의" ${dto.oi_title == '잡지내용 문의' ? 'selected' : ''}>잡지내용 문의</option>
                <option value="견적의뢰 및 일괄구독 문의" ${dto.oi_title == '견적의뢰 및 일괄구독 문의' ? 'selected' : ''}>견적의뢰 및 일괄구독 문의</option>
                <option value="영수증/계산서/기타서류 발행요청" ${dto.oi_title == '영수증/계산서/기타서류 발행요청' ? 'selected' : ''}>영수증/계산서/기타서류 발행요청</option>
                <option value="정기구독/재구독 문의" ${dto.oi_title == '정기구독/재구독 문의' ? 'selected' : ''}>정기구독/재구독 문의</option>
                <option value="입점/제휴 문의" ${dto.oi_title == '입점/제휴 문의' ? 'selected' : ''}>입점/제휴 문의</option>
                <option value="기타 문의" ${dto.oi_title == '기타 문의' ? 'selected' : ''}>기타 문의</option>
            </select>
        </div>

        <!-- 내용 입력 -->
        <div class="notice-form-group">
            <label class="notice-form-label">내용</label>
            <textarea name="oi_content" class="notice-form-textarea" placeholder="내용을 입력해주세요." required>${dto.oi_content}</textarea>
        </div>

        <!-- 하단 버튼 영역 -->
        <div class="notice-write-buttons">
            <a href="javascript:history.back()" class="btn-cancel">취소</a>
            <button type="submit" class="btn-submit">수정</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>