<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>

<!--Board-page -->
<link href="<c:url value='/css/site-board.css'/>" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">
	$(function(){
		$('.btn-file-del').click(function(){
			$(this).parent().parent().remove();
		});
		
		var $fileRow=$('.site-fileup-list').find('.site-fileup-row').clone(true);
	
		$('.btn-file-add').click(function(){
			$(this).parent().parent().find('.site-fileup-list').append($fileRow.clone(true));
		});
		
		$('form[name=frmBoardWrite]').submit(function(){
			if($('#boardTitle').val()==""){
				alert('제목을 입력하세요');
				$('#boardTitle').focus();
				return false;
			}else if($('#boardName').length>0 && $('#boardName').val()==""){
				alert('이름을 입력하세요');
				$('#boardName').focus();
				return false;
			}else if($('#boardPwd').length>0 && $('#boardPwd').val()==""){
				alert('비밀번호를 입력하세요');
				$('#boardPwd').focus();
				return false;
			}
		});
		
	});
</script>
<div class="site-board-title">
	<h1 class="col-center">게시판 이름</h1>
</div>
<div class="site-board">
	
	<div class="container">
		
		<div class="col-md-8 col-md-offset-2">
			<div class="board-inner">
				<form name="frmBoardWrite" method="post" action="<c:url value='/board/write.do'/>" enctype="multipart/form-data">
					<div class="form-group">
						<label for="boardTitle">제목</label>
						<input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목">
					</div>
					<div class="form-group">
						<label for="boardName">이름</label>
						<input type="text" class="form-control" id="boardName" name="boardName" placeholder="이름">
					</div>
					<div class="form-group">
						<label for="boardPwd">비밀번호</label>
						<input type="password" class="form-control" id="boardPwd" name="boardPwd">
					</div>
					<div class="form-group">
						<textarea class="form-control" rows="10" name="commentContents"></textarea>
					</div>
					<div class="row form-group">
						<label class="col-xs-9">첨부파일</label>
						<div class="col-xs-3">
							<input type="button" class="btn-file-add btn btn-default btn-xs btn-block" value="추가">
						</div>
						<div class="site-fileup-list">
							<div class="site-fileup-row">
								<div class="col-xs-9">
									<input type="file" name="boardFile">
								</div>
								<div class="col-xs-3">
									<input type="button" class="btn-file-del btn btn-danger btn-xs btn-block" value="삭제">
								</div>
							</div>
						</div>
					</div>
					<div class="col-center form-group">
						<input type="submit" class="btn btn-default" value="작성">
						<a href="<c:url value='/board/list.do'/>" class="btn btn-default">목록</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--//BoardPage-->
	
<%@include file="../inc/footer.jsp" %>