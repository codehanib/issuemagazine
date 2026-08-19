<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 배송정보수정</title>

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
    font-size: 18px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 20px;
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

/* 입력창 */
.shipment-input {
    width: 150px;
    height: 28px;
    border: 1px solid #bbb;
    padding: 0 8px;
    font-size: 12px;
}

/* 셀렉트 */
.shipment-select {
    width: 100px;
    height: 28px;
    border: 1px solid #bbb;
    background: white;
    padding: 0 5px;
    font-size: 12px;
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
</style>

</head>

<body>
<%@ include file="../header.jsp" %>
<div class="container">
    <div class="title">
        배송정보수정
    </div>

    <form action="/admin/shipmentUpdate" method="post">
        <table class="shipment-table">
            <tr>
                <th style="width: 100px;">배송번호</th>
                <th style="width: 200px;">택배사</th>
                <th style="width: 250px;">운송장번호</th>
                <th style="width: 200px;">배송상태</th>
                <th style="width: 80px;">수정</th>
            </tr>
            <tr>

                <!-- 배송번호 -->
                <td class="shipment-no">
                    ${shipment.s_no}
                    <input type="hidden" name="s_no" value="${shipment.s_no}">
                </td>


                <!-- 택배사 -->
                <td>
                    <select name="s_delivery" class="shipment-select">
                        <option value="CJ대한통운"
                            ${shipment.s_delivery == 'CJ대한통운' ? 'selected' : ''}>
                            CJ대한통운
                        </option>

                        <option value="한진택배"
                            ${shipment.s_delivery == '한진택배' ? 'selected' : ''}>
                            한진택배
                        </option>

                        <option value="롯데택배"
                            ${shipment.s_delivery == '롯데택배' ? 'selected' : ''}>
                            롯데택배
                        </option>

                        <option value="우체국택배"
                            ${shipment.s_delivery == '우체국택배' ? 'selected' : ''}>
                            우체국택배
                        </option>
                    </select>
                </td>

                <!-- 운송장번호 -->
                <td>

                    <input type="text"
                           name="s_d_no"
                           class="shipment-input"
                           value="${shipment.s_d_no}">

                </td>


                <!-- 배송상태 -->
                <td>

                    <select name="s_status"
                            class="shipment-select">

                        <option value="배송준비중"
                            ${shipment.s_status == '배송준비중' ? 'selected' : ''}>
                            배송준비중
                        </option>

                        <option value="배송중"
                            ${shipment.s_status == '배송중' ? 'selected' : ''}>
                            배송중
                        </option>

                        <option value="배송완료"
                            ${shipment.s_status == '배송완료' ? 'selected' : ''}>
                            배송완료
                        </option>

                    </select>

                </td>

                <td>
                    <button type="submit"
                            class="update-btn">
                        확인
                    </button>
                </td>

            </tr>

        </table>

    </form>

</div>
<%@ include file="../footer.jsp" %>
</body>
</html>