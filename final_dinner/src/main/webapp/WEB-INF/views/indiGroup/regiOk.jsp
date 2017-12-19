<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/indigroupSide.jsp" %>
	
	<div class="row fadeInUp animated" data-wow-delay=".5s">
		<fieldset class='border_fieldset'>
			<legend></legend>
		<table class= 'table tb_hover'>
			<thead>
			<tr>
				<th>번호</th>
				<th>가입자 이름</th>
				<th>승인</th>
				<th>반려</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.groupRegiNo }</td>
						<td>${vo.memName }</td>
						<td><input type="button" value="승인"></td>
						<td><input type="button" value="반려"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</fieldset>
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
<%@ include file="../inc/footer.jsp" %>