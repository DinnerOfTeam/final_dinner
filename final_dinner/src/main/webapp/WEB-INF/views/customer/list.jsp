<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="tab_menu.jsp" %>
<style>
#list tbody tr td a{
	color: black;
}
</style>
<div class="container fadeInUp animated" data-wow-delay=".5s">
		<form>
		<fieldset class='border_fieldset'>
			<legend>자유게시판</legend>
		<table class= 'table tb_hover' id="list">
			<thead class= 'row'>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="5">해당하는 데이터가 없습니다.
					</tr>
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list }">
						<tr style="text-align:center">
					<td>${vo.qnaQuestionNo }</td>
						<td style="text-align:left">
						<a href
					="<c:url value='/customer/countUpdate.do?no=${vo.qnaQuestionNo}'/>">
						${vo.questionTitle }
					</a>
						</td>
						<td>${vo.memNo}</td>
						<td><fmt:formatDate value="${vo.questionRegdate }"
							pattern="yyyy-MM-dd"/></td>
						<td>${vo.questionViewCount }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		</fieldset>
		</form>
			<div class='page_div'>
				<ul class= 'pagination'>
					<li><a aria-label='Previous'><i class="fa fa-angle-left"></i></a></li>
					<li><a>1</a></li>
					<li><a>2</a></li>
					<li><a>3</a></li>
					<li><a aria-label='Next'><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>
			<div class= 'search_form'>
				<label for='search_condition' class= 'sr-only'>검색</label>
				<select id= 'search_condition' name= 'search_condition'>
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
					<option>작성일</option>
				</select>
				<input type='text'><button><span class= 'glyphicon glyphicon-search' /></button>
			</div>
	</div>
<%@ include file="../inc/footer.jsp" %>