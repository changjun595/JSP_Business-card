function inputCheck(){
	var userinput = eval("document.insForm");
	if(userinput.name.value==""){
		alert("이름을 입력하세요.");
		userinput.name.focus();
		return false;
	}
	if(userinput.company.value==""){
		alert("회사를 입력하세요.");
		userinput.company.focus();
		return false;
	}
	if(userinput.position.value==""){
		alert("직책을 입력하세요.");
		userinput.position.focus();
		return false;
	}
	if(userinput.tell.value==""){
		alert("전화번호를 입력하세요.");
		userinput.tell.focus();
		return false;
	}
	if(userinput.email.value==""){
		alert("이메일을 입력하세요.");
		userinput.email.focus();
		return false;
	}
	if(userinput.address.value==""){
		alert("주소를 입력해 주세요");
		userinput.address.focus();
		return false;
	}
	
}