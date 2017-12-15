<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		
		$('.comments-act > a').click(function(){
			var width=600;
			var height=450;
			
			var top=($(window).height()/2)-(height/2);
			var left=($(window).width()/2)-(width/2);
			
			
			
			event.preventDefault();
			window.open($(this).attr("href"), 'commentsAct',
				'width='+width+'px, height='+height+'px,'
				+'top='+top+', left='+left+', location=yes, resizable=yes');
		});
		
	});
</script>
<div class="site-board-title wow fadeIn animated" data-wow-delay=".5s">
	<h1 class="col-center">게시판 이름</h1>
</div>

<div class="site-board wow fadeIn animated" data-wow-delay=".5s">
	
	<div class="container">
		
		<div class="board-inner">
			<div class="row board-detail-title">
				<h3 class="col-left col-xs-12 col-sm-8">${vo.freeTitle }</h3>
			</div>
			<div class="row board-detail-sub">
				<div class="col-left col-xs-6">${vo.freeName }</div>
				<div class="col-right col-xs-6"><fmt:formatDate value="${vo.freeRegdate }" pattern="yyyy-MM-dd hh:mm" /></div>
			</div>
			<div class="row board-detail-file">
				<div class="col-right">
					<a href="#" class="board-detail-file-btn">첨부파일(3)</a>
					<div class="board-detail-file-list">
						<ul>
							<li><a href="#">file1.dat</a></li>
							<li><a href="#">file2.dat</a></li>
							<li><a href="#">file3.dat</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row board-detail-content">
				<div class="col-xs-12">${vo.freeContents }</div>
			</div>
			<div class="col-left">
				<a href="<c:url value='/board/edit.do?freeNo=${vo.freeNo }'/>" class="btn btn-default btn-sm">수정</a>
				<a href="<c:url value='/board/delete.do?freeNo=${vo.freeNo }'/>" class="btn btn-default btn-sm">삭제</a>
				<a href="<c:url value='/board/list.do'/>" class="btn btn-default btn-sm">목록</a>
			</div>
			<div class="row board-detail-comments">
				<h4>Comments</h4>
				<div class="board-detail-comments-list">
					<c:choose>
						<c:when test="${empty commentList }">
							<div class="board-detail-comments-row board-detail-comments-nodata">
								<p class="col-center">댓글이 없습니다</p>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="cVO" items="${commentList }">
								<div class="board-detail-comments-row"
										style="margin-left: ${(cVO.commentStep-1)*1.5}em;">
									<c:choose>
										<c:when test="${cVO.commentDelFlag=='N' }">
											<div class="board-detail-comments-sub">
												<div class="col-left col-sm-8">
													${cVO.commentName}
													<span><fmt:formatDate value="${cVO.commentRegdate}" pattern="yyyy-MM-dd hh:mm" /></span>
												</div>
												<div class="comments-act col-right col-sm-4">
													<a href="<c:url value='/board/comment/reply.do?freeNo=${vo.freeNo }&commentNo=${cVO.commentNo}'/>">답글</a>
													|
													<a href="<c:url value='/board/comment/edit.do?commentNo=${cVO.commentNo}'/>">수정</a>
													|
													<a href="<c:url value='/board/comment/delete.do?commentNo=${cVO.commentNo}'/>">삭제</a>
												</div>
											</div>
											<div class="board-detail-comments-contents">
												${cVO.commentContents}
											</div>
										</c:when>
										<c:otherwise>
											<div class="board-detail-comments-del">
												<p>삭제된 댓글입니다.</p>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="board-detail-comments-write">
					<form class="board-comment-frm" name="frmBoardComment" method="post" action="<c:url value='/board/comment/write.do'/>">
						<input type="hidden" name="freeNo" value="${vo.freeNo }">
						<c:if test="${empty sessionScope.memId}">
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
						</c:if>
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

<c:import url="/board/list.do">
	<c:param name="freeNo" value="${vo.freeNo }"/>
	<c:param name="isImport" value="yes"/>
	<c:param name="hideStyle" value="yes"/>
</c:import>
<!--//BoardPage-->
	
<%@include file="../inc/footer.jsp" %>	