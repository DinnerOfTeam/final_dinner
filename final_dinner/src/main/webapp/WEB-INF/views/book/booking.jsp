<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="../inc/mypageSide.jsp" %>

<!-- //login -->
	<div class="row fadeInUp animated" data-wow-delay=".5s">
		<form action="<c:url value='/book/booking.do' />" method="post" >
		<fieldset class='border_fieldset'>
			<legend>예약정보 조회</legend>
		<table class= 'table tb_hover'>
			<thead class= 'row'>
			<tr>
				<th>예약번호</th>
				<th>식당이름</th>
				<th>예약날짜</th>
				<th>주소(위치)</th>
				<th>취소</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>1</td>
				<td>아웃백</td>
				<td>2017-12-16</td>
				<td>장요한</td>
				<td><input type="submit" name="cancel" class="site-btn" value="취소하기"></td>				
			</tr>
			<tr>
				<td>2</td>
				<td>계절밥상</td>
				<td>2017-12-16</td>
				<td>장요한</td>
				<td><input type="submit" name="cancel" class="site-btn" value="취소하기"></td>
			</tr>
			<tr>
				<td>3</td>
				<td>빕스</td>
				<td>2017-12-16</td>
				<td>장요한</td>
				<td><input type="submit" name="cancel" class="site-btn" value="취소하기"></td>
			</tr>
			<tr>
				<td>4</td>
				<td>장수촌</td>
				<td>2017-12-16</td>
				<td>장요한</td>
				<td><input type="submit" name="cancel" class="site-btn" value="취소하기"></td>
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