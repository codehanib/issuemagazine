function check1(){
		let mid 		= document.form.m_id;
		let mpasswd		= document.form.m_passwd;
		let mpasswd1	= document.form.m_passwd1;
		let mname		= document.form.m_name;
		let mphone1	 	= document.form.m_phone1;
		let mphone2 	= document.form.m_phone2;
		let mphone3		= document.form.m_phone3;
		let maddr1		= document.form.m_addr1;
		let maddr2		= document.form.m_addr2;
		let mzipno		= document.form.m_zipno;
		let mdate		= document.form.m_date;
		let regpasswd	= /^[0-9]+$/;
		
		if(!mid.value){
			alert("아이디를 입력해주세요.")
			mid.focus();
			return false;
		}
		
		if(!mpasswd.value){
			alert("비밀번호를 입력해주세요.")
			mpasswd.focus();
			return false;
		}
		if(!mpasswd1.value){
			alert("비밀번호를 입력해주세요.")
			mpasswd1.focus();
			return false;
		}
		if(!regpasswd.test(mpasswd1.value)){
			alert("비밀번호는 숫자만 입력해주세요.")
			mpasswd.value="";
			mpasswd1.focus();
			return false;
		}
		
		if(mpasswd.value != mpasswd1.value){
			alert("비밀번호와 비밀번호 확인은 일치해야됩니다. ")
			mpasswd.focus();
			mpasswd.value="";
			mpasswd1.value="";
			return false;
		}
		if(!mname.value){
			alert("이름을 입력해주세요.")
			mname.focus();
			return false;
		}
		if(!mphone1.value){
			alert("전화번호를 입력해주세요.")
			mphone1.focus();
			return false;
		}
		if(!mphone2.value){
			alert("전화번호를 입력해주세요.")
			mphone2.focus();
			return false;
		}
		if(!mphone3.value){
			alert("전화번호를 입력해주세요.")
			mphone3.focus();
			return false;
		}
		if(!maddr1.value){
			alert("주소를 입력해주세요.")
			maddr1.focus();
			return false;
		}
		if(!maddr2.value){
			alert("주소를 입력해주세요.")
			maddr2.focus();
			return false;
		}
		if(!mzipno.value){
			alert("우편번호를 입력해주세요.")
			mzipno.focus();
			return false;
		}
		if(!mdate.value){
			alert("생일을 입력해주세요.")
			mdate.focus();
			return false;
		}
		
	}/**
 * 
 */