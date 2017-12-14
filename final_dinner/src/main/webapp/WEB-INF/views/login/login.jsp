<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		$('#SignIn').click(function(){
		if($('#memId').val()==''){
			alert('아이디를 입력하세요');
			$('#memId').focus();
			return false;
		}else if($('#memPwd').val()==''){
			alert('비밀번호를 입력하세요');
			$('#memPwd').focus();
			return false;
		}
			
		});
	});

</script>

<style type="text/css">
.nav-tabs>li {
	width: 33.3%;
}
</style>




<!-- login -->
<div class="login">
	<div class="container">
		<div class="login-body">
			<div class="login-heading w3layouts" align="center">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#home"
						id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
						aria-expanded="true">일반</a></li>
					<li role="presentation"><a href="#profile" role="tab"
						id="profile-tab" data-toggle="tab" aria-controls="profile">업체</a></li>
					<li role="presentation"><a href="#profile" role="tab"
						id="profile-tab" data-toggle="tab" aria-controls="profile">관리자</a></li>
				</ul>
			</div>
			<div class="login-info">
				<form action="<c:url value='/login/login.do'/>" name="frmLogin"
					method="post">
					<label for="memId">회원ID</label> <input type="text" class="user"
						name="memId" id="memId" value="${cookie.ck_memId.value }"> <br> <label for="memPwd">비밀번호</label>
					<input type="password" name="memPwd" class="lock" id="memPwd">
					<div class="forgot-top-grids">
						<div class="forgot-grid">
							<ul>
								<li><input type="checkbox" id="chkSaveId" name="chkSaveId" value=""
								<c:if test="${!empty cookie.ck_memId }">
										checked
									</c:if>> 
								<label for="chkSaveId">
									<span></span>아이디 기억하기</label></li>
							</ul>
						</div>
						<div class="forgot">
							<a href="#">비밀번호 찾기</a>
						</div>
						<div class="clearfix"></div>
					</div>
					<input type="submit" name="SignIn" id="SignIn" value="로그인">
					<div class="signup-text">
						<a href="<c:url value= '/signup.do'/>">회원가입</a>
					</div>


				</form>
			</div>
		</div>
	</div>
</div>
<!-- //login -->

<%@include file="../inc/footer.jsp"%>