<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 후기 목록</title>
<!-- 통합된 review.css 단 하나만 호출 -->
<link rel="stylesheet" href="/css/review.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="list-wrapper">
    <div class="review-header">
        <h3 class="notice-detail-title">상품 사용 후기 (${totalCount != null ? totalCount : fn:length(list)})</h3>
        <c:if test="${p_no != null}">
            <a href="/review/writeForm?p_no=${p_no}" class="btn-write">사용후기 쓰기</a>
        </c:if>
    </div>

    <table class="review-table">
        <thead>
            <tr>
                <th style="width: 8%;">번호</th>
                <th style="width: 47%;">제목</th>
                <th style="width: 15%;">작성자</th>
                <th style="width: 15%;">작성일</th>
                <th style="width: 15%;" class="rating-col">평점</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="review" items="${list}">
                <c:set var="hasRating" value="${fn:contains(review.r_content, '(평점:')}" />

                <c:choose>
                    <c:when test="${hasRating}">
                        <c:set var="contentOnly" value="${fn:substringBefore(review.r_content, ' (평점:')}" />
                        <c:set var="ratingRaw" value="${fn:substringAfter(review.r_content, '(평점: ')}" />
                        <c:set var="rating" value="${fn:substringBefore(ratingRaw, ')')}" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="contentOnly" value="${review.r_content}" />
                        <c:set var="rating" value="0" />
                    </c:otherwise>
                </c:choose>

                <!-- 후기 제목 행 -->
                <tr class="review-title-row">
                    <td>${review.r_no}</td>
                    <td><strong>${review.r_title}</strong></td>
                    <td>${fn:substring(review.m_id, 0, 2)}****</td>
                    <td><fmt:formatDate value="${review.r_reg_date}" pattern="yyyy-MM-dd"/></td>
                    <td class="rating-col">
                        <span class="star-display">
                            <c:forEach begin="1" end="5" var="i">
                                <span class="${i <= rating ? 'filled' : ''}">★</span>
                            </c:forEach>
                        </span>
                    </td>
                </tr>

                <!-- 후기 내용 및 수정/삭제 버튼 행 -->
                <tr class="review-preview-row">
                    <td colspan="5">
                        <div class="review-content-body">
                            <span>${contentOnly}</span>
                            
                            <sec:authorize access="hasRole('ADMIN')">
                                <span style="color:#999; font-size:12px;">
                                    &nbsp;(회원번호: ${review.m_no}, 상품번호: ${review.p_no})
                                </span>
                            </sec:authorize>

                            <c:if test="${loginNo == review.m_no}">
                                <span class="edit-link">
                                    <a href="/review/updateForm?r_no=${review.r_no}">수정</a>
                                    <a href="/review/deleteForm?r_no=${review.r_no}">삭제</a>
                                </span>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty list}">
                <tr>
                    <td colspan="5" style="text-align: center; padding: 40px 0; color: #888;">
                        등록된 후기가 없습니다. 첫 번째 후기를 남겨보세요!
                    </td>
                </tr>
            </c:if>
        </tbody>
    </table>

    <!-- 페이징 영역 -->
    <div class="pagination">
        <c:if test="${prev}">
            <a href="/review/list?page=${startPage - 1}${p_no != null ? '&p_no='.concat(p_no) : ''}">이전</a>
        </c:if>

        <c:forEach var="num" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${num == page}">
                    <span class="active">${num}</span>
                </c:when>
                <c:otherwise>
                    <a href="/review/list?page=${num}${p_no != null ? '&p_no='.concat(p_no) : ''}">${num}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${next}">
            <a href="/review/list?page=${endPage + 1}${p_no != null ? '&p_no='.concat(p_no) : ''}">다음</a>
        </c:if>
    </div>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>