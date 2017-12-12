<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../inc/top.jsp"%>


<div class="login">
	<div class="container">
		<div class="login-body">
			<div class="login-heading2 w3layouts">
				<h1>회원가입</h1>

			</div>
			<div class="login-info">
				<form method="post" action="<c:url value='/member/memWrite.do' />">



					<fieldset>

						<div>
							<label for="memId" class="lb">회원ID</label> <input type="text"
								name="memId" id="memId" style="ime-mode: inactive" class="tx"
								value="${sessionScope.userid}">&nbsp; <input
								type="button" value="중복확인" id="btnChkId" title="새창열림">
						</div>
						<div>
							<label for="memPwd" class="lb">비밀번호</label> <input
								type="Password" name="memPwd" id="memPwd" class="tx">
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
								<
									<c:if test="${vo.email2=='naver.com'}">
					            		selected
					            	</c:if>>naver.com</option>
													<option value="hanmail.net"
														<c:if test="${vo.email2=='hanmail.net'}">
					            		selected
					            	</c:if>>hanmail.net</option>
													<option value="nate.com"
														<c:if test="${vo.email2=='nate.com'}">
					            		selected
					            	</c:if>>nate.com</option>
													<option value="gmail.com"
														<c:if test="${vo.email2=='gmail.com'}">
					            		selected
					            	</c:if>>gmail.com</option>
							</select> <input type="text" name="memEmail3" id="memEmail3"
								title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden"
								class="tx tx3">
						</div>

					</fieldset>
					<input type="text" name="chkId" id="chkId"> <input
						type="submit" id="wr_submit" value="회원가입">
					<div class="signup-text">
						<a href="<c:url value= '/login/login.do'/>">로그인</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>









<%@include file="../inc/footer.jsp"%>