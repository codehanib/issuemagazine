<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기수정</title>
<style>
    .star-rating {
        font-size: 28px;
        letter-spacing: 4px;
        cursor: pointer;
        user-select: none;
    }
    .star-rating span {
        color: #ddd;
    }
    .star-rating span.filled {
        color: #f5a623;
    }
    .rating-text {
        margin-left: 8px;
        font-size: 14px;
        color: #666;
        vertical-align: middle;
    }
</style>
</head>
<body>

<%--
    기존 r_content 는 "내용 (평점: N)" 형태로 저장돼 있으므로,
    수정 폼을 열 때 내용과 평점을 다시 분리해서 각각 채워줌
--%>
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

 <div class="login-wrapper">
    <h3>후기수정</h3>
    <form name="reviewForm" method="post" action="/review/update" onsubmit="return combineContent();">
        <input type="hidden" name="r_no" value="${dto.r_no}">
        <input type="hidden" name="p_no" value="${dto.p_no}">

        <div class="form-row">
            <label class="title">제목</label>
            <div class="input-content">
                <input type="text" name="r_title" value="${dto.r_title}" required>
            </div>
        </div>

        <div class="form-row">
            <label class="title">평점</label>
            <div class="input-content">
                <span class="star-rating" id="starRating">
                    <span data-value="1">★</span><span data-value="2">★</span><span data-value="3">★</span><span data-value="4">★</span><span data-value="5">★</span>
                </span>
                <span class="rating-text" id="ratingText"></span>
            </div>
        </div>

        <div class="form-row">
            <label class="title">내용</label>
            <div class="input-content">
                <textarea id="r_content_text" rows="6" cols="50" required>${contentOnly}</textarea>
            </div>
        </div>

        <input type="hidden" name="r_content" id="r_content_hidden">

        <div class="form-row">
            <button type="submit">수정</button>
        </div>
    </form>
 </div>

<script>
// 서버에서 미리 파싱해준 기존 평점으로 초기화
var selectedRating = ${initialRating};

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
        selectedRating = parseInt(star.getAttribute('data-value'));
        paintStars(selectedRating);
        refreshRatingText();
    });
    star.addEventListener('mouseover', function () {
        paintStars(parseInt(star.getAttribute('data-value')));
    });
});

document.getElementById('starRating').addEventListener('mouseleave', function () {
    paintStars(selectedRating);
});

// 페이지 로드 시 기존 평점으로 별 채워두기
paintStars(selectedRating);
refreshRatingText();

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

</body>
</html>
