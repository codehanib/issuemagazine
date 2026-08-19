<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<link rel="stylesheet" href="/css/review.css">
</head>
<script>
var selectedRating = 0;
var stars = document.querySelectorAll('#starRating span');
var ratingText = document.getElementById('ratingText');

stars.forEach(function (star) {
    // 마우스 올렸을 때
    star.addEventListener('mouseover', function () {
        var hoverVal = parseInt(this.getAttribute('data-value'));
        paintStars(hoverVal);
    });

    // 클릭했을 때 (평점 확정)
    star.addEventListener('click', function () {
        selectedRating = parseInt(this.getAttribute('data-value'));
        paintStars(selectedRating);
        ratingText.textContent = selectedRating + '점';
    });
});

// 마우스가 별 영역 전체를 벗어났을 때 (선택된 평점으로 복원)
document.getElementById('starRating').addEventListener('mouseleave', function () {
    paintStars(selectedRating);
});

// 별 색상 칠하는 함수
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
<body>
<%@ include file="../header.jsp" %>

<div class="notice-detail-wrapper">
    <h2 class="notice-detail-title">후기 작성</h2>

    <form name="reviewForm" method="post" action="/review/write" onsubmit="return combineContent();">
        <sec:csrfInput/>
        
        <input type="hidden" name="p_no" value="${p_no}">

        <div class="notice-form-group">
            <label class="notice-form-label">제목</label>
            <input type="text" name="r_title" class="notice-form-input" placeholder="제목을 입력해주세요." required>
        </div>

        <div class="notice-form-group">
            <label class="notice-form-label">평점</label>
            <div class="notice-rating-box">
                <span class="star-rating" id="starRating">
                    <span data-value="1">★</span><span data-value="2">★</span><span data-value="3">★</span><span data-value="4">★</span><span data-value="5">★</span>
                </span>
                <span class="rating-text" id="ratingText">평점을 선택해주세요</span>
            </div>
        </div>

        <div class="notice-form-group">
            <label class="notice-form-label">내용</label>
            <textarea id="r_content_text" class="notice-form-textarea" rows="7" placeholder="솔직한 후기를 남겨주세요." required></textarea>
        </div>

        <input type="hidden" name="r_content" id="r_content_hidden">

        <!-- 버튼 영역 클래스 세분화 -->
        <div class="notice-write-buttons">
            <a href="/product/detail?p_no=${p_no}#product-review" class="btn-cancel">취소</a>
            <button type="submit" class="btn-submit">등록하기</button>
        </div>
    </form>
</div>

<script>
var selectedRating = 0;
var stars = document.querySelectorAll('#starRating span');
var ratingText = document.getElementById('ratingText');

stars.forEach(function (star) {
    star.addEventListener('click', function () {
        selectedRating = parseInt(star.getAttribute('data-value'));
        paintStars(selectedRating);
        ratingText.textContent = selectedRating + '점';
    });

    star.addEventListener('mouseover', function () {
        paintStars(parseInt(star.getAttribute('data-value')));
    });
});

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