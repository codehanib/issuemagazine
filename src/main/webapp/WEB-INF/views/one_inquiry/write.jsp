<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 등록</title>
<%-- 공지사항 CSS 연결 --%>
<link rel="stylesheet" href="/css/notice_detail.css">
<style>
    /* notice_detail.css 기반 폼 전용 스타일 추가 */
    .notice-form-group {
        margin-bottom: 24px;
        text-align: left;
    }
    .notice-form-label {
        display: block;
        font-size: 14px;
        font-weight: 600;
        color: #333333;
        margin-bottom: 8px;
    }
    .notice-form-select,
    .notice-form-textarea {
        width: 100%;
        padding: 12px 16px;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        font-size: 15px;
        color: #222222;
        background-color: #ffffff;
        box-sizing: border-box;
        transition: border-color 0.2s, box-shadow 0.2s;
    }
    .notice-form-select {
        height: 48px;
        cursor: pointer;
    }
    .notice-form-select:focus,
    .notice-form-textarea:focus {
        border-color: #0874df;
        outline: none;
        box-shadow: 0 0 0 3px rgba(8, 116, 223, 0.1);
    }
    .notice-form-textarea {
        resize: vertical;
        line-height: 1.6;
    }
    .notice-write-buttons {
        display: flex;
        justify-content: flex-end;
        gap: 12px;
        margin-top: 30px;
    }
    .notice-write-buttons button,
    .notice-write-buttons a {
        display: inline-flex;
        justify-content: center;
        align-items: center;
        height: 44px;
        padding: 0 24px;
        border: 1px solid #cccccc;
        border-radius: 6px;
        background-color: #ffffff;
        color: #555555;
        font-size: 14px;
        font-weight: 600;
        text-decoration: none;
        cursor: pointer;
        transition: 0.2s;
    }
    .notice-write-buttons button[type="submit"] {
        border-color: #0874df;
        background-color: #0874df;
        color: #ffffff;
    }
    .notice-write-buttons button[type="submit"]:hover {
        background-color: #0562c4;
    }
    .notice-write-buttons a:hover {
        border-color: #0874df;
        color: #0874df;
    }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="notice-detail-wrapper">
    <h2 class="notice-detail-title">1:1 문의 등록</h2>

    <form name="one_inquiry" method="post" action="/one_inquiry/write">
        <%-- CSRF 토큰 --%>
        <sec:csrfInput/>

        <div class="notice-form-group">
            <label class="notice-form-label">문의 유형</label>
            <select name="oi_title" class="notice-form-select" required>
                <option value="주소지변경/회원정보수정 신청">주소지변경/회원정보수정 신청</option>
                <option value="사은품/부록 문의">사은품/부록 문의</option>
                <option value="배송 문의">배송 문의</option>
                <option value="결제관계 문의">결제관계 문의</option>
                <option value="잡지내용 문의">잡지내용 문의</option>
                <option value="견적의뢰 및 일괄구독 문의">견적의뢰 및 일괄구독 문의</option>
                <option value="영수증/계산서/기타서류 발행요청">영수증/계산서/기타서류 발행요청</option>
                <option value="정기구독/재구독 문의">정기구독/재구독 문의</option>
                <option value="입점/제휴 문의">입점/제휴 문의</option>
                <option value="기타 문의">기타 문의</option>
            </select>
        </div>

        <div class="notice-form-group">
            <label class="notice-form-label">문의 내용</label>
            <textarea name="oi_content" class="notice-form-textarea" rows="7" placeholder="문의하실 내용을 상세히 적어주세요." required></textarea>
        </div>

        <%-- 상품 연동 파라미터 (전달받은 p_no가 있으면 우선 적용, 없으면 기본 2037 사용) --%>
        <input type="hidden" name="p_no" value="${param.p_no != null ? param.p_no : 2037}">

        <div class="notice-write-buttons">
            <a href="javascript:history.back()">취소</a>
            <button type="submit">등록하기</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>