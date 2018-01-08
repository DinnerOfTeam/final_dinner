<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../inc/top.jsp"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@include file="../inc/mypageSide.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		$('#pwd').focus();
		
		$('form[name=frmOut]').submit(function(){
			if($('#memPwd').val()==''){
				alert('비밀번호를 입력하세요');
				$('#memPwd').focus();
				return false;
			}
			
			if(!confirm('탈퇴하시겠습니까?')){
				return false;
			}else{
				return true;
			}	
		});	
	});
	
</script>
</head>
<body>


<article class="simpleForm">
	<form name="frmOut" method="post" 
		action="<c:url value='/restaurantEnterprise/restaurantOut.do'/>">
		<fieldset>
			<legend>식당 탈퇴</legend>
			<p class="p">식당을 탈퇴하시겠습니까?</p>
			
			<div>
				<label for="memPwd" >비밀번호 </label>
				<input type="password" name="memPwd" id="memPwd">
			</div>
			<div class="align_center">
				<input type="submit" value="식당탈퇴">
				<input type="reset" value="취소">
			</div>		
		</fieldset>
	</form>
</article>

</body>
</html>


<%@include file="../inc/footer.jsp"%>