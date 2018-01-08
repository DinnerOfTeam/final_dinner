<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../inc/top.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">




<script type="text/javascript">
	function openMap(key1, key2) {
/* 		window.open('<c:url value="/book/map.do"/>', 'c', 'width= 400px, height= 400px'); */
		window.open('<c:url value="/admin/restaurant/Ares2.do?Akey='+key1+ key2 + '"/>', 'c', 'width= 400px, height= 400px');
	}
</script>




<title>Insert title here</title>
</head>
<body>

	<%@include file="../inc/mypageSide.jsp"%>

	<!-- //login -->
	<div class="row fadeInUp animated" data-wow-delay=".5s">
		<fieldset >
			<legend>예약정보 조회</legend>
			<table class='table tb_hover'>
				<thead class='row'>
					<tr>
						<th>번호</th>
						<th>식당이름</th>
						<th>예약날짜</th>
						<th>주소(위치)</th>
						<th>취소</th>
					</tr>
				</thead>
				<tbody>
					<form action="<c:url value='/book/booking.do' />" method="post">
						<c:forEach var="vo" items="${list }" varStatus="no">
							<tr>
								<td>${vo.resNo }</td>
								<td>${vo.resName }</td>
								<td><fmt:formatDate value="${vo.bookDate }"
										pattern="yyyy-MM-dd" /></td>
								<td>${vo.resAddress }
								<input type="button" 
								style="background-image: url('<c:url value="/images/Marker_26px.png"/>'); width:30px;"
									onclick="openMap('${vo.resAddressDetail }', '${vo.resName }')" />   
								
							
								</td>


								<c:if test="${vo.bookDate > vo.bookRegdate }">
									<td><input type="submit" name="cancel" class="site-btn"
										value="취소하기"> <input type="hidden"
										value="${vo.bookNo }" name="bookNo"></td>
								</c:if>
								<c:if test="${vo.bookDate < vo.bookRegdate }">
									<td><input type="hidden" name="cancel" class="site-btn"
										value="취소하기"></td>
								</c:if>
							</tr>
						</c:forEach>
					</form>

				</tbody>
			</table>
		</fieldset>
		
	</div>







</body>

</html>




<%@include file="../inc/footer.jsp"%>