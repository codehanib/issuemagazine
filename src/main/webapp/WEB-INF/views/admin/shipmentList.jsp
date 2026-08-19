<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송정보목록</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    color: #222;
}

.container {
    width: 90%;
    max-width: 1100px;
    margin: 40px auto;
}

/* 제목 */
.title {
    position: relative;
    font-size: 18px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 20px;
    color: #222222;
    font-weight: 500;
}

/* 제목 글자 아래 두꺼운 밑줄 */
.title::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -1px;
    width: 85px;
    height: 2px;

    background-color: #222222;
}

/* 배송 테이블 */
.shipment-table {
    width: 100%;
    border-collapse: collapse;
    border-top: 1px solid #ddd;
}

/* 테이블 제목 */
.shipment-table th {
    height: 42px;
    font-size: 12px;
    font-weight: normal;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* 테이블 내용 */
.shipment-table td {
    height: 55px;
    font-size: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* 배송번호 */
.shipment-no {
    color: #777;
}

/* 수정 버튼 */
.update-btn {
    width: 45px;
    height: 25px;
    border: 1px solid #bbb;
    background: white;
    font-size: 11px;
    cursor: pointer;
}

.update-btn:hover {
    background-color: #f5f5f5;
}

/* 배송정보가 없을 때 */
.empty {
    height: 100px !important;
    color: #999;
}
</style>

</head>

<body>
<%@ include file="../header.jsp" %>
<div class="container">

    <div class="title">
        배송리스트
    </div>

    <table class="shipment-table">

        <tr>
            <th style="width: 100px;">배송번호</th>
            <th style="width: 180px;">택배사</th>
            <th style="width: 220px;">운송장번호</th>
            <th style="width: 180px;">배송상태</th>
            <th style="width: 100px;">수정</th>
        </tr>

        <c:choose>

            <c:when test="${not empty shipmentList}">

                <c:forEach var="shipment" items="${shipmentList}">

                    <tr>

                        <!-- 배송번호 -->
                        <td class="shipment-no">
                            ${shipment.s_no}
                        </td>

                        <!-- 택배사 -->
                        <td>
                            ${shipment.s_delivery}
                        </td>

                        <!-- 운송장번호 -->
                        <td>
                            ${shipment.s_d_no}
                        </td>

                        <!-- 배송상태 -->
                        <td>
                            ${shipment.s_status}
                        </td>

						<td>
						    <button type="button"
						            class="update-btn"
						            onclick="location.href='/admin/updateForm?o_no=${shipment.o_no}'">
						        수정
						    </button>
						</td>
          			</tr>

                </c:forEach>

            </c:when>

            <c:otherwise>

                <tr>
                    <td colspan="5" class="empty">
                        등록된 배송정보가 없습니다.
                    </td>
                </tr>

            </c:otherwise>

        </c:choose>

    </table>

</div>
<%@ include file="../footer.jsp" %>
</body>
</html>