<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>ISSUEMAGAZINE:장바구니</title>

<link rel="stylesheet" href="css/cart.css">
</head>

<body>
	<%@ include file="../header.jsp"%>

	<main>
		<!-- 장바구니 타이틀 -->
		<h1 class="cart_title">장바구니</h1>
		<form method="post" name="cartForm" id="cartForm">
			<input type="hidden" name="orderType" value="cart">
			<div class="cart_box">
				<table class="cart-table">
					<thead>
						<tr>
							<th>선택</th>
							<th>상품정보</th>
							<th>수량</th>
							<th>구독기간</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cart" items="${cartList}">
							<tr>
								<!-- 선택 -->
								<td><input type="checkbox" name="cart_no"
									value="${cart.cart_no}"></td>
								<!-- 상품정보 -->
								<td>
									<div class="product-info">
										<img src="${cart.p_image}" alt="${cart.p_name}"
											class="cart-product-image">
										<div class="cart-product-text">
											<strong> ${cart.p_name} </strong> <br> 상품번호 :
											${cart.p_no}
										</div>
									</div>
								</td>
								<!-- 수량 -->
								<td>

									<button type="submit" class="quantity-btn"
										formaction="/cartUpdate?cart_no=${cart.cart_no}&cart_quantity=${cart.cart_quantity - 1}">
										-</button> ${cart.cart_quantity} 개

									<button type="submit" class="quantity-btn"
										formaction="/cartUpdate?cart_no=${cart.cart_no}&cart_quantity=${cart.cart_quantity + 1}">
										+</button>

								</td>
								<!-- 구독 기간 -->
								<td>
									<div>
										<select id="period_${cart.cart_no}"
											name="cart_sub_date_${cart.cart_no}"
											onchange="updateSubDate(${cart.cart_no}, this.value)">
											<option value="12"
												${cart.cart_sub_date == '12' ? 'selected' : ''}>1년
												(12회)</option>
											<option value="6"
												${cart.cart_sub_date == '6' ? 'selected' : ''}>6개월
											</option>
											<option value="3"
												${cart.cart_sub_date == '3' ? 'selected' : ''}>3개월
											</option>
											<option value="1"
												${cart.cart_sub_date == '1' ? 'selected' : ''}>1개월
											</option>
										</select>
									</div>
								</td>
								<!-- 가격 -->
								<td><fmt:formatNumber value="${cart.p_price2}"
										pattern="#,###" />원</td>
							</tr>
							<!-- 상품가격 × 수량 -->
							<c:set var="itemPrice"
								value="${cart.p_price2 * cart.cart_quantity}" />

							<c:set var="totalPrice" value="${totalPrice + itemPrice}" />
						</c:forEach>
					</tbody>
				</table>

				<!-- 총가격 -->
				<div class="cart_total">
					총 상품금액 :
					<fmt:formatNumber value="${totalPrice}" pattern="#,###" />
					원
				</div>


				<!-- 버튼영역 -->
				<div class="cart_buttons">
					<!-- 왼쪽 -->
					<div class="cart_buttons_left">
						<button type="submit" formaction="/cartDelete">선택상품 삭제</button>

						<button type="submit" formaction="/cartDeleteAll">장바구니
							비우기</button>

					</div>

					<!-- 오른쪽 -->
					<div class="cart_buttons_right">
						<button type="button" onclick="location.href='/product/list'">쇼핑
							계속하기</button>

						<button type="submit" formaction="/payment">선택 상품 주문</button>
					</div>

				</div>

			</div>
		</form>
		<!-- 장바구니 이용안내 -->
		<div class="cart_Information">
			<h2>장바구니 이용안내</h2>
			*무이자할부 상품 주문의 경우, 무이자할부 혜택을 받으시려면 '장부구니-무이자할부 상품' 아래의 [주문하기]버튼을 눌러
			주문/결제 하기면 됩니다.<br> *[전체 상품 주문]버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한
			주문/결제가 이루어집니다. 단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.<br>

			*선택하신 상품의 수량을 변경하시려면 수량변경 후 [수정]버튼을 누르시면 됩니다. [쇼핑계속]버튼을 누르시면 쇼핑을 계속
			하실 수 있습니다.<br> *장바구니에 담긴 상품은 30일 동안 보관됩니다. 보관된 상품은 30일 이후에 삭제되오니
			장바구니에서 삭제된 경우 다시 장바구니에 담으시기 바랍니다.<br> *장바구니와 관심상품을 이용하여 원하시는 상품만
			주문하거나 관심상품으로 등록하실 수 있습니다.

		</div>

	</main>
	<%@ include file="../footer.jsp"%>
</body>
</html>