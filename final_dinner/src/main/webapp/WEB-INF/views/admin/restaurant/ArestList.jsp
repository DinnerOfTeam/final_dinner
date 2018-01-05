<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/restaurant.js"></script>
<style type="text/css">

.restaurant-search-inner{
	width: 100%;
	background-color: white;
	margin: 15px 0;
	box-shadow: 0 0 0.25em 0.0005em #999;
	overflow: hidden;
	color: black;
}

.restaurant-search-inner:hover{
	background-color: #EEE;
}

.restaurant-search-inner > *{
	padding: 0;
}

.restaurant-search-inner > .restaurant-search-img > img{
	width: 20vw;
	height: 20vw;
}

.restaurant-search-inner > .restaurant-search-desc, .restaurant-search-inner > .restaurant-search-img{
	padding: 0.5em;
}

.restaurant-search-inner > .restaurant-search-desc > *{
	margin: 0.1em 0 0.25em 0;
}
img.res_thum {
	height: auto;
}
div.align_right {
	text-align: right;
}
</style>
<script type="text/javascript">
	$(function() {
		$('tr.tr_red').find('td label').css('color', 'red');
		$('tr.tr_blue').find('td label').css('color', 'blue');
	});
</script>



<div>
	<h1 align="center" style="color: #428bca">Restaurant Table Edit</h1>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<div class="align_right">
						<span class= 'badge badge-primary'>승인대기중</span>
						<span class= 'badge badge-danger'>반려됨</span>
					</div>
					<table id="mytable_res" class="table table-bordered">
<%-- 						<colgroup>
							<col style="width: 13%">
							<col style="width: 17%">
							<col style="width: *">
							<col style="width: 13%">
						</colgroup> --%>
						<thead><tr>
							<th>업체명</th>
							<th>이메일</th>
							<th>업체주소</th>
							<th>업체관리</th>
						</tr></thead>

						<tbody>
							<c:forEach var="vo" items="${list }" varStatus="idx">
								<c:if test="${vo.resStatus== 'ban' }">
									<tr class= 'tr_red'>
								</c:if>
								<c:if test="${vo.resStatus!= 'ban' }">
									<tr class= 'tr_blue'>
								</c:if>
									<td>
										<input value= '${vo.resNo }' type="hidden"/>
										<label>${vo.resName }</label>
									</td>
									<td>
										<c:if test="${!empty vo.memEmail1 }">
											<label>${vo.memEmail1 }@${vo.memEmail2 }</label>
										</c:if>
									</td>
									<td>
										<label>${vo.resAddressDetail }</label>
									</td>
									<td>
										<button class="btn btn-primary"
											onclick="$.approveRes(${idx.count})">승인</button>
										<button class="btn btn-danger"
											onclick="$.banRes(${idx.count})">반려</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
</div>