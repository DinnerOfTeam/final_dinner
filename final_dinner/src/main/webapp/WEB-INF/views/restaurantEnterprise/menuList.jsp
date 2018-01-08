<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../inc/mypageSide.jsp" %>

	<script type="text/javascript">
		$(function(){
			$(document).on("click" , ".res-menu-btn-del", function(){
				return confirm("삭제하시겠습니까?");
			});
		});
	</script>
	
	<style type="text/css">
		.res-menu-btn{
			padding: 0.5em;
			font-size: 0.75em;
		}
		
		li .res-menu-btn{
			margin-left: 0.5em;
			padding: 0.25em 0.5em;
			background-color: #EEE;
		}
		li .res-menu-btn:hover{
			text-decoration: none;
			background-color: #CCC;
		}
	</style>
	
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
									<div class="col-sm-6 col-md-offset-6 col-md-3">
										<a href='<c:url value="/restaurantEnterprise/editMenu.do?menuNo=${menuVar.foodMenuNo }"/>'
												class="site-btn site-btn-full res-menu-btn">수정</a>
									</div>
									<div class="col-sm-6 col-md-3">
										<a href='<c:url value="/restaurantEnterprise/deleteMenu.do?menuNo=${menuVar.foodMenuNo }"/>'
												class="site-btn-submit site-btn-full res-menu-btn res-menu-btn-del">삭제</a>
									</div>
								</div>
								<p>${menuVar.foodMenuDesc }</p>
								<hr>
								<ul>
									<c:forEach var="menuItem" items="${itemVar }">
										<li>
											<h5>${menuItem.foodItemName } - ₩
												<fmt:formatNumber value="${menuItem.foodItemPrice }" pattern="#,###"/>
												<a href='<c:url value="/restaurantEnterprise/editItem.do?itemNo=${menuItem.foodItemNo }"/>'
													class="res-menu-btn">수정</a>
												<a href='<c:url value="/restaurantEnterprise/deleteItem.do?itemNo=${menuItem.foodItemNo }"/>'
													class="res-menu-btn res-menu-btn-del">삭제</a>
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