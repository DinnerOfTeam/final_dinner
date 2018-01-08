<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../inc/mypageSide.jsp" %>

	<script type="text/javascript">
		$(function(){
			
		});
	</script>
	
	<div class="shadow-box">
		<h3>메뉴 목록</h3>
	</div>
	
	<div class="shadow-box">
		<c:if test="${!empty menuList }">
			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				<c:forEach var="menu" items="${menuList }">
					<c:set var="menuVar" value="${menu.foodMenuVO }"/>
					<c:set var="itemVar" value="${menu.foodItemList }"/>
					
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="menu${menuVar.foodMenuNo }">
							<h4 class="panel-title row">
								<a data-toggle="collapse" data-parent="#accordion" href="#item${menuVar.foodMenuNo }"
										aria-controls="item${menuVar.foodMenuNo }" class="col-xs-12">
									${menuVar.foodMenuName }
								</a>
							</h4>
						</div>
						<div id="item${menuVar.foodMenuNo }" class="panel-collapse collapse" role="tabpanel" aria-labelledby="menu${menuVar.foodMenuNo }">
							<div class="panel-body">
								<div class="row">
									<p class="col-xs-12 col-sm-8">${menuVar.foodMenuDesc }</p>
									<%-- <a data-toggle="collapse" data-parent="#accordion" href=""
											aria-controls="item${menuVar.foodMenuNo }" class="col-xs-6 col-sm-2">
										${menuVar.foodMenuName }
									</a> --%>
								</div>
								<hr>
								<ul>
									<c:forEach var="menuItem" items="${itemVar }">
										<li>
											<h5>${menuItem.foodItemName } - ₩
												<fmt:formatNumber value="${menuItem.foodItemPrice }" pattern="#,###"/>
											</h5>
											<p>${menuItem.foodItemDesc }</p>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${empty menuList }">
			<p>등록된 메뉴가 없습니다</p>
		</c:if>
	</div>
	
</div>
<!--//BoardPage-->
	
<%@include file="../inc/footer.jsp" %>