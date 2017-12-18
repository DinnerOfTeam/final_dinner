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
	<h1 class="col-center">게시판</h1>
</div>

<div class="form-wrap wow fadeIn animated" data-wow-delay=".5s">
		<div class="container">
			<div class="form-body ">
				<div class="form-heading">
					<h1>글 삭제</h1>
				</div>
				<div class="form-info">
					<form name="frmBoardDelete" method="post" action="<c:url value='/board/delete.do'/>">
						<input type="hidden" name="freeNo" value="${param.freeNo }">
						<c:choose>
							<c:when test="${!hidePwd}">
								<p class="form-txt form-static">
									비밀번호를 입력하세요.
								</p>
								<label for="freePwd" class="sr-only">비밀번호</label>
								<input type="password" id="freePwd" name="freePwd"
									class="form-text" placeholder="비밀번호">
							</c:when>
							<c:otherwise>
								<p class="form-txt form-static">
									삭제하시겠습니까?
								</p>
							</c:otherwise>
						</c:choose>
						
						<div class="form-row">
							<div class="col-sm-6 form-comp">
								<input type="submit" name="Sign In"
									class="site-btn-submit site-btn-full" value="삭제">
							</div>
							<div class="col-sm-6">
								<a href="<c:url value='/board/list.do'/>"
									class="site-btn site-btn-full">취소</a>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
<!--//BoardPage-->
	
<%@include file="../inc/footer.jsp" %>