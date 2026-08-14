<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의작성</title>
</head>
<body>
 <div>
    <h3>1:1문의 등록</h3>
    <form name="one_inquiry" method="post" action="/one_inquiry/write">
    <div class="form-row">
        <label class="title">제목</label>
        <div class="input-content"><select name="oi_title">
            <option value="주소지변경/회원정보수정 신청">주소지변경/회원정보수정 신청</option>
            <option value="사은품/부록 문의">사은품/부록 문의</option>
            <option value="배송 문의">배송 문의</option>
            <option value="결제관계 문의">결제관계 문의</option>
            <option value="잡지내용 문의">잡지내용 문의</option>
            <option value="견적의뢰 및 일괄구독 문의">견적의뢰 및 일괄구독 문의</option>
            <option value="영수증/계산서/기타서류 발행요청">영수증/계산서/기타서류 발행요청</option>
            <option value="정기구독/재구독 문의">정기구독/재구독 문의</option>
            <option value="입점/제휴 문의">입점/제휴 문의</option>
            <option value="기타 문의">기타 문의</option>
        </select></div>
    </div>
    <div class="form-row">
        <label class="title">내용</label>
        <div class="input-content"><input type="text" name="oi_content"></div>
    </div>
    <input type="hidden" name="p_no" value="2037">  
    <!-- p_no 처리할방법생각해야됨 일단 임시로 숫자지정해놓음 상품이랑 연관해야되서 지금은 처리안될거같음 -->
    <div class="form-row">
        <button type="submit">등록</button>
    </div>
</form>
 </div>
</body>
</html>
