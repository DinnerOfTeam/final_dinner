<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../inc/top.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		$('#wr_submit').click(function() {
			if ($('#memPwd').val() == "") {
				alert('비밀번호를 입력하세요');
				$('#memPwd').focus();
				return false;
			} else if ($('#memPwd').val() != $('#memPwd2').val()) {
				alert('비밀번호가 일치하지 않습니다.');
				$('#memPwd2').focus();
				return false;
			}
		});

	});
</script>

<style type="text/css">
	.form-heading{
		width: 600px;
	}
</style>

<%@include file="../inc/mypageSide.jsp" %>


<div class="login">
	<div class="row">
		<div class="login-body">
			<div class="form-heading">
				<h1>회원정보수정</h1>

			</div>
			<div class="login-info">
				<form name="frm1" method="post"
					action="<c:url value='/member/memberEdit.do'/>">



					<fieldset>

						<div>
							<label for="memId" class="lb">회원ID</label> <input type="text"
								name="memId" id="memId" style="ime-mode: inactive" class="tx"
								value="${sessionScope.memId}">&nbsp; 
								<input type="button" value="중복확인" id="btnChkId" title="새창열림">
						</div>
						<div>
							<label for="memPwd" class="lb">비밀번호</label> 
							<input type="Password" name="memPwd" id="memPwd" class="tx">
						</div>
						<div>
							<label for="memPwd2" class="lb">비밀번호 확인</label> <input
								type="Password" name="memPwd2" id="memPwd2" class="tx">
						</div>
						<div>
							<label for="memName" class="lb">성명</label> <input type="text"
								name="memName" id="memName" style="ime-mode: active" class="tx"
								value="${vo.memName}">
						</div>
						<div>
							<label for="memZipcode" class="lb lb2">주소</label> <input
								type="text" name="memZipcode" id="memZipcode" ReadOnly
								title="우편번호" class="tx tx3" value="${vo.memZipcode}">&nbsp;&nbsp;&nbsp;
							<input type="Button" value="우편번호 찾기"
								onclick="sample4_execDaumPostcode()"><br /> <span
								class="sp1">&nbsp;</span> <input type="text" name="memAdd"
								id="memAdd" ReadOnly title="주소" class="tx tx4"
								value="${vo.memAdd}"><br /> <span class="sp1">&nbsp;</span>
							<input type="text" name="memAddDetail" id="memAddDetail"
								title="상세주소" class="tx4" value="${vo.memAddDetail}"> <span
								id="guide" style="color: #999"></span>
						</div>
						<div>
							<label for="memTel1" class="lb">핸드폰</label>&nbsp;<select
								name="memTel1" id="memTel1" title="휴대폰 앞자리">
								<option value="010"
									<c:if test="${vo.memTel1=='010'}">
					            		selected
					            	</c:if>>010</option>
								<option value="011"
									<c:if test="${vo.memTel1=='011'}">
					            		selected
					            	</c:if>>011</option>
								<option value="016"
									<c:if test="${vo.memTel1=='016'}">
					            		selected
					            	</c:if>>016</option>
								<option value="017"
									<c:if test="${vo.memTel1=='017'}">
					            		selected
					            	</c:if>>017</option>
								<option value="018"
									<c:if test="${vo.memTel1=='018'}">
					            		selected
					            	</c:if>>018</option>
								<option value="019"
									<c:if test="${vo.memTel1=='019'}">
					            		selected
					            	</c:if>>019</option>
							</select> - <input type="text" name="memTel2" id="memTel2" maxlength="4"
								title="휴대폰 가운데자리" class="tx tx2" value="${vo.memTel2}">-
							<input type="text" name="memTel3" id="memTel3" maxlength="4"
								title="휴대폰 뒷자리" class="tx tx2" value="${vo.memTel3}">
						</div>
						<div>
							<label for="memEmail1" class="lb">이메일 주소</label> <input
								type="text" name="memEmail1" id="memEmail1" title="이메일주소 앞자리"
								class="tx tx3" value="${vo.memEmail1}">@ <select
								name="memEmail2" id="memEmail2" title="이메일주소 뒷자리">
								<option value="naver.com"
									<c:if test="${vo.memEmail2=='naver.com'}">
					            		selected
					            	</c:if>>naver.com</option>
								<option value="hanmail.net"
									<c:if test="${vo.memEmail2=='hanmail.net'}">
					            		selected
					            	</c:if>>hanmail.net</option>
								<option value="nate.com"
									<c:if test="${vo.memEmail2=='nate.com'}">
					            		selected
					            	</c:if>>nate.com</option>
								<option value="gmail.com"
									<c:if test="${vo.memEmail2=='gmail.com'}">
					            		selected
					            	</c:if>>gmail.com</option>
									<c:set var="isEtc" value="false" />
									<c:choose>
										<c:when
											test="${vo.memEmail2!='naver.com' 
								            		&& vo.memEmail2!='hanmail.net' && vo.memEmail2!='nate.com'
								            		&& vo.memEmail2!='gmail.com' && !empty vo.memEmail2}">
											<c:set var="isEtc" value="true" />
										</c:when>
										<c:otherwise>
											<c:set var="isEtc" value="false" />
										</c:otherwise>
									</c:choose>
									<option value="etc"
										<c:if test='${isEtc==true}'>
								            		selected
								            	</c:if>>직접입력</option>



							</select> <input type="text" name="memEmail3" id="memEmail3"
								title="직접입력인 경우 이메일주소 뒷자리" class="tx tx3"
								<c:if test='${isEtc}'>
					        		value="${vo.memEmail2}"
					            	style="visibility:visible"	
					            </c:if>
													<c:if test='${!isEtc}'>         
					        		style="visibility:hidden"
					        	</c:if>>
						</div>

					</fieldset>
					<input type="text" name="chkId" id="chkId"> 
					<button id="wr_submit" class="site-btn-submit site-btn-full">회원정보수정</button>
					<div class="signup-text">
						<a href="<c:url value= '/login/login.do'/>">로그인</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
</section>









<%@include file="../inc/footer.jsp"%>