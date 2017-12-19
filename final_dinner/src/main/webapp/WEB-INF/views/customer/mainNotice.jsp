<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<div class="container fadeInUp animated" data-wow-delay=".5s">
		<div class= 'row qna_header'>
		<div class="img_size col-sm-6">
			<h1><a href="index.html" ><img src="../images/logo.jpg" alt="" />고객센터</a></h1>
		</div>
		<div class= 'col-sm-1'>&nbsp;</div>
		<div class= 'col-sm-5 search_form'>
			<label for='searchQna'>FAQ 통합검색</label>
			<input type='text'><button><span class= 'glyphicon glyphicon-search' /></button>
		</div>
		</div>
	<div class= 'row col-sm-7'>
		<div class= 'table_div_info col-sm-12'>
			<div class= 'tr_div row'>
				<div class='th_div th_header col-sm-9 font_size14'>자주 찾는 질문 BEST 10</div>
				<div class= 'col-sm-3 pad_t30'><a href="list.do"><img alt="더보기" src="<c:url value='/images/more.JPG'/>"></a></div>
			</div>
			<div class= 'tr_div row td_hover'>
				<div class= 'td_div col-sm-3'><span class= 'level'>1</span>오류문의</div>
				<div class= 'td_div col-sm-9'>[알집] 지원하지 않는...</div>
			</div>
			<div class= 'tr_div row td_hover'>
				<div class= 'td_div col-sm-3'><span class= 'level'>99</span>오류문의</div>
				<div class= 'td_div col-sm-9'>[알집] 지원하지 않는...</div>
			</div>
			<div class= 'tr_div row td_hover'>
				<div class= 'td_div col-sm-3'><span class= 'level'>11</span>오류문의</div>
				<div class= 'td_div col-sm-9'>[알집] 지원하지 않는...</div>
			</div>
		</div>
		<div class= 'help col-sm-7'>
			<img src="<c:url value='/images/help.jpg'/>">
		</div>
		<div class= 'help col-sm-5'>
			<img src='images/help.jpg'>
		</div>
	</div>
	<div class= 'row col-sm-5'>
		<div class= 'info'>
			<div class= 'info_header'>
				<div class= 'th_div col-sm-9 th_header font_size14'>문의안내</div>
				<div class= 'col-sm-3 pad_t30'><a>더보기</a></div>
			</div>
			<div class= 'col-sm-6'>
				<a href="write.do">
				<img src="<c:url value='/images/question.png'/>">
				<p>1:1 문의하기</p>
				</a>
			</div>
			<div class= 'col-sm-6'>
				<a href="write.do">
				<img src="<c:url value='/images/question2.png'/>">
				<p>신고하기</p>
				</a>
			</div>
		</div>		
	</div>
	</div>
<%@ include file="../inc/footer.jsp" %>