
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>그룹명 중복검사</title>
<script type="text/javascript" 
	src="<c:url value='/jquery/jquery-3.2.1.min.js'/>"></script>
	
<script type="text/javascript">
	$(document).ready(function(){
		$('form[name=frmId]').submit(function(){
			if($('#groupName').val()==""){
				alert("아이디를 입력하세요");
				$('#groupName').focus();
				return false;
			}
		});	
		
		$('#btUse').click(function(){
			$(opener.document).find('#groupName').val('${param.groupName}');
			$(opener.document).find('#groupName').prop('readonly', true);
			self.close();
		});
		
	});
</script>
</head>
<body>
	<h1>그룹명 중복검사</h1>
	<form name="frmId" method="post" action="<c:url value='checkName.do'/>">
		<label for="groupName">그룹명 : </label>
		<input type="text" name="groupName" id="groupName"
		 value="${param.groupName}">
		<input type="submit" value="아이디 확인">
		<c:if test="${result> 0}">
			<p>이미 등록된 그룹명 입니다. 다른 그룹명을 입력하세요</p>
		</c:if>
		<c:if test="${!(result> 0)}">
			<input type="button" value="사용하기" id="btUse">
			<p>사용가능한 그룹명 입니다. [사용하기]버튼을 클릭하세요</p>
		</c:if>	
		
	</form>
</body>
</html>