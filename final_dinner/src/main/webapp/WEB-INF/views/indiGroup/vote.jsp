<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	#imgLine {
		width: 100%;
		height: 6px;
	}
	.vote_list {
		color: #353535;
	}
</style>
<div title= 'vote'>
	<div title= "header">
		<i class="fa fa-check-square left_align" aria-hidden="true"> 투표</i>
		<span>
			<a href= "<c:url value='/board/list.do' />">
				<img class='more_img' alt="더보기 이미지" src="${pageContext.request.contextPath }/images/more.JPG">
			</a>
		</span>
		<div class='clear'>
			<img id= 'imgLine' alt="라인" src="${pageContext.request.contextPath }/images/Line.JPG">
		</div>
	</div>
	
	<div>
		<table class= 'table'>
			<thead>
			</thead>
			<c:forEach var="vo" items="${vote_list }">
				<tr>
					<th>작성자</th>
					<th>투표제목</th>
					<th>완료기한</th>
				</tr>
				<tr>
					<td>장요한</td>
					<td><a class= 'vote_list' href="<c:url value= '#' />">${vo.voteTitle }</a></td>
					<td><fmt:formatDate value="${vo.voteEndDate }" pattern="yy-MM-dd" /></td>
				<tr>
			</c:forEach>
		</table>
	</div>
	
</div>