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
		
		$('form[name=frmBoardComment]').submit(function(){
			if($('#commentName').length>0 && $('#commentName').val()==""){
				alert('이름을 입력하세요');
				$('#commentName').focus();
				return false;
			}else if($('#commentPwd').length>0 && $('#commentPwd').val()==""){
				alert('비밀번호를 입력하세요');
				$('#commentPwd').focus();
				return false;
			}else if($('#commentContents').val()==""){
				alert('내용을 입력하세요');
				$('#commentContents').focus();
				return false;
			}
		});
		
	});
</script>
</head>
<body>
<div class="site-board">
<div class="container">
	<div class="board-inner">
		<div class="board-detail-comments-write">
			<form class="board-comment-frm" name="frmBoardComment" method="post" action="<c:url value='/board/comment/edit.do'/>">
				<input type="hidden" name="freeNo" value="${vo.freeNo }">
				<input type="hidden" name="commentNo" value="${vo.commentNo }">
				<c:if test="${vo.memNo==0 and !empty vo.commentPwd }">
					<div class="form-group">
						<label>이름</label>
						<p class="form-control-static">${vo.commentName }</p>
						<input type="hidden" value="${vo.commentName }">
					</div>
					<div class="form-group">
						<label for="commentPwd">비밀번호</label>
						<input type="password" class="form-control" id="commentPwd" name="commentPwd">
					</div>
				</c:if>
				<div class="form-group">
					<textarea class="form-control" rows="5" id="commentContents" name="commentContents">${vo.commentContents }</textarea>
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-default btn-block" value="작성">
				</div>
			</form>
		</div>
	</div>
</div>
</div>
</body>
</html>