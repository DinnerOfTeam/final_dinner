<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath }/css/#.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.res-head{
		padding: 2.5em;
		background-color: rgb(158, 22, 22);
		color: white;
	}
	
	.res-grade{
		display: inline-block;
		min-width: 7.5em;
	}
	
	.res-thumb-wrap{
		padding: 0.5em;
	}
	
	.res-thumb{
		position: relative;
	}
	
	.res-thumb:before{
		content: "";
		display: block;
		padding-top: 100%;
	}
	
	.res-thumb > img{
		width: 100%;
		position: absolute;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		background-color: #555;
	}
	
	.res-info{
		margin: 1em 0;
	}
</style>

<div class="res-head">
	<div class="container">
		<div class="row">
			<div class="col-sm-3 res-thumb-wrap">
				<div class="res-thumb">
					<c:if test="${!empty vo.resThumbnail }">
						<img src="${pageContext.request.contextPath }/upfiles/upl_images/${vo.resThumbnail }">
					</c:if>
					<c:if test="${empty vo.resThumbnail }">
						<img src="${pageContext.request.contextPath }/images/noImages1x1.png">
					</c:if>
				</div>
			</div>
			
			<div class="col-sm-9">
				<h1>${vo.resName }</h1>
				<p>평점 : 
					<c:set var="gradeB" value="${vo.resGrade%1 }"/>
					<c:set var="gradeA" value="${vo.resGrade-gradeB}"/>
					<span class="res-grade">
						<c:forEach begin="1" end="${gradeA }">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						</c:forEach>
						<c:if test="${gradeB>0 }">
							<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
						</c:if>
					</span>
					${vo.resGrade }/5
				</p>
				<p>장소 : ${vo.resAddress } ${vo.resAddressDetail }</p>
				<p>영업일 : ${vo.resWorkDay }</p>
				<p>‎영업시간 : ${vo.resWorkHour }</p>
				<p>‎연락처 : ${vo.resContact1 }</p>
				<p>‎최대 인원수 : ${vo.resMaxPerson }명</p>
				
			</div>
		</div>
	</div>
</div>

<div class="res-info">
	<div class="container">
		<div class="shadow-box">
			<div>
				<h2>소개</h2>
				<hr>
				<div>
					${vo.resIntroduce }
				</div>
			</div>
		</div>
		<div class="shadow-box">
			<div>
				<h2>메뉴</h2>
				<hr>
				<div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../inc/footer.jsp"%>