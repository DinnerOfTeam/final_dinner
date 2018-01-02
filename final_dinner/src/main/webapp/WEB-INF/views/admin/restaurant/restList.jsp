<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	width: 100%;
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

<div class="food-search-result wow fadeIn animated" data-wow-delay=".5s">
	<div class="container">
		<c:forEach var="vo" items="${list }">
		<div class="restaurant-search-result col-xs-12 col-sm-4">
			<a href="#">
				<div class="restaurant-search-inner">
					<div class="restaurant-search-img col-xs-4 col-sm-12">
						<c:if test="${empty vo.resThumbnail }">
						<img src="http://placehold.it/150x150"/>
						</c:if>
						<c:if test="${!empty vo.resThumbnail }">
						<img class= 'res_thum' src="<c:url value='/upfiles/upl_images/${vo.resThumbnail }' />"/>
						</c:if>
					</div>
					<div class="restaurant-search-desc col-xs-8 col-sm-12">
						<h2>${vo.resName }</h2>
						<h4>평점 : ${vo.resGrade }/5</h4>
					</div>
				</div>
			</a>
		</div>
		</c:forEach>
	</div>
</div>