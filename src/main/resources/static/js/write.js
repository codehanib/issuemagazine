function goPopup(){
	var pop = window.open("/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
}
function jusoCallBack(m_addr,m_addr2,m_zipno){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.member.m_addr.value = m_addr;
		document.member.m_addr2.value = m_addr2;
		document.member.m_zipno.value = m_zipno;
}
