<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<c:import url="../../inc/indigroupSide.jsp" />
<script type="text/javascript">
	$(function() {
		$('.btRegi').click(function() {
			var groupNo= $(this).next('input').val();
			var groupName= $(this).parent().next('td').text();
			if(confirm(groupName+ '에 가입신청하시겠습니까?')) {
				$('#groupNo').val(groupNo);
				$('#memNo').val(${sessionScope.memNo});
				$('form#frm_regiGroup').submit();
			}
		});
	});
</script>
				<div class= 'col-md-3'>
					<h4>그룹 검색</h4>
					<form action="<c:url value= '/indiGroup/regi.do' />" method="post">
						<fieldset>
							<input type="text" placeholder="그룹명" id='groupName' 
									name= 'groupName' size="12" value="${param.groupName }"/>
							<input type="submit" value= '검색' />
						</fieldset>
					</form>
					<form id='frm_regiGroup' action="<c:url value='/indiGroup/regiGroup.do' />" method="post">
						<input type="hidden" id='groupNo' name='groupNo'>
						<input type="hidden" id='memNo' name='memNo'>
					</form>
				</div>
				<div class= 'col-md-9'>
					<h4>그룹 목록</h4>
					<table class= 'table'>
						<tr>
							<th>신청</th>
							<th>그룹이름</th>
							<th>그룹장</th>
							<th>설명</th>
						</tr>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td><button class= 'btRegi'>신청</button>
								<input type="hidden" value='${vo.groupNo }'></td>
								<td>${vo.groupName }</td>
								<td>${vo.memName }</td>
								<td>${vo.groupInfo }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</article>
<%@ include file="../../inc/footer.jsp" %>