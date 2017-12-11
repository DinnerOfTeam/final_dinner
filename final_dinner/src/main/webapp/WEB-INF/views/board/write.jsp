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
		$('.site-fileup-list').empty();
		
		$('.btn-file-add').click(function(){
			$(this).parent().parent().find('.site-fileup-list').append($fileRow.clone(true));
		});
		
		$('form[name=frmBoardWrite]').submit(function(){
			if($('#freeTitle').val()==""){
				alert('제목을 입력하세요');
				$('#freeTitle').focus();
				return false;
			}else if($('#freeName').length>0 && $('#freeName').val()==""){
				alert('이름을 입력하세요');
				$('#freeName').focus();
				return false;
			}else if($('#freePwd').length>0 && $('#freePwd').val()==""){
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
		
		<div class="col-md-8 col-md-offset-2">
			<div class="board-inner">
				<form name="frmBoardWrite" method="post" action="<c:url value='/board/write.do'/>" enctype="multipart/form-data">
					<div class="form-group">
						<label for="freeTitle">제목</label>
						<input type="text" class="form-control" id="freeTitle" name="freeTitle" placeholder="제목">
					</div>
					<div class="form-group">
						<label for="freeName">이름</label>
						<input type="text" class="form-control" id="freeName" name="freeName" placeholder="이름">
					</div>
					<div class="form-group">
						<label for="freePwd">비밀번호</label>
						<input type="password" class="form-control" id="freePwd" name="freePwd">
					</div>
					<div class="form-group">
						<label for="freeContents">내용</label>
						<textarea class="form-control" rows="10" id="freeContents" name="freeContents"></textarea>
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