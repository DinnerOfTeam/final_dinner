<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.cal_detail {
		position: absolute;
		background-color: white;
	}

</style>
<div>
	<div title= "header">
		<a title= '이전달 보기' href="<c:url value= '/indiGroup/chat/main.do?year=${today.year }&month=${today.month-1 }&p_date=${today.date }&groupNo=${param.groupNo }' />" class= 'ajex'><-</a>&nbsp;&nbsp;
<%-- 							<a href="<c:url value= '#' />" class= 'ajex'><-</a>&nbsp;&nbsp; --%>
		<i class="fa fa-calendar" aria-hidden="true"> 일정(<fmt:formatDate value="${today }" pattern="yyyy-MM"/>)</i>
		&nbsp;&nbsp;<a title= '다음달 보기' href="<c:url value= '/indiGroup/chat/main.do?year=${today.year }&month=${today.month+1 }&p_date=${today.date }&groupNo=${param.groupNo }' />" class= 'ajex'>-></a>&nbsp;&nbsp;
		<%-- <a href="<c:url value= '#' />" class= 'ajex'>-></a> --%>
	</div>
	<table class= 'table_my table-boardered table-hover'>
		<tr>
			<th title= 'sunday' class= 'col-md-1'>일</th>
			<th title= 'monday' class= 'col-md-1'>월</th>
			<th title= 'tuesday' class= 'col-md-1'>화</th>
			<th title= 'wendsday' class= 'col-md-1'>수</th>
			<th title= 'thurday' class= 'col-md-1'>목</th>
			<th title= 'friday' class= 'col-md-1'>금</th>
			<th title= 'saterday' class= 'col-md-1'>토</th>
		</tr>
		<c:forEach var="date" items="${date_list }" varStatus="idx">
			<c:if test="${idx.count% 7== 1 }"><tr></c:if>
			<td>
				<c:if test="${date.date!= 1 }">
					<fmt:formatDate value="${date }" pattern="d"/>
				</c:if>
				<c:if test="${date.date== 1 }">
					<fmt:formatDate value="${date }" pattern="M/d"/>
				</c:if>
			</td>
			<c:if test="${idx.count% 7== 0 }"></tr></c:if>
		</c:forEach>
	</table>
</div>