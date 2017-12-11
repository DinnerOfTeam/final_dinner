<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>

<!--Board-page -->
<link href="<c:url value='/css/site-board.css'/>" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">
	$(function(){
		$('.board-detail-file-list').hide();
		$('.board-detail-file-btn').click(function(){
			event.preventDefault();
			$(this).next().toggle();
		});
		
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
<div class="site-board-title">
	<h1 class="col-center">게시판 이름</h1>
</div>
<div class="site-board">
	
	<div class="container">
		
		<div class="board-inner">
			<div class="row board-detail-title">
				<h3 class="col-left col-xs-12 col-sm-8">Test title</h3>
				<div class="col-right col-xs-12 col-sm-4">2017-01-01 20:30</div>
			</div>
			<div class="row board-detail-sub">
				<div class="col-left col-xs-6">Tester</div>
				<div class="col-right col-xs-6">조회수 : 3</div>
			</div>
			<div class="row board-detail-file">
				<div class="col-right">
					<a href="#" class="board-detail-file-btn">첨부파일(3)</a>
					<div class="board-detail-file-list">
						<ul>
							<li>file1.dat (0.1M)</li>
							<li>file2.dat (0.2M)</li>
							<li>file3.dat (0.3M)</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row board-detail-content">
				<div class="col-xs-12">asdf</div>
			</div>
			<div class="col-left">
				<a href="#" class="btn btn-default btn-sm">수정</a>
				<a href="#" class="btn btn-default btn-sm">삭제</a>
				<a href="<c:url value='/board/list.do'/>" class="btn btn-default btn-sm">목록</a>
			</div>
			<div class="row board-detail-comments">
				<h4>Comments</h4>
				<div class="board-detail-comments-list">
					<div class="board-detail-comments-row">
						<div class="board-detail-comments-sub">
							<div class="col-left col-xs-8">
								Tester
								<span>2017-01-01 20:33</span>
							</div>
							<div class="col-right col-xs-4">
								<a href="#">수정</a>
								|
								<a href="#">삭제</a>
							</div>
						</div>
						<div class="board-detail-comments-contents">
							comment test
						</div>
					</div>
				</div>
				<div class="board-detail-comments-write">
					<form class="board-comment-frm" name="frmBoardComment" method="post" action="#">
						<div class="board-comments-form-top">
							<div class="col-sm-6 form-group">
								<label for="commentName" class="col-sm-4 col-md-3">이름</label>
								<div class="col-sm-8 col-md-9">
									<input type="text" class="form-control" id="commentName" name="commentName" placeholder="이름">
								</div>
							</div>
							<div class="col-sm-6 form-group">
								<label for="commentPwd" class="col-sm-4 col-md-3">비밀번호</label>
								<div class="col-sm-8 col-md-9">
									<input type="password" class="form-control" id="commentPwd" name="commentPwd">
								</div>
							</div>
						</div>
						<div class="form-group">
							<textarea class="form-control" rows="5" id="commentContents" name="commentContents"></textarea>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-default btn-block" value="작성">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!--//BoardPage-->
	
<%@include file="../inc/footer.jsp" %>	