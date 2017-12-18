<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/modules.css"
	rel="StyleSheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/style.min.css"
	rel="StyleSheet" type="text/css">

<style type="text/css">
.img_size img {
	width: 100px;
	height: 70px;
}

.img_size a {
	font-size: 0.8em;
	color: black;
}

.search_form {
	height: 70px;
	padding-top: 30px;
	text-align: center;
}

.qna_header {
	padding-bottom: 15px;
	border-bottom: 2px solid #353535;
}

.th_div {
	font-weight: bold;
}

.font_size14 {
	font-size: 140%;
}

.table_div {
	border-top: 2px solid #353535;
	border-bottom: 2px solid #353535;
}

.td_hover:hover {
	background-color: rgb(158, 22, 22);
	color: white !important;
}

.td_div {
	padding: 0.2em 15px;
}

.th_header {
	padding: 20px;
}

.tr_div {
	border-bottom: 1px solid gray;
	padding: 10px 0;
}

.level {
	width: 23px;
	height: 23px;
	display: inline-block;
	background-image: url(images/lev.jpg);
	background-repeat: no-repeat;
	color: white;
	font-weight: bold;
	text-align: center;
}

.help img {
	width: 100%;
}

.info img {
	width: 100%;
}

.info p {
	text-align: center;
}

.clear_both {
	clear: both;
}

.overflow {
	overflow: hidden;
}

.pad_t30 {
	padding-top: 30px;
}

.content_detail {
	padding: 20px;
	min-height: 300px;
	max-height: 600px;
	overflow-y: scroll;
}

.text_center {
	text-align: center;
}

.border_both {
	border-left: 1px solid gray;
	border-right: 1px solid gray;
}

.border_right {
	border-right: 1px solid gray;
}

.boarder_left {
	border-left: 1px solid gray;
}

.page_div {
	text-align: center;
}

.border_fieldset {
	border: 2px solid #353535;
	padding: 0 30px;
}

.border_fieldset legend {
	width: auto;
	border: 0;
}

.form-heading {
	background: rgb(158, 22, 22);
	padding: 3em 0em;
}

.form-heading h1 {
	color: #FFFFFF;
	font-size: 2em;
	text-align: center;
}

.form-body {
	width: 40%;
	margin: 0 auto;
}

.form-area {
	width: 100%;
	color: rgb(168, 168, 168);
	font-size: 0.9em;
	padding: 10px;
	outline: none;
	border: 1px solid rgb(211, 211, 211);
	background: rgb(255, 255, 255);
	overflow: hidden;
	min-height: 10em;
}

.form-info {
	padding: 4em 1.5em 1em;
	background: #FFFFFF;
}

.form {
	padding: 4em 0;
}

.form-info input.form-text {
	font-size: 0.9em;
	padding: 10px 0px;
	width: 100%;
	color: #A8A8A8;
	outline: none;
	border: 1px solid #D3D3D3;
	border-top: none;
	border-left: none;
	border-right: none;
	background: #FFFFFF;
	margin: 0em 0em 1.5em 0em;
}

.form-info input[type="submit"] {
	border: none;
	outline: none;
	cursor: pointer;
	color: #fff;
	background: rgb(158, 22, 22);
	width: 100%;
	padding: .5em 1em;
	font-size: 1em;
	margin: 1.5em 0 0;
}

.form-info input[type="submit"]:hover {
	color: #fff;
	background: black;
	background: rgb(208, 82, 82);
}

.form-row {
	margin-top: 0.75em;
	margin-bottom: 0.75em;
}

.form-row>div {
	padding: 0;
}

.form-select {
	font-size: 1em;
	padding: 10px 0px;
	width: 100%;
	color: #A8A8A8;
	outline: none;
	border: 1px solid #D3D3D3;
	border-top: none;
	border-left: none;
	border-right: none;
	background: #FFF;
	margin: 0em 0em 1.5em 0em;
}

.form-select>option {
	background-color: #FFF;
}

.form-select:hover {
	background-color: #EEE;
}

.form-width-30 {
	width: 29%;
	float: left;
}

.form-width-5 {
	width: 4.5%;
	float: left;
	margin: 10px 0;
	overflow: hidden;
}

.form-txt {
	margin: auto;
	padding: 0;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<!-- login -->
	<div class="login">
		<div class="container">
			<div class="form-body ">
				<div class="form-info">
					<form action="#" method="post">

						<div class="form-row">
							<div>
								<span>업체명</span><input type="text" class="user form-text"
									name="email" placeholder="Name" required="">
							</div>
							<div>
								<div class="form-width-30">
									<select class="form-select">
										<option>010</option>
										<option>011</option>
										<option>012</option>
										<option>016</option>
										<option>019</option>
									</select>
								</div>

								<div class="form-width-5">
									<span class="form-txt">-</span>
								</div>
								<div class="form-width-30">
									<input type="text" class="user form-text">
								</div>
								<div class="form-width-5">
									<span class="form-txt">-</span>
								</div>
							</div>

							<div class="form-width-30">
								<input type="text" class="user form-text">
							</div>
							<br>

							<div class="sss">
								<input type="text" class="user form-text" name="주소"
									placeholder="주소" required="">
								<button>주소검색</button>
								<input type="text" class="user form-text" name="주소"
									placeholder="주소" required="">

							</div>
							<div>
								<input type="text" class="user form-text" name=업종
									" placeholder="업종" required="">
								<button>업종검색</button>
							</div>
						</div>






						<input type="submit" name="Sign In" value="Sign up">

						<div class="signup-text">
							<a href="login.html">Already have an account? Login here.</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->
</body>
</html>










<%@include file="../inc/footer.jsp"%>