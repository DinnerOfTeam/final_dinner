<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://use.fontawesome.com/a9eeb9d53e.js"></script>
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
	.table, .table td {
		border: 1px solid #353535;
		padding: 15px 0px !important;
		text-align: center;
	}
	.table th {
		border-bottom: 1px solid #353535;
		text-align: center;
		padding: 5px !important;
	}
	.work {
		background-color: blue;
		width: 100%;
		margin: 0;
	}
	.more_img {
		float: right;
	}
	.clear {
		clear: both !important;
	}
	.left_align {
		float: left;
		text-align: left;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('.ajax').click(function() {
			alert('ajax 클릭');
			$.ajax({
				type: "GET", url: "main.do", 
				data: {year: ${today.year}, month: ${today.month-1}, p_date: ${today.date}},
				dataType: "text/html"
			});
		});
	});
</script>
	<article class= 'padT_30'>
		<div class= 'container' style= 'text-align:center'>
			<div class= 'col-md-3'>
				<ul class= 'nav nav-pills nav-stacked'>
					<li><a href="<c:url value='/indiGroup/calender.do' />">일정보기</a>
					<li><a href="<c:url value='/boardReview/main.do?group=' />">후기게시판보기</a>
					<li><a href="<c:url value='/indiGroup/board.do' />">그룹게시판보기</a>
					<li><a href="<c:url value='/indiGroup/vote.do' />">그룹투표보기</a>
				</ul>
			</div>
			<div class= 'col-md-9'>
				<div class= 'col-md-8'>
					<div title="calender">
						<c:import url="/indiGroup/calender.do" />
					</div>
					<div title= 'board_review'>
						<c:import url="/indiGroup/board_review.do" />
					</div>
					<div title= 'vote'>
						<c:import url="/indiGroup/vote.do" />
					</div>
				</div>
				<div class= 'col-md-4'>
					<div title= 'chatting'>
						<c:import url="/indiGroup/chat.do" />
					</div>
				</div>
			</div>
		</div>
	</article>

<%@ include file="../inc/footer.jsp" %>