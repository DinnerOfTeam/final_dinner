<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div>
	<div title= "header">
		<a title= '이전달 보기' href="<c:url value= '/indiGroup/main.do?year=${today.year }&month=${today.month-1 }&p_date=${today.date }' />" class= 'ajex'><-</a>&nbsp;&nbsp;
<%-- 							<a href="<c:url value= '#' />" class= 'ajex'><-</a>&nbsp;&nbsp; --%>
		<i class="fa fa-calendar" aria-hidden="true"> 일정(<fmt:formatDate value="${today }" pattern="yyyy-MM"/>)</i>
		&nbsp;&nbsp;<a title= '다음달 보기' href="<c:url value= '/indiGroup/main.do?year=${today.year }&month=${today.month+1 }&p_date=${today.date }' />" class= 'ajex'>-></a>&nbsp;&nbsp;
		<%-- <a href="<c:url value= '#' />" class= 'ajex'>-></a> --%>
	</div>
	<table class= 'table table-boardered table-hover'>
		<tr>
			<th title= 'sunday' class= 'col-md-1'>일</th>
			<th title= 'monday' class= 'col-md-1'>월</th>
			<th title= 'tuesday' class= 'col-md-1'>화</th>
			<th title= 'wendsday' class= 'col-md-1'>수</th>
			<th title= 'thurday' class= 'col-md-1'>목</th>
			<th title= 'friday' class= 'col-md-1'>금</th>
			<th title= 'saterday' class= 'col-md-1'>토</th>
		</tr>
<!-- 							<tr>
								<th title= 'sunday'>일</th>
								<th title= 'monday''>월</th>
								<th title= 'tuesday'>화</th>
								<th title= 'wendsday'>수</th>
								<th title= 'thurday'>목</th>
								<th title= 'friday'>금</th>
								<th title= 'saterday'>토</th>
							</tr> -->
		<c:set var="i" value="0" />
		<c:forEach var="date" items="${date_arr }">
			<c:if test="${i% 7== 0 }">
				<tr>
			</c:if>
			<td>
			<c:if test="${today.date== date }">
				<strong style="color:blue">
			</c:if>
				<c:if test="${date== 1 }">
					${today.month+ 1 }/
				</c:if>
				${date }
			<c:if test="${today.date== date }">
				</strong>
			</c:if>
			<c:if test="${!empty work_arr[i] }">
				<p class= 'work'>&nbsp;</p>
			</c:if>
			</td>
			<c:if test="${i% 7== 6 }">
				</tr>
			</c:if>
			<c:set var="i" value="${i+ 1 }" />
		</c:forEach>
	</table>
</div>
