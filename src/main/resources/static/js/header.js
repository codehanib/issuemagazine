document.addEventListener("DOMContentLoaded", function() {

    const categoryButton = document.querySelector(".category-button");
    const categoryMenu = document.querySelector(".category-menu");

    // 카테고리 버튼 클릭
    categoryButton.addEventListener("click", function() {

        categoryMenu.classList.toggle("show");

    });

    // 카테고리 밖을 클릭하면 닫기
    document.addEventListener("click", function(e) {

        if (!categoryButton.contains(e.target) &&
            !categoryMenu.contains(e.target)) {

            categoryMenu.classList.remove("show");

        }

    });

});