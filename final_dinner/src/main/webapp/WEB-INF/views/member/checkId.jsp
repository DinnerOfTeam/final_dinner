
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복검사</title>
<link href="<c:url value='/css/mainstyle.css'/>" rel="stylesheet" type="text">
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.2.1.min.js'/>"></script>
	
<script type="text/javascript">
	$(document).ready(function(){
		$('form[name=frmId]').submit(function(){
			if($('#userid').val()==""){
				alert("아이디를 입력하세요");
				$('#userid').focus();
				return false;
			}
		});	
		
		$('#btUse').click(function(){
			$(opener.document).find('#userid').val('${param.userid}');
			$(opener.document).find('#chkId').val('Y');
			$(opener.document).find('#userid').prop('readOnly',true);
			
			self.close();
		});
		
	});

/* function setUserid(userid) {
	opener.document.frm1.userid.value=userid;
	opener.document.frm1.chkId.value='Y'; //중복확인을 햇다는 표시
	//opener.document.frm1.userid.disabled='disabled';	//새로 수정못하게 막아주는것
	opener.document.frm1.userid.readOnly=true;
	
	self.close();
} */

/* function send(form) {
	if(form.userid.value==""){
		alert("아이디를 입력하세요");
		form.userid.focus();
		return false;
	}
	return true;
} */
</script>
</head>
<body>
	<h1>아이디 중복검사</h1>
	<form name="frmId" method="post" action="<c:url value='checkId.do'/>">
			
		<label for="userid">아이디 : </label>
		<input type="text" name="userid" id="userid"
		 value="${param.userid}">
		<input type="submit" value="아이디 확인">
		<c:if test="${result==EXIST_ID }">
			<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
		</c:if>
		<c:if test="${result==NONE_EXIST_ID }">
			<input type="button" value="사용하기" id="btUse">
			<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
		</c:if>	
		
	</form>
</body>
</html>