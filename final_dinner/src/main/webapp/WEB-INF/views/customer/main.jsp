<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
	<div>
		<h5>고객센터</h5>
	</div>
	<div>
		<hr>
	</div>
	<article id="right">
		<c:import url="/customer/mainNotice.do"></c:import>
	</article>
	<article id="left">
		<c:import url="/customer/qna.do"></c:import>
	</article>
<%@ include file="../inc/footer.jsp" %>