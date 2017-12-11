<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>

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
<div class="site-board-title wow fadeInUp animated"
		data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
	<h1 class="col-center">게시판 이름</h1>
</div>

<div class="site-board wow fadeInUp animated"
		data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
	<div class="container">
		<div class="col-md-6 col-md-offset-3">
			<div class="board-inner">
				<form name="frmBoardDelete" method="post" action="#">
					<div class="form-group">
						<h3>글 삭제</h3>
					</div>
					<div class="form-group">
						비밀번호를 입력하세요.
					</div>
					<div class="form-group">
						<label for="freePwd">비밀번호</label>
						<input type="password" class="form-control" id="freePwd" name="freePwd">
					</div>
					<div class="col-center form-group">
						<input type="submit" class="btn btn-danger" value="삭제">
						<a href="#" class="btn btn-default">취소</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--//BoardPage-->
	
<%@include file="../inc/footer.jsp" %>