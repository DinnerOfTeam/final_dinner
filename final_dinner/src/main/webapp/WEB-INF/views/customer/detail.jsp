<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style>
	#table{
		margin-top: 20px;
	}
	#btn{
		text-align: right;
	}
	#btn input{
		margin-top : 20px;
		margin-right: 20px;
		background-color: #9D1616;
		color: white;
	}
</style>
<div class="container fadeInUp animated" data-wow-delay=".5s" id="table">
	<div class= 'row qna_header'>
		<div class="img_size col-sm-6">
			<h1><img src="images/logo.jpg" alt="" />상세보기</h1>
		</div>
	</div>
	
	<div class= 'row col-sm-12' id="table">
		<div class= 'table_div col-sm-12'>
			<div class= 'tr_div row'>
				<div class="th_div col-sm-2 font_size14 text_center border_both">제목</div>
				<div class='td_div col-sm-10 border_right'>${vo.questionTitle }</div>
			</div>
			<div class= 'tr_div row'>
				<div class="th_div font_size14 col-sm-2 text_center border_both">작성자</div>
				<div class='td_div col-sm-3'>${vo.memName }</div>
				<div class="th_div font_size14 col-sm-2 text_center border_both">등록일</div>
				<div class='td_div col-sm-2'>
				<fmt:formatDate value="${vo.questionRegdate }" 
					pattern="yyyy-MM-dd"/></div>
				<div class="th_div font_size14 col-sm-2 text_center border_both">조회수</div>
				<div class='td_div col-sm-1 border_right'>${vo.questionViewCount}</div>
			</div>
			<div class= 'content_detail'>
				${vo.questionContent}
			</div>
		</div>
	</div>
	</div>
	<div class="container fadeInUp animated" data-wow-delay=".5s" id="table">
	<div class= 'row col-sm-12'>
	
	<c:if test="${empty av.qnaAnswerNo }">
	<p>----등록된 답변글이 없습니다----</p>
		<!-- 등록된 댓글이 없을때 -->
		<!-- 등록된 글이 없습니다 라고 표시하기 -->
	</c:if>
	<c:if test="${!empty av.qnaAnswerNo }">
		<div class= 'table_div col-sm-12'>
			<div class= 'tr_div row'>
				<div class="th_div col-sm-2 font_size14 text_center border_both">제목</div>
				<div class='td_div col-sm-10 border_right'>Re:${vo.questionTitle }</div>
			</div>
			<div class= 'tr_div row'>
				<div class="th_div font_size14 col-sm-2 text_center border_both">작성자</div>
				<div class='td_div col-sm-3'>관리자</div>
				<div class="th_div font_size14 col-sm-2 text_center border_both">등록일</div>
				<div class='td_div col-sm-2'>
				<fmt:formatDate value="${av.answerRegdate }" 
					pattern="yyyy-MM-dd"/></div>
				<div class="th_div font_size14 col-sm-2 text_center border_both">조회수</div>
				<div class='td_div col-sm-1 border_right'>${vo.questionViewCount}</div>
			</div>
			<div class= 'content_detail'>
				${av.answerContent}
			</div>
		</div>
	</div>
	</c:if>
	<div id="btn" >
	<%-- <input type="Button" value="글쓰기"
		onclick="location.href='<c:url value="/customer/write.do"/>'" /> --%>
	<input type="Button" value="답변달기" class="site-btn-submit"
		onclick="location.href='<c:url value="/answer/reply.do?no=${vo.qnaQuestionNo}&title=${vo.questionTitle }"/>'" />
	<input type="Button" value="목록보기" class="site-btn-submit"
		onclick="location.href='<c:url value="/customer/list.do"/>'" />
	</div>
	</div>
<%@ include file="../inc/footer.jsp" %>    