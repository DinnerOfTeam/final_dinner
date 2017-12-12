<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//로그인이 되었는지 체크(사용자가 url로 그냥 들어가는것을 방지하기위해)
	String l_userid = (String)session.getAttribute("userid");
	
	if(l_userid==null || l_userid.isEmpty()){%>
	<script type="text/javascript">
				alert('먼저 로그인하세요');
				location.href
				='<%=request.getContextPath()%>/login/login.jsp';
			</script>
	
	<%	return;
	}

%>