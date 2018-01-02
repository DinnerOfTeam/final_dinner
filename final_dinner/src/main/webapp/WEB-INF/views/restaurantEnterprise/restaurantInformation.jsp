<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


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


</style>

<title>Insert title here</title>
</head>
<body>

	
	<!-- //login -->
	<div class="row fadeInUp animated" data-wow-delay=".5s">
		<form action="<c:url value='/restaurantEnterprise/restaurantInformation.do' />"  method="post">
		<fieldset class='border_fieldset'>
			<legend>식당정보</legend>
		<table class= 'table tb_hover'>
		
			<ul class="info_list">
		<li>
			<h3>${vo.resName }</h3>
			<hr class="aaa">
			
		</li>
		<li>
			<div class="name col-md-3">별점</div>
			<div class="text" name="starselect" id="starselect">
			<img id="starimg" name="starimg" class="starimg" src="${pageContext.request.contextPath}/images/star_y.png" 
			alt="" width="40px" height="10px"  >
			
			</div>
               
			
		</li>
		<br>
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
				<%-- <img src="<c:url value='/upfiles/upl_images/${vo.resThumbnail}'/>"
		 		border="0" width="200"> --%>
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
</div>
			</div>
		</li>
		
	</ul>
	
	
	
		</table>
		</fieldset>
		</form>
		
		
	</div>


</body>
</html>










<%@include file="../inc/footer.jsp"%>