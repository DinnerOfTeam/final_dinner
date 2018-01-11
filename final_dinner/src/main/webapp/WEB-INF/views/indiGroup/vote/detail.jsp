<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath }/css/codestyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css" media="all" />
<script src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('input#vote').click(function() {
			var count= 0;
			$('form').find('input[name=itemNo]').each(function() {
				if($(this).is(':checked')) {
					count++;
				}
			});
			if(count== 0) {
				alert('항목을 선택하세요.');
				return false;
			}
		});
		
		$('input[name=cancel]').click(function() {
			window.close();
		});
	});
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
						
						<c:if test="${isVoted== false }">
						<c:forEach var="vi" items="${list}" varStatus="sta">
							<c:if test="${vo.voteMultiSel.equals('N')}">
							<label>
								<input type="radio" name="itemNo" value="${vi.voteItemNo}"
									<c:if test= "${sta.index== 0 }">
										checked
									</c:if>
								/>
								${vi.itemTitle}</label>
							</c:if>
							<c:if test="${vo.voteMultiSel.equals('Y')}">
								<label>
								<input type="checkbox" name="itemNo" value="${vi.voteItemNo}"/>
								${vi.itemTitle}</label>
							</c:if>
						</c:forEach>
						</c:if>
						<c:if test="${isVoted== true }">
							<c:forEach var="vl" items="${voted_list }">
								<label>${vl.itemTitle }[${vl.selcNum }표]</label>
							</c:forEach>
						</c:if>
						
						<div class="form-row">
						<div class="col-sm-6">
							<c:if test="${isVoted== false }">
							<input type="submit" name="Sign In" id="vote" class="site-btn-submit" value="투표하기">
							</c:if>
							<input type="reset" name="cancel" class="site-btn" value="닫기">
							<%-- <a href="<c:url value='/indiGroup/vote/list.do?groupNo=${vo.groupNo }'/>" class="site-btn site-btn-full">목록</a> --%>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>