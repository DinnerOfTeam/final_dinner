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
	

</style>

<title>Insert title here</title>
</head>
<body>

	
	<!-- //login -->
	<div class="row fadeInUp animated" data-wow-delay=".5s">
		<form>
		<fieldset class='border_fieldset'>
			<legend>식당정보</legend>
		<table class= 'table tb_hover'>
			
			<ul class="info_list">
		<li>
			<h3>장 스테이크</h3>
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
			<div class="text col-md-9">02-548-9621</div>
		</li>
		<li>
			<div class="name col-md-3">주소</div>
			<div class="text col-md-9">서울시 강남구 신사동 644-18 2층</div>
		</li>
		<li>
			<div class="name col-md-3">영업시간</div>
			<div class="text col-md-9">월~토 12:00~15:00 (L.O 14:00), 18:00~22:30 (L.O
				21:00) 일 12:00~15:00 (L.O 14:00), 18:00~22:00 (L.O 21:00)</div>
		</li>
		<li>
			<div class="name col-md-3">휴무일</div>
			<div class="text col-md-9">명절당일</div>
		</li>

		<li>
			<div class="name col-md-3">예산(2인 기준)</div>
			<div class="text col-md-9">5-10만원</div>
		</li>
		
	</ul>
			
		</table>
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


</body>
</html>










<%@include file="../inc/footer.jsp"%>