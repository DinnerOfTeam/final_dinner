<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>

<!--BoardList-page -->
<link href="<c:url value='/css/site-board.css'/>" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">
	$(function(){
		$('form[name=frmBoardSearch]').submit(function(){
			if($('#boardSearchKeyword').val()==""){
				alert("검색어를 입력하세요")
				$('#boardSearchKeyword').focus();
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
			<div class="board-list">
				<div class="row board-list-header hidden-xs">
					<div class="col-xs-1">번호</div>
					<div class="col-xs-6">제목</div>
					<div class="col-xs-2">글쓴이</div>
					<div class="col-xs-2">날짜</div>
					<div class="col-xs-1">조회</div>
				</div>
				<div class="row board-list-body">
					<div class="row board-list-row">
						<a href="<c:url value='/board/detail.do'/>">
							<div class="col-sm-1 hidden-xs">1</div>
							<div class="board-list-title col-xs-12 col-sm-6">제목</div>
							<div class="board-list-writer col-xs-4 col-sm-2">Tester</div>
							<div class="board-list-date col-xs-4 col-xs-offset-4 col-sm-2 col-sm-offset-0">2017-02-02</div>
							<div class="col-sm-1 hidden-xs">3</div>
						</a>
					</div>
					<div class="row board-list-nodata">
						<span>글이 없습니다.</span>
					</div>
				</div>
				<div class="visible-xs">
					<ul class="pager">
						<li class="previous"><a href="#">← 이전 글 </a></li>
						<li class="current"><span>1</span></li>
						<li class="next"><a href="#">다음 글 →</a></li>
					</ul>
				</div>
				<div class="board-list-sub col-xs-12 col-sm-4 col-sm-offset-8 col-md-1 col-md-offset-11">
					<a class="btn btn-default btn-block" href="<c:url value='/board/write.do'/>" role="button">글쓰기</a>
				</div>
				<div class="board-list-sub col-xs-12 hidden-xs">
					<ul class="pagination">
						<li>
							<a href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li>
							<a href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</div>
				<div class="board-list-sub">
					<form name="frmBoardSearch" method="get" action="<c:url value='/board/list.do'/>">
						<div class="board-search-type form-group col-sm-2 col-sm-offset-3">
							<select class="form-control" name="boardSearchType">
								<option value="title">제목</option>
								<option value="contents">내용</option>
								<option value="writer">작성자</option>
							</select>
						</div>
						<div class="board-search-keyword input-group col-sm-4">
							<input type="text" class="form-control" id="boardSearchKeyword" name="boardSearchKeyword" placeholder="Search">
							<span class="input-group-btn">
								<input type="submit" class="btn btn-default" value="검색">
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!--//BoardList-->	

<%@include file="../inc/footer.jsp" %>	