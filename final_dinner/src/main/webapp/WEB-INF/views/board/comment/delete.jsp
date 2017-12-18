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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/codestyle.css" type="text/css" media="all" />
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
	<div class="board-inner">
		<div class="board-detail-comments-write form-simple">
			<form name="frmCommentDelete " method="post" action="<c:url value='/board/comment/delete.do'/>">
				<input type="hidden" name="commentNo" value="${param.commentNo }">
				<c:choose>
					<c:when test="${!hidePwd}">
						<p class="form-txt form-static">
							비밀번호를 입력하세요.
						</p>
						<label class="sr-only">비밀번호</label>
						<input type="password" id="commentPwd" name="commentPwd"
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
		
</body>
</html>