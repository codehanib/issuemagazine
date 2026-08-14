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
<title>후기목록</title>
<style>
    .review-table { width: 100%; border-collapse: collapse; }
    .review-table th { text-align: left; padding: 10px 8px; border-bottom: 2px solid #333; }
    .review-title-row td { padding: 10px 8px; border-bottom: 1px solid #eee; vertical-align: middle; }
    .review-preview-row td { padding: 0 8px 14px 8px; color: #666; font-size: 14px; }
    .edit-link { float: right; font-size: 13px; }

    /* 평점 별 스타일 */
    .star-display {
        font-size: 16px;
        letter-spacing: 1px;
        white-space: nowrap;
    }
    .star-display span {
        color: #ddd; /* 빈 별 */
    }
    .star-display span.filled {
        color: #f5a623; /* 채워진 별 */
    }
    .rating-col {
        width: 110px;
        text-align: right;
    }

    /* 하단 페이징 스타일 */
    .pagination {
        margin-top: 20px;
        text-align: center;
    }
    .pagination a {
        margin: 0 4px;
        text-decoration: none;
        color: #333;
    }
    .pagination .active {
        font-weight: bold;
        color: red;
    }
</style>
</head>
<body>
    <div class="list-wrapper">
        <h3>후기 목록</h3>

        <table class="review-table">
            <thead>
                <tr>
                    <th style="width:60px;">번호</th>
                    <th>제목</th>
                    <th style="width:100px;">작성자</th>
                    <th style="width:110px;">작성일</th>
                    <th class="rating-col">평점</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="review" items="${list}">

                    <%-- r_content 안에 "내용 (평점: N)" 형태로 들어있는 걸 분리 --%>
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

                    <tr class="review-title-row">
                        <td>${review.r_no}</td>
                        <td>${review.r_title}</td>
                        <td>${fn:substring(review.m_id, 0, 2)}****</td>
                        <td><fmt:formatDate value="${review.r_reg_date}" pattern="yyyy-MM-dd"/></td>
                        <td class="rating-col">
                            <span class="star-display">
                                <c:forEach begin="1" end="5" var="i">
                                    <c:choose>
                                        <c:when test="${i <= rating}"><span class="filled">★</span></c:when>
                                        <c:otherwise><span>★</span></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </span>
                        </td>
                    </tr>
                    <tr class="review-preview-row">
                        <td colspan="5">
                            ${contentOnly}
                            <sec:authorize access="hasRole('ADMIN')">
                                <span style="color:#999; font-size:12px;">
                                    &nbsp;(회원번호: ${review.m_no}, 상품번호: ${review.p_no})
                                </span>
                            </sec:authorize>
                            <c:if test="${loginNo == review.m_no}">
                                <span class="edit-link">
                                    <a href="/review/updateForm?r_no=${review.r_no}">게시글 수정하기</a>
                                    &nbsp;|&nbsp;
                                    <a href="/review/deleteForm?r_no=${review.r_no}">삭제</a>
                                </span>
                            </c:if>
                        </td>
                    </tr>

                </c:forEach>
                <c:if test="${empty list}">
                    <tr>
                        <td colspan="5" style="text-align: center; padding: 20px 0;">등록된 후기가 없습니다.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <!-- 하단 페이징 영역 -->
        <div class="pagination">
            <c:if test="${prev}">
                <a href="/review/list?page=${startPage - 1}${p_no != null ? '&p_no='.concat(p_no) : ''}">[이전]</a>
            </c:if>

            <c:forEach var="num" begin="${startPage}" end="${endPage}">
                <c:choose>
                    <c:when test="${num == page}">
                        <span class="active">[${num}]</span>
                    </c:when>
                    <c:otherwise>
                        <a href="/review/list?page=${num}${p_no != null ? '&p_no='.concat(p_no) : ''}">[${num}]</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${next}">
                <a href="/review/list?page=${endPage + 1}${p_no != null ? '&p_no='.concat(p_no) : ''}">[다음]</a>
            </c:if>
        </div>
    </div>
</body>
</html>