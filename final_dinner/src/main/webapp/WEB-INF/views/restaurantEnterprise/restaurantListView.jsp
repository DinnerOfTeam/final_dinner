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
					<div class= 'col-sm-2 pad_t30'><a>이름</a></div>
					<div class= 'col-sm-2 pad_t30'><a>전화번호</a></div>
					<div class= 'col-sm-2 pad_t30'><a>주소</a></div>
					<div class= 'col-sm-2 pad_t30'><a>영업시간</a></div>
					<div class= 'col-sm-2 pad_t30'><a>영업일</a></div>
				</div>
				<a href="<c:url value='restaurantEnterprise/restaurantInformation.do'/>" class="aaa">
				<div class= 'tr_div row td_hover'>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
				</div>
				</a>
				<a href="#" class="aaa">
				<div class= 'tr_div row td_hover'>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
				</div>
				</a>
				<a href="#" class="aaa">
				<div class= 'tr_div row td_hover'>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
					<div class= 'td_div col-sm-2'>[알집] </div>
				</div>
				</a>
			</div>
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
			<div class= 'search_form'>
				<label for='search_condition' class= 'sr-only'>검색</label>
				<select id= 'search_condition' name= 'search_condition'>
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
					<option>작성일</option>
				</select>
				<input type='text'><button><span class= 'glyphicon glyphicon-search' /></button>
			</div>
	</div>
		</form>

</body>
</html>





<%@include file="../inc/footer.jsp"%>