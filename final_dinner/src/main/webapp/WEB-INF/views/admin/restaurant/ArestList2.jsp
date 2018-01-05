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
</style>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<h1 align="center" style="color: #428bca">Restaurant Table Edit</h1>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
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
								<tr>
									<td>
										<input value= '${vo.resNo }' type="hidden"/>
										<label>${vo.resName }</label>
									</td>
									<td>
										<label></label>
									</td>
									<td>
										<label>${vo.resAddressDetail }</label>
									</td>
									<td>
										<button class="btn btn-primary"
											onclick="$.editRes(${idx.count})">승인</button>
										<button class="btn btn-danger"
											onclick="$.deleteRes(${idx.count})">반려</button>
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

<div class="food-search-result wow fadeIn animated" data-wow-delay=".5s">
	<div class="container">
		<c:forEach var="vo" items="${list }">
		<div class="restaurant-search-result col-xs-12 col-sm-4">
			<a href="#">
				<div class="restaurant-search-inner">
					<div class="restaurant-search-img col-xs-4 col-sm-12">
						<c:if test="${empty vo.resThumbnail }">
						<img class= 'res_thum' src="http://placehold.it/150x150"/>
						</c:if>
						<c:if test="${!empty vo.resThumbnail }">
						<img class= 'res_thum' src="<c:url value='/upfiles/upl_images/${vo.resThumbnail }' />"/>
						</c:if>
					</div>
					<div class="restaurant-search-desc col-xs-8 col-sm-12">
						<h2>${vo.resName }</h2>
						<h4>평점 : ${vo.resGrade }/5</h4>
					</div>
					<div class= 'col-sm-12 visible-xs'>
						${vo.resIntroduce }
					</div>
				</div>
			</a>
		</div>
		</c:forEach>
	</div>
</div>