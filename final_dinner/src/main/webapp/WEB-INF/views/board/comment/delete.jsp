<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>댓글수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap-css -->
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/site-board.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath }/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href="//fonts.googleapis.com/css?family=Arimo" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Dosis:300,400,500,600" rel="stylesheet">
<!-- //font -->
<script src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script type="text/javascript">
	$(function(){
	
		$('form[name=frmCommentDelete]').submit(function(){
			if($('#commentPwd').length>0 && $('#commentPwd').val()==""){
				alert('비밀번호를 입력하세요');
				$('#commentPwd').focus();
				return false;
			}
		});
		
		$('#comment-btn-cancel').click(function(){
			event.preventDefault();
			self.close();
		});
		
	});
</script>
</head>
<body>
<div class="site-board">
	<div class="container">
		<div class="board-inner">
			<form name="frmCommentDelete" method="post" action="<c:url value='/board/comment/delete.do'/>">
				<input type="hidden" name="commentNo" value="${param.commentNo }">
				<div class="form-group">
					<h3>댓글 삭제</h3>
				</div>
				<c:choose>
					<c:when test="${!hidePwd}">
						<div class="form-group">
							비밀번호를 입력하세요.
						</div>
						<div class="form-group">
							<label for="commentPwd">비밀번호</label>
							<input type="password" class="form-control" id="commentPwd" name="commentPwd">
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
					<a href="#" class="btn btn-default" id="comment-btn-cancel">취소</a>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>