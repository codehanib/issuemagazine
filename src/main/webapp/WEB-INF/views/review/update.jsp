<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 수정</title>
<link rel="stylesheet" href="/css/review.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<c:set var="hasRating" value="${fn:contains(dto.r_content, '(평점:')}" />
<c:choose>
    <c:when test="${hasRating}">
        <c:set var="contentOnly" value="${fn:substringBefore(dto.r_content, ' (평점:')}" />
        <c:set var="ratingRaw" value="${fn:substringAfter(dto.r_content, '(평점: ')}" />
        <c:set var="initialRating" value="${fn:substringBefore(ratingRaw, ')')}" />
    </c:when>
    <c:otherwise>
        <c:set var="contentOnly" value="${dto.r_content}" />
        <c:set var="initialRating" value="0" />
    </c:otherwise>
</c:choose>

<div class="notice-detail-wrapper">
    <h2 class="notice-detail-title">후기 수정</h2>

    <form name="reviewForm" method="post" action="/review/update" onsubmit="return combineContent();">
        <sec:csrfInput/>
        
        <input type="hidden" name="r_no" value="${dto.r_no}">
        <input type="hidden" name="p_no" value="${dto.p_no}">

        <div class="notice-form-group">
            <label class="notice-form-label">제목</label>
            <input type="text" name="r_title" class="notice-form-input" value="${dto.r_title}" required>
        </div>

        <div class="notice-form-group">
            <label class="notice-form-label">평점</label>
            <div class="notice-rating-box">
                <span class="star-rating" id="starRating">
                    <span data-value="1">★</span><span data-value="2">★</span><span data-value="3">★</span><span data-value="4">★</span><span data-value="5">★</span>
                </span>
                <span class="rating-text" id="ratingText"></span>
            </div>
        </div>

        <div class="notice-form-group">
            <label class="notice-form-label">내용</label>
            <textarea id="r_content_text" class="notice-form-textarea" rows="7" required>${contentOnly}</textarea>
        </div>

        <input type="hidden" name="r_content" id="r_content_hidden">

        <!-- 버튼 영역 클래스 지정 -->
        <div class="notice-write-buttons">
            <a href="/product/detail?p_no=${dto.p_no}#product-review" class="btn-cancel">취소</a>
            <button type="submit" class="btn-submit">수정완료</button>
        </div>
    </form>
</div>

<script>
var selectedRating = parseInt("${initialRating}") || 0;
var stars = document.querySelectorAll('#starRating span');
var ratingText = document.getElementById('ratingText');

function paintStars(value) {
    stars.forEach(function (star) {
        var starValue = parseInt(star.getAttribute('data-value'));
        if (starValue <= value) {
            star.classList.add('filled');
        } else {
            star.classList.remove('filled');
        }
    });
}

function refreshRatingText() {
    ratingText.textContent = selectedRating > 0 ? (selectedRating + '점') : '평점을 선택해주세요';
}

stars.forEach(function (star) {
    star.addEventListener('click', function () {
        selectedRating = parseInt(this.getAttribute('data-value'));
        paintStars(selectedRating);
        refreshRatingText();
    });
    
    star.addEventListener('mouseover', function () {
        paintStars(parseInt(this.getAttribute('data-value')));
    });
});

document.getElementById('starRating').addEventListener('mouseleave', function () {
    paintStars(selectedRating);
});

// 페이지 로드 시 기존 평점 즉시 반영
document.addEventListener("DOMContentLoaded", function() {
    paintStars(selectedRating);
    refreshRatingText();
});

function combineContent() {
    var content = document.getElementById('r_content_text').value.trim();

    if (selectedRating === 0) {
        alert('평점을 선택해주세요.');
        return false;
    }
    if (!content) {
        alert('내용을 입력해주세요.');
        return false;
    }

    document.getElementById('r_content_hidden').value = content + ' (평점: ' + selectedRating + ')';
    return true;
}
</script>

<%@ include file="../footer.jsp" %>
</body>
</html>