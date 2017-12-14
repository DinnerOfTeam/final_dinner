<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<form name="frmWrite" method="post" 
	action="<c:url value='/customer/write.do'/>" 
	enctype="multipart/form-data"  onsubmit="return send(this)">
	
	<filedset>
	<legend>문의하기</legend>
	<div>
		<label for = "title">제목</label>
		<input type = "text" id="title" name="title" />
	</div>
	<div>
		<label for = "select">분류선택</label>
		<select>
			<option>로그인문의</option>
			<option>회원문의</option>
			<option>업체문의</option>
			<option>예약문의</option>
		</select>
	</div>
	<div>
		<label for="content">내용</label>
		<textarea id="content" name="content" rows="12" cols="40"></textarea>
	</div>
	<!-- <div>
		<label for="upfile">첨부파일</label>
		<input type="file" id="upfile" name="upfile"/>
	</div> -->
	<div>
		<label for="pwd">비밀번호</label>
		<input type="password" id="pwd" name="pwd"/>
	</div>
	<div>
		<label for="secret">비밀글 설정</label>
		<label>공개글</label>
		<input type="radio" id="open" name="open" value="1"/>
		<label>비밀글</label>
		<input type="radio" id="close" name="open" value="2"/>
	</div>
	<div class="center">
		<input type="submit" value="등록"/>
		<input type="Button" value="목록"
		onclick  ="location.href='<c:url value="/customer/list.do"/>'" /> 
	</div>
	</filedset>
	</form>
</div>
</body>
</html>
<%@ include file="../inc/footer.jsp" %>