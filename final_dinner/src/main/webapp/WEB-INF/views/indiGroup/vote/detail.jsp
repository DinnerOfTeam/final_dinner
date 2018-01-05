<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath }/css/codestyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css" media="all" />
<script type="text/javascript">
	$(document).ready(function(){
		$('#vote').click(function(){
			if($('#itemTitle').val()==""){
				alert('항목을선택하여주세요');
				$('#itemTitle').focus();
			}
		});
	});
	
	function cls(){
		window.close();
	}
</script>
<style>
	.form-body{
		width: 100%;
		height: 100%;
	}
</style>

<div class="form-wrap">
		<div class="container">
			<div class="form-body">
				<div class="form-heading">
					<h1>투표하기</h1>
				</div>
				<div class="form-info">
				
					<form method="post"
					action="<c:url value='/indiGroup/vote/vote.do'/>" onsubmit="return send(this)">
						<input type="hidden" name="voteNo" value="${param.voteNo}"/>
						<input type="hidden" name="groupNo" value="${param.groupNo}"/>
						<input type="text" class="form-text" name="voteTitle" value="${vo.voteTitle}" ReadOnly>
						<textarea name="voteDesc" class="form-text" ReadOnly>${vo.voteDesc}</textarea>
						
						<c:forEach var="vi" items="${list}">
							<label>
								<input type="checkbox" name="itemNo" value="${vi.voteItemNo}"/>
							${vi.itemTitle}</label>
						</c:forEach>
						
						<div class="form-row">
						<div class="col-sm-6">
							<input type="submit" name="Sign In" id="vote" class="site-btn-submit" value="투표하기">
							<input type="button" name="cancel" class="site-btn" onclick="cls()" value="닫기">
							<%-- <a href="<c:url value='/indiGroup/vote/list.do?groupNo=${vo.groupNo }'/>" class="site-btn site-btn-full">목록</a> --%>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>