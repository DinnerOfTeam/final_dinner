<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<style>
	#color p{
		color: black;
	}
	#color a {
		color: black;
	}
</style>
<div class="container fadeInUp animated" data-wow-delay=".5s">
		<div class= 'row qna_header'>
		<div class="img_size col-sm-6">
			<h1><a href="index.html" ><img src="../images/logo.jpg" alt="" />고객센터</a></h1>
		</div>
		<div class= 'col-sm-1'>&nbsp;</div>
		<form name="frmQnaSearch" method="get" action="<c:url value='/customer/list.do'/>">
		<div class= 'col-sm-5 search_form'>
			<label for='searchQna'>FAQ 통합검색</label>
			<input type='text' name="searchKeyword" title="검색어 입력"
				value="${SearchVO.keyword }">
			<button type="submit"><span class= 'glyphicon glyphicon-search' /></button>
		</div>
		</form>
		</div>
	<div class= 'row col-sm-7'>
		<div class= 'table_div_info col-sm-12' id='color'>
			<div class= 'tr_div row'>
				<div class='th_div th_header col-sm-9 font_size14'>자주 찾는 질문 BEST 10</div>
				<div class= 'col-sm-3 pad_t30'><a href="list.do"><img alt="더보기" src="<c:url value='/images/more.JPG'/>"></a></div>
			</div>
			<c:if test="${!empty list}">
				<c:forEach var="vo" items="${list }" varStatus="i">
				<div class="table-tr">
			<div class= 'tr_div row td_hover'>
			<a href="<c:url value='/customer/countUpdate.do?no=${vo.qnaQuestionNo}'/>">
				<div class= 'td_div col-sm-3'><span class= 'level'>${i.count}</span></div>
				<c:if test="${vo.qnaTypeNo==1}">
					<div class= 'td_div col-sm-9'>로그인 문의</div>
				</c:if>
				<c:if test="${vo.qnaTypeNo==2}">
					<div class= 'td_div col-sm-9'>회원문의</div>
				</c:if>
				<c:if test="${vo.qnaTypeNo==3}">
					<div class= 'td_div col-sm-9'>업체문의</div>
				</c:if>
				<c:if test="${vo.qnaTypeNo==4}">
					<div class= 'td_div col-sm-9'>예약문의</div>
				</c:if>
				<div class= 'td_div col-sm-9'>${vo.questionTitle }</div>
			</a>
			</div>
				</div>
					</c:forEach>
				<%-- </c:forEach> --%>
			</c:if>
		</div>
		<div class= 'help col-sm-7'>
			<img src="<c:url value='/images/help.jpg'/>">
		</div>
	</div>
	<div class= 'row col-sm-5'>
		<div class= 'info' id="color">
			<div class= 'info_header'>
				<div class= 'th_div col-sm-9 th_header font_size14'>문의안내</div>
				<div class= 'col-sm-3 pad_t30'><a>더보기</a></div>
			</div>
			<div class= 'col-sm-6'>
				<a href="write.do">
				<img src="<c:url value='/images/qna.png'/>" width="80%" height="80%">
				<p>1:1 문의하기</p>
				</a>
			</div>
			<div class= 'col-sm-6'>
				<a href="write.do">
				<img src="<c:url value='/images/declare.png'/>">
				<p>신고하기</p>
				</a>
			</div>
		</div>		
	</div>
</div>
<%@ include file="../inc/footer.jsp" %>