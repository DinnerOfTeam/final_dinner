<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
	<div class="form-wrap">
		<div class="container">
			<div class="form-body ">
				<div class="form-heading">
					<h1>답변하기</h1>
				</div>
				<div class="form-info">
					<form method="post"
					action="<c:url value='/answer/reply.do'/>" onsubmit="return send(this)">
						<input type="hidden" name="qnaQuestionNo" value="${param.no}"/>
						<input type="text" class="form-text" name="title" value="Re: ${param.title}">
						
						<textarea name="answerContent" placeholder="내용을 입력하세요" class="form-text" required=""></textarea>

						<input type="submit" name="Sign In" class="site-btn-submit site-btn-full" value="답변달기">

					</form>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../inc/footer.jsp" %>