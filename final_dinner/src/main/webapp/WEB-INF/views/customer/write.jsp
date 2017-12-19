<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style>
/* 	.form-info input[type="button"] {
    border: none;
    outline: none;
    cursor: pointer;
    color: #fff;
    background: rgb(158, 22, 22);
    width: 100%;
    padding: .5em 1em;
    font-size: 1em;
    margin: 1.5em 0 0;
} */
</style>
<div class="login">
		<div class="container">
			<div class="form-body ">
				<div class="form-heading">
					<h1>문의하기</h1>
				</div>
				<div class="form-info">
					<form method="post"
					action="<c:url value='/customer/write.do'/>" onsubmit="return send(this)">
						<input type="text" class="user form-text" name="questionTitle" placeholder="제목을 입력하세요" required="">
						<div class="form-row">
							<select class="form-select" name="qnaTypeNo">	
								<option value="0">문의사항을 선택해 주세요</option>
								<option value="1">로그인문의</option>
								<option value="2">회원문의</option>
								<option value="3">업체문의</option>
								<option value="4">예약문의</option>
							</select>
						</div>

						<textarea name="questionContent" placeholder="내용을 입력하세요" class="form-text" required=""></textarea>
							
						<div class="form-row">
							<label>공개여부 : </label>
							<label class="radio-inline">
							  <input type="radio" name="questionOpen" id="inlineRadio1" value="open"> 공개글
							</label>
							<label class="radio-inline">
							  <input type="radio" name="questionOpen" id="inlineRadio2" value="close"> 비밀글
							</label>
						</div>

						<input type="submit" name="Sign In" class="site-btn-submit" value="등록하기">
						<input type="button" name="Sign In" class="site-btn" value="취소하기"
							onclick  ="location.href='<c:url value="/customer/list.do"/>'">

					</form>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../inc/footer.jsp" %>