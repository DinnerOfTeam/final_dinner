<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="inc/top.jsp"%>



<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#wr_submit').click(function() {
							
							
							if ($('#memId').val() == "") {
								alert('아이디를 입력하세요');
								$('#memId').focus();
								return false;
							} else if ($('#chkId').val() != 'Y') {
								alert('아이디 중복확인을 해야 합니다');
								$('#btnChkId').focus();
								return false;
							} else if ($('#memPwd').val() == "") {
								alert('비밀번호를 입력하세요');
								$('#memPwd').focus();
								return false;
							} else if ($('#memPwd').val() != $('#memPwd2').val()) {
								alert('비밀번호가 일치하지 않습니다');
								$('#memPwd2').focus();
								return false;
							} else if ($('#memName').val() == "") {
								alert('이름을 입력하세요');
								$("#memName").focus();
								return false;
							}
						});

						$('#memEmail2').change(function() {
							//직접입력인 경우 텍스트박스 보여주기
							if ($('#memEmail2').val() == 'etc') {
								$('#memEmail3').css('visibility', 'visible');
								$('#memEmail3').focus();
								$('#memEmail3').val('');
							} else {
								$('#memEmail3').css('visibility', 'hidden');
							}
						});

						$('#btnChkId').click(function() {
								//중복확인 버튼 클릭시 새창 열기
								var memId = $('#memId').val();
								window.open("<c:url value='../member/checkId.do?memId="+ memId+"'/>",
								'chk','left=0,top=0,width=400,height=250,locations=yes,resizable=yes');
						});

						/* $('#btnZipcode').click(function() {
								//우편번호 찾기 창 띄우기
								window.open('<c:url value="/member/zipcode.do"/>','zip',
								'left=0,top=0,width=450,height=500,locations=yes,resizable=yes');
							}); */

					});
</script>

<style type="text/css">
	.form-heading{
		width: 600px;
	}
</style>


<!-- login -->
<div class="login">
	<div class="container">
		<div class="login-body">
			<div class="form-heading">
				<h1>회원가입</h1>
				
			</div>
			<div class="login-info">
				<form method="post" 
					action="<c:url value='/member/memWrite.do' />">



					<fieldset>

						<div>
							<label for="memId" class="lb">회원ID</label> 
							<input type="text" name="memId"	id="memId" style="ime-mode: inactive" class="tx">&nbsp;
							<input type="button" value="중복확인" id="btnChkId" title="새창열림">
						</div>
						<div>
							<label for="memPwd" class="lb">비밀번호</label> 
							<input type="Password" name="memPwd"id="memPwd" class="tx">
						</div>
						<div>
							<label for="memPwd2" class="lb">비밀번호 확인</label> 
							<input type="Password"name="memPwd2" id="memPwd2" class="tx">
						</div>
						<div>
							<label for="memName" class="lb">성명</label> 
							<input type="text" name="memName"id="memName" style="ime-mode: active" class="tx">
						</div>
						<div>
							<label for="memZipcode" class="lb lb2">주소</label> 
							<input type="text" name="memZipcode"id="memZipcode" ReadOnly title="우편번호" class="tx tx3" >&nbsp;&nbsp;&nbsp; 
							<input type="Button" value="우편번호 찾기" onclick="sample4_execDaumPostcode()"><br />							
							<span class="sp1">&nbsp;</span> 							
							<input type="text" name="memAdd"id="memAdd" ReadOnly title="주소" class="tx tx4" ><br />							
							<span class="sp1">&nbsp;</span> 							
							<input type="text" name="memAddDetail" id="memAddDetail" title="상세주소" class="tx4">
								<span id="guide" style="color:#999"></span>
						</div>
						<div>
							<label for="memTel1" class="lb">핸드폰</label>&nbsp;<select name="memTel1" id="memTel1"
								title="휴대폰 앞자리">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> 
							- <input type="text" name="memTel2" id="memTel2" maxlength="4"title="휴대폰 가운데자리" class="tx tx2">
							- <input type="text" name="memTel3" id="memTel3" maxlength="4" title="휴대폰 뒷자리" class="tx tx2">
						</div>
						<div>
							<label for="memEmail1" class="lb">이메일 주소</label> 
							<input type="text" name="memEmail1" id="memEmail1" title="이메일주소 앞자리" class="tx tx3" >@
							<select name="memEmail2" id="memEmail2" title="이메일주소 뒷자리">
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="etc">직접입력</option>
							</select> 
							<input type="text" name="memEmail3" id="memEmail3"
								title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden" class="tx tx3">
						</div>

					</fieldset>
					   <input type ="text" name="chkId" id="chkId">

					<button id="wr_submit" class="site-btn-submit site-btn-full">회원가입</button>
					<div class="signup-text">
						<a href="<c:url value= '/login/login.do'/>">로그인</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- //login -->

<%@include file="inc/footer.jsp"%>