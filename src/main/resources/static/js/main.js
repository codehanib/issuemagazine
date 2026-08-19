document.addEventListener("DOMContentLoaded", function() {

    const slides = document.querySelectorAll(".main-banner .slide");

    const prevButton = document.querySelector(".banner-prev");
    const nextButton = document.querySelector(".banner-next");

    let currentSlide = 0;


    /* =====================================
       슬라이드 보여주는 함수
    ===================================== */
    function showSlide(index) {

        slides[currentSlide].classList.remove("active");

        currentSlide = index;


        /* 마지막 다음이면 처음으로 */
        if (currentSlide >= slides.length) {
            currentSlide = 0;
        }


        /* 첫 번째에서 이전을 누르면 마지막으로 */
        if (currentSlide < 0) {
            currentSlide = slides.length - 1;
        }


        slides[currentSlide].classList.add("active");

    }


    /* =====================================
       다음 버튼 >
    ===================================== */
    nextButton.addEventListener("click", function() {

        showSlide(currentSlide + 1);

    });


    /* =====================================
       이전 버튼 <
    ===================================== */
    prevButton.addEventListener("click", function() {

        showSlide(currentSlide - 1);

    });


    /* =====================================
       4초마다 자동으로 다음 배너
    ===================================== */
    setInterval(function() {

        showSlide(currentSlide + 1);

    }, 4000);

});


document.addEventListener("DOMContentLoaded", function() {

    const track = document.querySelector(".recommend-track");

    const products = document.querySelectorAll(".recommend-product");

    let recommendPage = 0;

    const productsPerPage = 4;

    const totalPages = Math.ceil(products.length / productsPerPage);


    setInterval(function() {

        recommendPage++;

        // 마지막 페이지 다음에는 처음으로
        if (recommendPage >= totalPages) {
            recommendPage = 0;
        }

        track.style.transform =
            "translateX(-" + (recommendPage * 100) + "%)";

    }, 4000);

});


document.addEventListener("DOMContentLoaded", function() {
	/* =========================================
	   분야별 베스트
	========================================= */

	const categoryButtons =
	    document.querySelectorAll(".category-best-btn");

	const categoryProducts =
	    document.querySelectorAll(".category-recommend-product");

	const categoryMore =
	    document.querySelector("#category-more");


	let selectedCategory = 1;

	let categoryPage = 0;

	const categoryPerPage = 4;


	/* =========================================
	   상품 4개 보여주는 함수
	========================================= */
	function showCategoryProducts() {

	    /* 일단 모든 상품 숨김 */
	    categoryProducts.forEach(function(product) {

	        product.classList.remove("show");

	    });


	    /* 현재 카테고리에 해당하는 상품만 찾음 */
	    const filteredProducts =
	        Array.from(categoryProducts).filter(function(product) {

	            return Number(product.dataset.category)
	                   === selectedCategory;

	        });


	    /* 총 페이지 계산 */
	    const totalPages =
	        Math.ceil(filteredProducts.length / categoryPerPage);


	    /* 마지막 페이지 넘어가면 처음으로 */
	    if (categoryPage >= totalPages) {
	        categoryPage = 0;
	    }


	    /* 현재 보여줄 시작 번호 */
	    const start =
	        categoryPage * categoryPerPage;


	    /* 현재 보여줄 마지막 번호 */
	    const end =
	        start + categoryPerPage;


	    /* 해당 4개만 화면에 표시 */
	    filteredProducts
	        .slice(start, end)
	        .forEach(function(product) {

	            product.classList.add("show");

	        });

	}


	/* =========================================
	   카테고리 버튼 클릭
	========================================= */
	categoryButtons.forEach(function(button) {

	    button.addEventListener("click", function() {

	        /* 기존 파란 버튼 해제 */
	        categoryButtons.forEach(function(btn) {

	            btn.classList.remove("active");

	        });


	        /* 클릭한 버튼 활성화 */
	        button.classList.add("active");


	        /* 클릭한 카테고리 번호 저장 */
	        selectedCategory =
	            Number(button.dataset.category);


	        /* 첫 페이지부터 시작 */
	        categoryPage = 0;


	        /* 상품 다시 출력 */
	        showCategoryProducts();


	        /* 더보기 주소도 해당 카테고리로 변경 */
	        categoryMore.href =
	            "/productList?c_no=" + selectedCategory;

	    });

	});


	/* =========================================
	   4초마다 다음 상품 4개
	========================================= */
	setInterval(function() {

	    categoryPage++;

	    showCategoryProducts();

	}, 4000);


	/* 처음 화면 */
	showCategoryProducts();


	/* 처음 더보기 주소 */
	categoryMore.href =
	    "/productList?c_no=" + selectedCategory; 
});





document.addEventListener("DOMContentLoaded", function() {
	/* =========================================
	   디지털 매거진 자동 슬라이드
	========================================= */

	const digitalProducts =
	    document.querySelectorAll(".digital-product");

	let digitalPage = 0;

	const digitalPerPage = 4;

	const digitalTotalPages =
	    Math.ceil(digitalProducts.length / digitalPerPage);


	/* 디지털 상품 4개씩 보여주기 */
	function showDigitalProducts() {

	    /* 전부 숨김 */
	    digitalProducts.forEach(function(product) {

	        product.classList.remove("show");

	    });


	    /* 시작 번호 */
	    const start =
	        digitalPage * digitalPerPage;


	    /* 마지막 번호 */
	    const end =
	        start + digitalPerPage;


	    /* 해당 4개만 보여주기 */
	    Array.from(digitalProducts)
	        .slice(start, end)
	        .forEach(function(product) {

	            product.classList.add("show");

	        });

	}


	/* 처음 4개 표시 */
	showDigitalProducts();


	/* 4초마다 다음 4개 */
	setInterval(function() {

	    digitalPage++;


	    /* 마지막 다음에는 처음으로 */
	    if (digitalPage >= digitalTotalPages) {

	        digitalPage = 0;

	    }


	    showDigitalProducts();

	}, 4000);
});




