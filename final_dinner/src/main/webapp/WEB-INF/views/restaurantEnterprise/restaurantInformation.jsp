<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




	<ul class="info_list">
		<li class="item grade">
			<div class="name">별점</div>
			
		</li>
		<li class="item">
			<div class="name">전화번호</div>
			<div class="text">02-548-9621</div>
		</li>
		<li class="item">
			<div class="name">주소</div>
			<div class="text">서울시 강남구 신사동 644-18 2층</div>
		</li>
		<li class="item">
			<div class="name">영업시간</div>
			<div class="text">월~토 12:00~15:00 (L.O 14:00), 18:00~22:30 (L.O
				21:00) 일 12:00~15:00 (L.O 14:00), 18:00~22:00 (L.O 21:00)</div>
		</li>
		<li class="item">
			<div class="name">휴무일</div>
			<div class="text">명절당일</div>
		</li>

		<li class="item">
			<div class="name">예산 (2인 기준)</div>
			<div class="text">5-10만원</div>
		</li>
		
	</ul>





	
	<!-- //login -->
	<div class="container fadeInUp animated" data-wow-delay=".5s">
		<form>
		<fieldset class='border_fieldset'>
			<legend>식당정보</legend>
		<table class= 'table tb_hover'>
			<thead class= 'row'>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>5</td>
				<td>여름철 안전하고 ...</td>
				<td>장요한</td>
				<td>2017-12-16</td>
				<td>5</td>
			</tr>
			<tr>
				<td>5</td>
				<td>여름철 안전하고 ...</td>
				<td>장요한</td>
				<td>2017-12-16</td>
				<td>5</td>
			</tr>
			<tr>
				<td>5</td>
				<td>여름철 안전하고 ...</td>
				<td>장요한</td>
				<td>2017-12-16</td>
				<td>5</td>
			</tr>
			<tr>
				<td>5</td>
				<td>여름철 안전하고 ...</td>
				<td>장요한</td>
				<td>2017-12-16</td>
				<td>5</td>
			</tr>
			</tbody>
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


</body>
</html>










<%@include file="../inc/footer.jsp"%>