<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/indigroupSide.jsp" %>
<script type="text/javascript">
	$(function() {
		$('th input[type=checkbox]').click(function() {
			$('td input[type=checkbox]').prop('checked', this.checked);
		});
	});
</script>
	
	<div class="row fadeInUp animated" data-wow-delay=".5s">
		<form name="" method="post" >
			<fieldset class='border_fieldset'>
				<legend>${group.groupName }그룹 가입신청 명단</legend>
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
					<c:forEach var="vo" items="${list }" varStatus="status" >
						<tr>
							<td><input type="checkbox" id="inlineCheckbox1" value="option1"></td>
							<td>${status.count }</td>
							<td>${vo.memName }</td>
							<td><input type="submit" name="Sign In" class="site-btn-submit" value="승인"></td>
							<td><input type="submit" name="Sign In" class="site-btn-submit" value="반려"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class= 'text_right'>
				<input type="submit" name="Sign In" class="site-btn-submit" value="전체승인">
				<input type="submit" name="Sign In" class="site-btn-submit" value="전체반려">
			</div>
			</fieldset>
		</form>
			<div class='page_div'>
				<ul class= 'pagination'>
					<li><a aria-label='Previous'><i class="fa fa-angle-left"></i></a></li>
					<li><a>1</a></li>
					<li><a>2</a></li>
					<li><a>3</a></li>
					<li><a aria-label='Next'><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>
	</div>

			</div>
		</div>
	</article>
<%@ include file="../../inc/footer.jsp" %>