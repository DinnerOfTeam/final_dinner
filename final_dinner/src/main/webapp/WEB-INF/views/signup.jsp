<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="inc/top.jsp"%>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#wr_submit').click(function() {
							if ($('#name').val() == "") {
								alert('이름을 입력하세요');
								$('#name').focus();
								return false;
							} else if ($('#userid').val() == "") {
								alert('아이디를 입력하세요');
								$('#userid').focus();
								return false;
							} else if ($('#pwd').val() == "") {
								alert('비밀번호를 입력하세요');
								$('#pwd').focus();
								return false;
							} else if ($('#pwd').val() != $('#pwd2').val()) {
								alert('비밀번호가 일치하지 않습니다.');
								$('#pwd2').focus();
								return false;
							} else if ($('#chkId').val() != 'Y') {
								alert('아이디 중복확인을 해야 합니다.');
								$("#btnChkId").focus();
								return false;
							}
						});

						$('#email2').change(function() {
							//직접입력인 경우 텍스트박스 보여주기
							if ($('#email2').val() == 'etc') {
								$('#email3').css('visibility', 'visible');
								$('#email3').focus();
								$('#email3').val('');
							} else {
								$('#email3').css('visibility', 'hidden');
							}
						});

						$('#btnChkId')
								.click(
										function() {
											//중복확인 버튼 클릭시 새창 열기
											var userid = $('#userid').val();

											window
													.open(
															"<c:url value='/member/checkId.do?userid="
																	+ userid
																	+ "'/>",
															'chk',
															'left=0,top=0,width=400,height=250,locations=yes,resizable=yes');
										});

						$('#btnZipcode')
								.click(
										function() {
											//우편번호 찾기 창 띄우기
											window
													.open(
															'<c:url value="/zipcode/zipcode.do"/>',
															'zip',
															'left=0,top=0,width=450,height=500,locations=yes,resizable=yes');
										});

					});
</script>


<!-- login -->
<div class="login">
	<div class="container">
		<div class="login-body">
			<div class="login-heading2 w3layouts">
				<h1>회원가입</h1>
			</div>
			<div class="login-info">
				<form action="#" method="post">



					<fieldset>

						<div>
							<label for="userid" class="lb">회원ID</label> <input type="text" name="userid"
								id="userid" style="ime-mode: inactive" class="tx">&nbsp;
							<input type="button" value="중복확인" id="btnChkId" title="새창열림">
						</div>
						<div>
							<label for="pwd" class="lb">비밀번호</label> <input type="Password" name="pwd"
								id="pwd" class="tx">
						</div>
						<div>
							<label for="pwd2" class="lb">비밀번호 확인</label> <input type="Password"
								name="pwd2" id="pwd2" class="tx">
						</div>
						<div>
							<label for="name" class="lb">성명</label> <input type="text" name="name"
								id="name" style="ime-mode: active" class="tx">
						</div>
						<div>
							<label for="zipcode" class="lb2">주소</label> <input type="text" name="zipcode"
								id="zipcode" ReadOnly title="우편번호" class="tx3" >&nbsp;&nbsp;&nbsp; <input
								type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
							<span class="sp1">&nbsp;</span> <input type="text" name="address"
								id="address" ReadOnly title="주소" class="tx4" ><br /> <span
								class="sp1">&nbsp;</span> <input type="text"
								name="addressDetail" title="상세주소" class="tx4">
						</div>
						<div>
							<label for="hp1" class="lb">핸드폰</label>&nbsp;<select name="hp1" id="hp1"
								title="휴대폰 앞자리">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> - <input type="text" name="hp2" id="hp2" maxlength="4"
								title="휴대폰 가운데자리" class="tx2">- <input type="text"
								name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리" class="tx2">
						</div>
						<div>
							<label for="email1" class="lb">이메일 주소</label> <input type="text"
								name="email1" id="email1" title="이메일주소 앞자리" class="tx" >@
							<select name="email2" id="email2" title="이메일주소 뒷자리">
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="etc">직접입력</option>
							</select> <input type="text" name="email3" id="email3"
								title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden" class="tx">
						</div>

					</fieldset>

					<input type="submit" id="wr_submit" value="회원가입">
					<div class="signup-text">
						<a href="login.jsp">로그인</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- //login -->

<%@include file="inc/footer.jsp"%>