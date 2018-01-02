<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@include file="../inc/mypageSide.jsp"%>


<script type="text/javascript">
	function send(form){
		if(form.pwd.value==""){
			alert("비밀번호를 입력하세요");
			form.pwd.focus();
			return false;
		}
		
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}else{
			return true;
		}
		
	}
</script>

</head>
<body>

<div class="divForm">
<form name="frmDelete" method="post" 
action="<c:url value='/restaurantEnterprise/menuDelete.do'/>" 
	onsubmit="return send(this)">
		<!-- 삭제 처리시 no가 필요하므로 hidden field에 넣어서 넘긴다 -->
		<!-- 
		<input type="hidden" name="foodItemNo" value="${param.foodItemNo}">
		 -->
		 
		<fieldset>
		<legend>메뉴 삭제</legend>
			<div class="col-xs-5">
						<select class="form-select" name="foodItemNo">
							<option>메뉴선택</option>
					<c:forEach var="vo" items="${list }" >
							<option value="${vo.foodItemNo }" >${vo.foodItemName}</option>
							
					</c:forEach>
						</select>
			</div>
		
	        <div>           
	        	<span class="sp">메뉴를 삭제하시겠습니까?</span>                        
	        </div>
	      
	        <div class="center">
	            <input type ="submit"  value="삭제" />
	          
	        </div>
	    </fieldset>
    </form>
</div>


</body>
</html>

<%@include file="../inc/footer.jsp"%>