<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세보기</title>
<link rel="stylesheet" href="/css/review.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="notice-detail-wrapper">
    <div class="review-header">
        <h2 class="notice-detail-title">1:1 문의 상세보기</h2>
    </div>

    <table class="review-table">
        <colgroup>
            <col style="width: 15%;">
            <col style="width: 35%;">
            <col style="width: 15%;">
            <col style="width: 35%;">
        </colgroup>
        <tbody>
            <tr class="review-title-row">
                <th>제목</th>
                <td colspan="3" style="text-align: left; font-weight: 700; font-size: 16px; color: var(--text-primary);">
                    ${dto.oi_title}
                </td>
            </tr>
            <tr class="review-title-row">
                <th>작성자</th>
                <td style="text-align: left;">${dto.m_id}</td>
                <th>작성일</th>
<td style="text-align: left; font-weight: 700;">
    <fmt:formatDate value="${dto.oi_reg_date}" pattern="yyyy-MM-dd"/>
</td>
            </tr>
            <tr class="review-title-row">
                <th>문의번호</th>
                <td style="text-align: left;">${dto.oi_no}</td>
                <th>처리상태</th>
                <td style="text-align: left;">
                    <span style="font-weight: 700; color: ${dto.oi_status == '답변완료' ? 'var(--primary-color)' : 'var(--text-muted)'};">
                        ${dto.oi_status}
                    </span>
                </td>
            </tr>
            <tr class="review-preview-row">
                <td colspan="4" style="padding-top: 16px;">
                    <div class="review-content-body" style="min-height: 120px; align-items: flex-start; justify-content: flex-start;">
                        <pre style="white-space: pre-wrap; font-family: inherit; margin: 0; word-break: break-all;">${dto.oi_content}</pre>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>

    <div style="margin-top: 40px; padding-top: 24px; border-top: 1px solid var(--border-color);">
        <c:choose>
            <c:when test="${not empty dto.oi_answer}">
                <h3 style="font-size: 18px; font-weight: 700; margin-bottom: 16px; color: var(--text-primary);">답변 내용</h3>
                <div class="review-content-body" style="background-color: var(--primary-light); border-color: rgba(8, 116, 223, 0.15); min-height: 100px;">
                    <pre style="white-space: pre-wrap; font-family: inherit; margin: 0; color: #004b99; word-break: break-all;">${dto.oi_answer}</pre>
                </div>
            </c:when>

            <c:otherwise>
                <sec:authorize access="hasRole('ADMIN')">
                    <h3 style="font-size: 18px; font-weight: 700; margin-bottom: 16px; color: var(--text-primary);">답변 작성</h3>
                    <form action="/one_inquiry/answer" method="post">
                        <sec:csrfInput/>
                        <input type="hidden" name="oi_no" value="${dto.oi_no}">
                        <div class="notice-form-group">
                            <textarea name="oi_answer" class="notice-form-textarea" rows="6" placeholder="답변 내용을 입력하세요." required></textarea>
                        </div>
                        <div class="notice-write-buttons">
                            <button type="submit" class="btn-submit">답변 등록</button>
                        </div>
                    </form>
                </sec:authorize>
                
                <sec:authorize access="!hasRole('ADMIN')">
                    <div class="review-content-body" style="justify-content: center; color: var(--text-muted); padding: 24px;">
                        아직 답변이 등록되지 않았습니다.
                    </div>
                </sec:authorize>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="notice-write-buttons" style="margin-top: 40px; justify-content: space-between; align-items: center;">
        <div>
            <a href="/one_inquiry/list" class="btn-cancel">목록으로</a>
        </div>
        
        <div>
            <sec:authentication property="principal.username" var="loginId" />
            <c:if test="${loginId == dto.m_id}">
                <a href="/one_inquiry/updateForm?oi_no=${dto.oi_no}" class="btn-cancel" style="margin-right: 6px;">수정</a>
                <a href="/one_inquiry/deleteForm?oi_no=${dto.oi_no}" class="btn-cancel" style="color: #ff3b30; border-color: #ffc0bd;">삭제</a>
            </c:if>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>