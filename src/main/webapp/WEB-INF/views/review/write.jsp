<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기작성</title>
<link rel="stylesheet" href="/css/review_writeForm.css">
<style>
    .star-rating {
        font-size: 28px;
        letter-spacing: 4px;
        cursor: pointer;
        user-select: none;
    }
    .star-rating span {
        color: #ddd; /* 기본은 빈 별 */
    }
    .star-rating span.filled {
        color: #f5a623; /* 선택된 별 */
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
<%@ include file="../header.jsp" %>
 <div class="review-form">
    <h3 class="review-main-title">후기 등록</h3>
    <form name="reviewForm" method="post" action="/review/write" onsubmit="return combineContent();">
        <input type="hidden" name="p_no" value="${p_no}">

        <div class="form-row">
            <label class="title">제목</label>
            <input type="text" name="r_title" required>
        </div>

        <div class="form-row">
            <label class="title">평점</label>
            <div class="rating-box">
                <span class="star-rating" id="starRating">
                    <span data-value="1">★</span><span data-value="2">★</span><span data-value="3">★</span><span data-value="4">★</span><span data-value="5">★</span>
                </span>
                <span class="rating-text" id="ratingText">평점을 선택해주세요</span>
            </div>
        </div>

        <div class="form-row">
            <label class="title">내용</label>
            <textarea id="r_content_text" rows="7" required></textarea>
        </div>

        <input type="hidden" name="r_content" id="r_content_hidden">

        <div class="button-row">
            <input type="submit" value="등록">
        </div>
    </form>
</div>

<script>
var selectedRating = 0;
var stars = document.querySelectorAll('#starRating span');
var ratingText = document.getElementById('ratingText');

stars.forEach(function (star) {
    // 클릭하면 그 별점으로 확정
    star.addEventListener('click', function () {
        selectedRating = parseInt(star.getAttribute('data-value'));
        paintStars(selectedRating);
        ratingText.textContent = selectedRating + '점';
    });

    // 마우스 올리면 미리보기
    star.addEventListener('mouseover', function () {
        paintStars(parseInt(star.getAttribute('data-value')));
    });
});

// 별점 영역에서 마우스 벗어나면 실제 선택값으로 되돌림
document.getElementById('starRating').addEventListener('mouseleave', function () {
    paintStars(selectedRating);
});

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

function combineContent() {
    var content = document.getElementById('r_content_text').value.trim();

    if (selectedRating === 0) {
        alert('평점을 선택해주세요.');
        return false; // 제출 막음
    }
    if (!content) {
        alert('내용을 입력해주세요.');
        return false;
    }

    // 예: "가끔 사서 보다가 처음 이용해봅니다. (평점: 5)"
    document.getElementById('r_content_hidden').value = content + ' (평점: ' + selectedRating + ')';
    return true; // 제출 진행
}
</script>
<%@ include file="../footer.jsp" %>
</body>
</html>
