<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@include file="../inc/mypageSide.jsp" %>

<style type="text/css">
	ul{
	list-style: none;
	}
	
	.aaa{
	border-top: 1px solid #0c0c0c;
	}
	
	.ddd{
		margin: auto;
	}
	
	.res-grade{
		display: inline-block;
		min-width: 5.5em;
	}
</style>

	<div class="fadeInUp animated" data-wow-delay=".5s">
		<div class="shadow-box">
			<h3>${vo.resName }</h3>
		</div>
		
		<div class="shadow-box">
			<ul class="info_list">
		<li>
			<div class="name col-md-3">별점</div>
			<div class="text col-md-9" id="starselect">
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
				<span>${vo.resGrade }/5</span>
			</div>
		</li>
		<li>
			<div class="name col-md-3">전화번호</div>
			<div class="text col-md-9">${vo.resContact1}-${vo.resContact2}-${vo.resContact3}</div>
		</li>
		<li>
			<div class="name col-md-3">주소</div>
			<div class="text col-md-9">${vo.resAddress }</div>
		</li>
		<li>
			<div class="name col-md-3">영업시간</div>
			<div class="text col-md-9">${vo.resWorkHour }</div>
		</li>
		<li>
			<div class="name col-md-3">영업일</div>
			<div class="text col-md-9">${vo.resWorkDay }</div>
		</li>

		<li>
			<div class="name col-md-3">식당 사진</div>
			<div class="text col-md-9">
<%-- 				<img src="<c:url value='/upfiles/upl_images/${vo.resThumbnail}'/>"
		 		border="0" width="200">
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox" >
    <div class="item active">
      <img src="<c:url value='/upfiles/upl_images/${vo.resThumbnail}'/>" 
     	 alt="..." border="0" width="300" class="ddd">
     
    </div>
    <div class="item">
      <img src="<c:url value='/upfiles/upl_images/${vo.resThumbnail}'/>" 
     	 alt="..." border="0" width="300" class="ddd" >
      
    </div>
    
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div> --%>
				<c:if test="${!empty photoList }">
					<div class="row">
						<div class="col-md-9 col-xs-6">
							<div id="carousel-res-photo" class="carousel slide" data-ride="carousel">
								<!-- Indicators -->
								<ol class="carousel-indicators">
									<c:forEach var="i" begin="0" end="${fn:length(photoList)-1 }">
										<li data-target="#carousel-res-photo" data-slide-to="${i }"
										<c:if test="${i==0 }">
											class="active"
										</c:if>
										></li>
									</c:forEach>
								</ol>
								
								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
									<c:forEach var="photo" items="${photoList }" varStatus="photoStatus">
										<c:set var="itemAct" value="${photoStatus.index==0? ' active' : '' } "/>
										<div class="item${itemAct }">
											<img src="${pageContext.request.contextPath }/upfiles/upl_images/${photo.resPhotoName}"
												alt="${photo.resPhotoTitle }"
												onerror="errImg(this)">
										</div>
									</c:forEach>
								</div>
							
								<!-- Controls -->
								<a class="left carousel-control" href="#carousel-res-photo" role="button" data-slide="prev">
									<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
								</a>
								<a class="right carousel-control" href="#carousel-res-photo" role="button" data-slide="next">
									<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${empty photoList }">
					<p>등록된 사진이 없습니다</p>
				</c:if>
			</div>
		</li>
		
	</ul>
</div>
		
	</div>
	</div>


</body>
</html>










<%@include file="../inc/footer.jsp"%>