<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="inc/top.jsp"%>

<style type="text/css">


</style>

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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memZipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('memAdd').value = fullRoadAddr;
                document.getElementById('memAddDetail').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
        
        
    }
</script>


<!-- login -->
<div class="login">
	<div class="container">
		<div class="login-body">
			<div class="login-heading2 w3layouts">
				<h1>회원가입</h1>
				
			</div>
			<div class="login-info">
				<form method="post" 
					action="<c:url value='/member/memWrite.do' />">



					<fieldset>

						<div>
							<label for="memId" class="lb">회원ID</label> <input type="text" name="memId"
								id="memId" style="ime-mode: inactive" class="tx">&nbsp;
							<input type="button" value="중복확인" id="btnChkId" title="새창열림">
						</div>
						<div>
							<label for="memPwd" class="lb">비밀번호</label> <input type="Password" name="memPwd"
								id="memPwd" class="tx">
						</div>
						<div>
							<label for="memPwd2" class="lb">비밀번호 확인</label> <input type="Password"
								name="memPwd2" id="memPwd2" class="tx">
						</div>
						<div>
							<label for="memName" class="lb">성명</label> <input type="text" name="memName"
								id="memName" style="ime-mode: active" class="tx">
						</div>
						<div>
							<label for="memZipcode" class="lb lb2">주소</label> <input type="text" name="memZipcode"
								id="memZipcode" ReadOnly title="우편번호" class="tx tx3" >&nbsp;&nbsp;&nbsp; <input
								type="Button" value="우편번호 찾기" onclick="sample4_execDaumPostcode()"><br />
							<span class="sp1">&nbsp;</span> <input type="text" name="memAdd"
								id="memAdd" ReadOnly title="주소" class="tx tx4" ><br /> <span
								class="sp1">&nbsp;</span> <input type="text"
								name="memAddDetail" id="memAddDetail" title="상세주소" class="tx4">
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
							</select> - <input type="text" name="memTel2" id="memTel2" maxlength="4"
								title="휴대폰 가운데자리" class="tx tx2">- <input type="text"
								name="memTel3" id="memTel3" maxlength="4" title="휴대폰 뒷자리" class="tx tx2">
						</div>
						<div>
							<label for="memEmail1" class="lb">이메일 주소</label> <input type="text"
								name="memEmail1" id="memEmail1" title="이메일주소 앞자리" class="tx tx3" >@
							<select name="memEmail2" id="memEmail2" title="이메일주소 뒷자리">
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="etc">직접입력</option>
							</select> <input type="text" name="memEmail3" id="memEmail3"
								title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden" class="tx tx3">
						</div>

					</fieldset>
					   <input type ="text" name="chkId" id="chkId">

					<input type="submit" id="wr_submit" value="회원가입">
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