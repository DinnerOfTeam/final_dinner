<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="inc/top.jsp" %>

	
	<!-- login -->
	<div class="login">
		<div class="container">
			<div class="login-body">
				<div class="login-heading w3layouts" align="center">
					<ul id="myTab" class="nav nav-tabs" role="tablist" >
								<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">일반</a></li>
								<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">업체</a></li>
								<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">관리자</a></li>							
							</ul>
				</div>
				<div class="login-info">
				<form action="#" method="post">
						<input type="text" class="user" name="email" placeholder="ID" required="">
						<input type="password" name="password" class="lock" placeholder="PASSWORD">
						<div class="forgot-top-grids">
							<div class="forgot-grid">
								<ul>
									<li>
										<input type="checkbox" id="brand1" value="">
										<label for="brand1"><span></span>아이디 기억하기</label>
									</li>
								</ul>
							</div>
							<div class="forgot">
								<a href="#">비밀번호 찾기</a>
							</div>
							<div class="clearfix"> </div>
						</div>
						<input type="submit" name="Sign In" value="로그인">
						<div class="signup-text">
							<a href="signup.jsp">회원가입</a>
						</div>
						
						
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->
	
<%@include file="inc/footer.jsp" %>