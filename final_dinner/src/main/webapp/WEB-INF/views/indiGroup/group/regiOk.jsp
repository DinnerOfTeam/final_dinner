<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/indigroupSide.jsp" %>
<script type="text/javascript">
	$(function() {
		$('th input[type=checkbox]').click(function() {
			$('td input[type=checkbox]').prop('checked', this.checked);
		});
		$('input.regi_ok').click(function() {
			var no= $(this).parent().prevAll('td').last().find('input[type=checkbox]').val();
			$(this).parent().prevAll('td').last().find('input[type=checkbox]').prop('checked', true);
/* 			alert(no); */
			$('form#groupRegi').find('input#is_ok').val('Y');
			$('form#groupRegi').submit();
		});
		$('input.regi_no').click(function() {
			var no= $(this).parent().prevAll('td').last().find('input[type=checkbox]').val();
			$(this).parent().prevAll('td').last().find('input[type=checkbox]').prop('checked', true);
			$('form#groupRegi').find('input#is_ok').val('N');
			$('form#groupRegi').submit();
		});
	});
</script>
<style type="text/css">
	legend> a {
		color: black;
	}
</style>
	
	<div class="row fadeInUp animated" data-wow-delay=".5s">
		<form name="groupRegi" id= 'groupRegi' method="post" action="<c:url value='/indiGroup/regiOk.do' />" >
			<fieldset class='border_fieldset'>
				<legend><a href="<c:url value='/indiGroup/chat/main.do?groupNo=${param.groupNo }' />">${group.groupName }</a>그룹 가입신청 명단</legend>
			<table class= 'table tb_hover'>
				<thead>
				<tr class= 'text_center'>
					<th><input type="checkbox" id="inlineCheckbox1" value="option1"></th>
					<th>번호</th>
					<th>가입자 이름</th>
					<th>승인</th>
					<th>반려</th>
				</tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr><td colspan="5">가입 신청이 없습니다</td></tr>
					</c:if>
					<c:forEach var="vo" items="${list }" varStatus="status" >
						<tr>
							<td><input type="checkbox" name="memNo" value="${vo.memNo }"></td>
							<td>${status.count }</td>
							<td>${vo.memName }</td>
							<td><input type="button" name="regi_ok" class= 'regi_ok' class="site-btn-submit" value="승인" /></td>
							<td><input type="button" name="regi_no" class= 'regi_no' class="site-btn-submit" value="반려" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class= 'text_right'>
				<input type="submit" name="ok_all" class="site-btn-submit" value="선택 모두승인">
				<input type="submit" name="no_all" class="site-btn-submit" value="선택 모두반려">
			</div>
			</fieldset>
			<input type="hidden" name="groupNo" value="${param.groupNo }" />
			<input type="hidden" name="is_ok" id='is_ok' value='' />
		</form>
	</div>

			</div>
		</div>
	</article>
<%@ include file="../../inc/footer.jsp" %>