<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--Board-page -->
<link href="<c:url value='/css/site-board.css'/>" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">
	$(function(){
	
		$('form[name=frmBoardDelete]').submit(function(){
			if($('#freePwd').length>0 && $('#freePwd').val()==""){
				alert('비밀번호를 입력하세요');
				$('#freePwd').focus();
				return false;
			}
		});
		
	});
</script>
<div class="site-board-title wow fadeIn animated" data-wow-delay=".5s">
	<h1 class="col-center">게시판 이름</h1>
</div>

<div class="site-board wow fadeIn animated" data-wow-delay=".5s">
	<div class="container">
		<div class="col-md-6 col-md-offset-3">
			<div class="board-inner">
				<form name="frmBoardDelete" method="post" action="#">
					<input type="hidden" name="freeNo" value="${vo.freeNo }">
					<div class="form-group">
						<h3>글 삭제</h3>
					</div>
					<c:choose>
						<c:when test="${!hidePwd}">
							<div class="form-group">
								비밀번호를 입력하세요.
							</div>
							<div class="form-group">
								<label for="freePwd">비밀번호</label>
								<input type="password" class="form-control" id="freePwd" name="freePwd">
							</div>
						</c:when>
						<c:otherwise>
							<div class="form-group">
								삭제하시겠습니까?
							</div>
						</c:otherwise>
					</c:choose>
					<div class="col-center form-group">
						<input type="submit" class="btn btn-danger" value="삭제">
						<a href="<c:url value='/board/list.do'/>" class="btn btn-default">취소</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--//BoardPage-->
	
<%@include file="../inc/footer.jsp" %>