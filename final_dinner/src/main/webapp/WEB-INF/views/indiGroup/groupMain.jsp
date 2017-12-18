<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/indigroupSide.jsp" %>
<style type="text/css">
	div.groupList {
		border: 1px solid silver;
		padding-bottom: 50px;
	}
	div.groupInfo {
		margin-bottom: 10px;
	}
	div.groupList a {
		color: #353535;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('.groupList a').click(function() {
			var groupNo= $(this).next('input[type=hidden]').val();
			location.href= "<c:url value='/indiGroup/main.do?groupNo="+ groupNo+ "' />";
		});
	});
</script>
	<c:if test="${empty list }">
		<div class= 'col-md-12'>가입한 그룹이 없습니다</div>
	</c:if>
	<c:forEach var="vo" items="${list }">
		<div class= 'col-md-4 groupList'>
			<div class= 'groupInfo'><img alt="그룹 이미지" src="<c:url value='/images/group.png' />"> </div>
			<div>
				<span class= 'sp'>그룹명 / 그룹원수</span>
			</div>
			<a href= "#" class= 'hover'>
				${vo.groupName } <span class="badge badge-primary">${vo.numGroupMember }</span>
			</a>
			<input type="hidden" value= '${vo.groupNo }'>
		</div>
	</c:forEach>

<%@ include file="../inc/footer.jsp" %>