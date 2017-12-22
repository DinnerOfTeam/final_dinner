<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	.nav-pills a {
		color: #353535;
		padding: 15px !important;
	}
	.padT_30 {
		padding-top: 30px;
	}
	.ajex {
		color: black;
	}
	.text_left {
		text-align: left;
	}
</style>
	<article class= 'padT_30'>
		<div class= 'container' style= 'text-align:center'>
			<div class= 'col-md-3'>
				<ul class= 'nav nav-pills nav-stacked'>
					<c:if test="${!empty sessionScope.memId&& !empty param.groupNo }">
						<li><a href="<c:url value='/indiGroup/groupBoard/list.do' />">그룹게시판보기</a>
						<li><a href="<c:url value='/indiGroup/vote.do' />">그룹투표보기</a>
						<li><a href="<c:url value='/indiGroup/groupRegi.do' />">그룹탈퇴</a>
					</c:if>
						<li><a href="<c:url value='/indiGroup/create.do' />">그룹생성</a>
						<li><a href="<c:url value='/indiGroup/regi.do' />">그룹가입</a>
						<c:if test="${isKing== sessionScope.memNo }">
							<li><a href="<c:url value='/indiGroup/regiOk.do?groupNo=${param.groupNo }' />">가입승인</a>
						</c:if>
				</ul>
			</div>
			<div class= 'col-md-9'>