<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--Board-page -->
<link href="<c:url value='/css/site-board.css'/>" rel="stylesheet" type="text/css" media="all" />
<script src="<c:url value='/ckeditor/ckeditor.js'/>"></script>

<script type="text/javascript">
$(function(){
	$('.btn-file-del').click(function(){
		$(this).parent().parent().remove();
	});
	
	var $fileRow=$('.site-fileup-list').find('.site-fileup-row').eq(0).clone(true);
	$fileRow.find('input[type=file]').val('');
	
	$('.btn-file-add').click(function(){
		$(this).parent().parent().find('.site-fileup-list').append($fileRow.clone(true));
	});
	
	$('form[name=frmBoardWrite]').submit(function(){
		if($('#freeTitle').val()==""){
			alert('제목을 입력하세요');
			$('#freeTitle').focus();
			return false;
		}else if($('#freePwd').length>0 && $('#freePwd').val()==""){
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

<div class="site-board form-wrap wow fadeIn animated" data-wow-delay=".5s">
	<div class="container">
		<div class="form-body">
			<div class="form-heading">
				<h1>글수정</h1>
			</div>
			<div class="form-info">
				<form name="frmBoardWrite" method="post" action="<c:url value='/board/edit.do'/>"
						enctype="multipart/form-data">
					<input type="hidden" name="freeNo" value="${vo.freeNo }">
					<label for="freeTitle" class="sr-only">제목</label>
					<input type="text" class="form-text" id="freeTitle" name="freeTitle"
						placeholder="제목" value="${vo.freeTitle }" required>
						
					<c:if test="${vo.memNo==0 and !empty vo.freePwd }">
					<label for="freeName" class="sr-only">이름</label>
					<p class="form-static">${vo.freeName }</p>
					<input type="hidden" name="freeName" value="${vo.freeName }">
					
					<label for="freePwd" class="sr-only">비밀번호</label>
					<input type="password" id="freePwd" name="freePwd" class="form-text" placeholder="비밀번호" required>
					</c:if>
					
					<div class="form-group">
						<label for="freeContents" class="sr-only">내용</label>
						<textarea class="form-text board-write " id="freeContents" name="freeContents"
							placeholder="내용">${vo.freeContents }</textarea>
						<script>
							CKEDITOR.replace('freeContents', {
								width:'100%',
								height:'35em',
								filebrowserImageUploadUrl: '${pageContext.request.contextPath}/ckeditor/upload.do'
							});
						</script>
					</div>
					
					<c:if test="${!empty fileMap.list }">
						<div class="form-group">
							<label>삭제할 파일</label>
							<c:forEach var="vo" items="${fileMap.list }">
								<div class="checkbox">
									<label>
										<input type="checkbox" name="deleteFile"value="${vo.freeDataNo }">
										${vo.freeDataOriginalName }
									</label>
								</div>
							</c:forEach>
						</div>
					</c:if>
					
					<div class="row form-group">
						<label class="col-xs-9">첨부파일</label>
						<div class="col-xs-3">
							<input type="button" class="btn-file-add site-btn-submit btn-block" value="추가">
						</div>
						<div class="site-fileup-list">
							<div class="site-fileup-row">
								<div class="col-xs-9">
									<input type="file" name="boardFile">
								</div>
								<div class="col-xs-3">
									<input type="button" class="btn-file-del site-btn btn-block" value="삭제">
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-row">
						<div class="col-sm-6">
							<input type="submit" class="site-btn-submit site-btn-full" value="수정">
						</div>
						<div class="col-sm-6">
							<a href="<c:url value='/board/list.do'/>" class="site-btn site-btn-full">목록</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--//BoardPage-->
	
<%@include file="../inc/footer.jsp" %>