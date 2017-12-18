<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.divNotice{
		width:310px;
	}
	.divNotice table{
		width:300px;
	}
	#imgLine{
		width:310px;
		height:6px;
	}
	.divNotice .more{
		padding: 0 0 0 160px;
	}
</style>
<div class="divNotice">
	<div>
		<p>자주묻는질문 Q&A</p>		
		<span class='more'>
			<a href="<c:url value='/customer/list.do'/>">
				<img src
				="${pageContext.request.contextPath}/images/more.JPG" 
				alt="더보기 이미지">
			</a>
		</span>
	</div>
	<div>
		<img src="${pageContext.request.contextPath}/images/Line.JPG"
			id="imgLine">
	</div>
	<div>
		<table>
<%-- 			<c:if test="${empty list }">			
				<tr>
					<td>공지사항이 없습니다.</td>
				</tr>
			</c:if>	 --%>
			<c:if test="${!empty list }">
				<c:forEach var="vo" items="${list }" >
					<tr>
						<td>
							<a href
						="<c:url value='/customer/detail.do?no=${vo.no}'/>">							
							${vo.title}</a>
						</td>
					</tr>	
				</c:forEach>			
			</c:if>
		</table>
	</div>
	
</div>
