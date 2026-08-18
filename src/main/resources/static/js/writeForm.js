function goPopup(){
	var pop = window.open("/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
}
function jusoCallBack(m_addr,m_addr2,m_zipno){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.member.m_addr.value = m_addr;
		document.member.m_addr2.value = m_addr2;
		document.member.m_zipno.value = m_zipno;
}

function check1() {
    let mid         = document.member.m_id;
    let mpassword   = document.member.m_passwd;
    let mpassword2  = document.member.m_passwd2;
    let mname       = document.member.m_name;
    let mzipno      = document.member.m_zipno;
    let maddr       = document.member.m_addr;
    let maddr2      = document.member.m_addr2;
    let mtel        = document.member.m_tel;
    let mtel2       = document.member.m_tel2;
    let mtel3       = document.member.m_tel3;
    let memail      = document.member.m_email;
    let memail2     = document.member.m_email2;
	let regid 		= /^[A-Za-z0-9]{4,16}$/;	
    let regpassword   = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,16}$/;

    if (!mid.value){
        alert("아이디를 영문과 숫자 조합으로 4~16자리 입력해주세요.");
        mid.focus();
        return false;
    	}
	
	if (!regid.test(mid.value)) {
		alert("아이디는 영문과 숫자 조합으로 4~16자리 입력해주세요.");
		mid.focus();
		return false;
		}
		
	if (!mpassword.value){
		alert("비밀번호를 영문, 숫자, 특수문자를 포함하여 8~16자리로 입력해주세요.");
		mpassword.focus();
		return false;
		}
		
	
	if (!regpassword.test(mpassword.value)) {
		alert("비밀번호는 영문, 숫자, 특수문자를 포함하여 8~16자리로 입력해주세요.");
		mpassword.focus();
		return false;
		}
		
	if (mpassword.value != mpassword2.value){
		alert("비밀번호와 비밀번호 확인은 일치해야됩니다.");
		mpassword.focus();
		mpassword.value = "";
		mpassword2.value = "";
		return false;
		}
	
	if (!mname.value){
	    alert("이름을 입력해주세요.");
	    mname.focus();
	    return false;
	   	}
	
	if (!mzipno.value){
		alert("주소를 입력해주세요.");
		return false;
		}	

	if (!maddr.value){
		alert("주소를 입력해주세요.");
		return false;
		}	

	if (!maddr2.value){
		alert("주소를 입력해주세요.");
		return false;
		}	
	if (!mtel2.value){
		alert("전화번호를 입력해주세요.");
		mtel2.focus();
		return false;
		}	

	if (!mtel3.value){
		alert("전화번호를 입력해주세요.");
		mtel3.focus();
		return false;
		}
		
	if (!memail.value){
		alert("이메일을 입력해주세요.");
		memail.focus();
		return false;
		}
	
	if(memail2.value === ""){
		alert("이메일주소를 선택하세요");
		return false;
	}


	return true;
}