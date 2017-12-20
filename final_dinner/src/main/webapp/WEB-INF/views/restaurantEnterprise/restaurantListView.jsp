<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.tr_div a{
		color: #353535;
	}
	
	.aaa{
		color: #353535;
	}
</style>


<%@include file="../inc/mypageSide.jsp" %>

<title>Insert title here</title>
</head>
<body>

<!-- //login -->
	<div class="container fadeInUp animated" data-wow-delay=".5s">
		<form action="<c:url value='/restaurantEnterprise/restaurantListView.do' />" method="post" >	
			
			
		<fieldset class='border_fieldset'>
			<legend>식당정보확인</legend>
			<div class= 'table_div_info col-sm-12'>
				<div class= 'tr_div row'>
					<div class= 'col-sm-2 pad_t30'><a>번호</a></div>
					<div class= 'col-sm-2 pad_t30'><a>식당 이름</a></div>
					<div class= 'col-sm-2 pad_t30'><a>전화번호</a></div>
					<div class= 'col-sm-2 pad_t30'><a>주소</a></div>
					<div class= 'col-sm-2 pad_t30'><a>영업시간</a></div>
					<div class= 'col-sm-2 pad_t30'><a>영업일</a></div>
				</div>
				
				<c:forEach var="vo" items="${list }" varStatus="no">
				<a href="<c:url value='/restaurantEnterprise/restaurantInformation.do'/>" class="aaa">
				<div class= 'tr_div row td_hover'>
					<div class= 'td_div col-sm-2'>${no.count }</div>
					<div class= 'td_div col-sm-2'>${vo.resName } </div>
					<div class= 'td_div col-sm-2'>${vo.resContact1}-${vo.resContact2}-${vo.resContact3} </div>
					<div class= 'td_div col-sm-2'>${vo.resAddress } </div>
					<div class= 'td_div col-sm-2'>${vo.resWorkHour } </div>
					<div class= 'td_div col-sm-2'>${vo.resWorkDay } </div>
				</div>
				</a>
				</c:forEach>
				
				
			</div>
		</fieldset>
		
		
		
	</div>
		</form>

</body>
</html>





<%@include file="../inc/footer.jsp"%>