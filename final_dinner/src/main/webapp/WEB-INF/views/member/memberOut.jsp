<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../inc/top.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$('#memPwd').focus();
		
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

<article class="simpleForm">
	<form name="frmOut" method="post" 
		action="<c:url value='/member/memberOut.do'/>"	>
		<fieldset>
			<legend>회원 탈퇴</legend>
			<p class="p">회원탈퇴하시겠습니까?</p>
			
			<div>
				<label for="memPwd" >비밀번호 </label>
				<input type="password" name="memPwd" id="memPwd">
			</div>
			<div class="align_center">
				<input type="submit" value="회원탈퇴">
				<input type="reset" value="취소">
			</div>		
		</fieldset>
	</form>
</article>

<%@include file="../inc/footer.jsp" %>