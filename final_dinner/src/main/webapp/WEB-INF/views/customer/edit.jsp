<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath }/css/codestyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css" media="all" />
<style>
	.form-body{
		width: 100%;
		height: 100%;
	}
</style>

<div class="form-wrap">
		<div class="container">
			<div class="form-body">
				<div class="form-heading">
					<h1>수정하기</h1>
				</div>
				<div class="form-info">
				
					<form method="post"
					action="<c:url value='/customer/edit.do'/>" onsubmit="return send(this)">
						<input type="hidden" name="qnaQuestionNo" value="${param.no}"/>
						<input type="text" class="form-text" name="questionTitle" value="${vo.questionTitle}">
						
						<textarea name="questionContent" class="form-text">${vo.questionContent}</textarea>
						<div class="form-row">
						<div class="col-sm-6">
							<input type="submit" name="Sign In" class="site-btn-submit site-btn-full" value="답변달기">
						</div>
						<div class="col-sm-6">
							<a href="<c:url value='/customer/list.do'/>" class="site-btn site-btn-full">목록</a>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>