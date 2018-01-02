<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $eventTitle=$("#eventTitle");
		var eventContents=CKEDITOR.instances.eventContent;
		var $eventStartDate=$("#eventStartDate");
		var $eventEndDate=$("#eventEndDate");
		
		$('form[name=frmEventWrite]').submit(function(){
			if($eventTitle.val()==''){
				alert("제목을 입력하세요");
				$eventTitle.focus();
				return false;
			}else if(eventContents.getData()==''){
				alert("내용을 입력하세요");
				eventContents.focus();
				return false;
			}else if($eventStartDate.val()==''){
				alert("시작일을 입력하세요");
				$eventStartDate.focus();
				return false;
			}else if($eventEndDate.val()==''){
				alert("종료일을 입력하세요");
				$eventEndDate.focus();
				return false;
			}
		});
		
		function setDatepicker(sel){
			sel.datepicker({
				dateFormat: 'yy-mm-dd'
			});
		}
		
		setDatepicker($eventStartDate);
		setDatepicker($eventEndDate);
	});
</script>

<%@include file="../inc/mypageSide.jsp" %>

	<div class="form-body" style="width: 100%;">
		<div class="form-heading">
			<h1>이벤트 신청</h1>
		</div>
		<div class="form-info">
			<form name="frmEventWrite" method="post" action="<c:url value='/member/event/writeEvent.do'/>"
					enctype="multipart/form-data">
				<label for="eventTitle" class="sr-only">제목</label>
				<input type="text" class="form-text" id="eventTitle" name="eventTitle" placeholder="제목" required>
				
				<div class="form-group">
					<label for="eventContents" class="sr-only">내용</label>
					<textarea class="form-text " id="eventContent" name="eventContent" placeholder="내용"></textarea>
					<script>
						CKEDITOR.replace('eventContent', {
							width:'100%',
							height:'35em',
							filebrowserImageUploadUrl: '${pageContext.request.contextPath}/ckeditor/upload.do'
						});
					</script>
				</div>
				
				<div class="form-group">
					<label for="resThumb">미리보기 이미지</label>
					<input type="file" name="resThumbnail" id="resThumb">
					<p>미리보기 이미지는 5:3 비율의 이미지를 권장합니다</p>
				</div>
				
				<div class="row form-group">
					<div class="col-sm-6">
						<label for="eventStartDate" class="sr-only">시작일</label>
						<input type="text" class="form-text" id="eventStartDate" name="eventStartStr" placeholder="시작일" required>
					</div>
					
					<div class="col-sm-6">
						<label for="eventStartDate" class="sr-only">종료일</label>
						<input type="text" class="form-text" id="eventEndDate" name="eventEndStr" placeholder="종료일" required>
					</div>
				</div>
				
				<div class="form-row">
					<div class="col-sm-6">
						<input type="submit" class="site-btn-submit site-btn-full" value="작성">
					</div>
					<div class="col-sm-6">
						<a href="<c:url value='/board/list.do'/>" class="site-btn site-btn-full">목록</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!--//BoardPage-->
	
<%@include file="../inc/footer.jsp" %>