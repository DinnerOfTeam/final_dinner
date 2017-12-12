<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	#imgLine {
		width: 100%;
		height: 6px;
	}
</style>
<div title= 'board_review'>
	<div title= "header">
		<i class="fa fa-comments-o left_align" aria-hidden="true"> 그룹 후기게시판</i>
		<span>
			<a href= "<c:url value='/board/list.do' />">
				<img class= 'more_img' alt="더보기 이미지" src="${pageContext.request.contextPath }/images/more.JPG">
			</a>
		</span>
		<div class= 'clear'>
			<img id= 'imgLine' alt="라인" src="${pageContext.request.contextPath }/images/Line.JPG">
		</div>
	</div>
	
	<div>
		<table class= table >
			<c:forEach var="vo" items="${review_list }">
				<tr>
					<th>작성자</th>
					<th>후기제목</th>
					<th>등록일</th>
				</tr>
				<tr>
					<td>장요한</td>
					<td><a class= 'vote_list' href="<c:url value= '#' />">${vo.reviewTitle }</a></td>
					<td><fmt:formatDate value="${vo.reviewRegdate }" pattern="yy-MM-dd" /></td>
				<tr>
			</c:forEach>
		</table>
	</div>
	
</div>