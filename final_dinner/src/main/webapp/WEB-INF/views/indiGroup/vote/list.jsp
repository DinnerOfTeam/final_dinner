<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
	<div class="table-wrap">
		<div class="container">
			<div class="table-box">
				<div class="table-table table-hover">
					<div class="table-thead hidden-xs">
						<div class="col-xs-2">작성자</div>
						<div class="col-xs-6">투표제목</div>
						<div class="col-xs-2">완료기한</div>
					</div>
					<div class="table-tbody">
						<c:if test="${empty list }">
						<div class="table-tr-nodata">
							<span>등록된 투표가 없습니다.</span>
						</div>
						</c:if>
						<c:if test="${!empty list }">
							<c:forEach var="vo" items="${list }">
						<div class="table-tr">
							<a href="<c:url value='/indiGroup/vote/detail.do?groupNo=${vo.groupNo }&voteNo=${vo.voteNo }'/>">
								<div class="table-td table-td-center table-xs-left table-xs-sub col-xs-4 col-sm-2">
									<p>${vo.memName} </p>
								</div>
								<div class="table-td table-td-title col-xs-12 col-sm-6">
									<p>${vo.voteTitle }</p>
								</div>
								<div class="table-td table-td-center table-xs-right table-xs-sub col-xs-4 col-xs-offset-4 col-sm-2 col-sm-offset-0">
									<p><fmt:formatDate value="${vo.voteRegdate}" pattern="yyyy-MM-dd"/>
									-<fmt:formatDate value="${vo.voteEndDate}" pattern="yyyy-MM-dd"/></p>
								</div>
							</a>
						</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="table-comp">
					<!-- 페이징(모바일) -->
					<div class="table-sub visible-xs">
						<ul class="pager">
							<li class="previous disabled">
								<a href="#">
									<i class="fa fa-angle-left"></i>&nbsp;
									이전
								</a>
							</li>
							<li class="current">
								<span>1</span>
							</li>
							<li class="next">
								<a href="#">
									다음&nbsp;
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
						</ul>
					</div>
					
					<div class="table-sub col-xs-12 col-sm-4 col-sm-offset-8 col-md-2 col-md-offset-10">
						<a class="site-btn-submit site-btn-full" href="write.do" role="button">
							<i class="fa fa-pencil"></i>&nbsp;
							글쓰기
						</a>
					</div>
					
					<!-- 페이징 -->
					<div class="table-sub col-xs-12 hidden-xs">
						<ul class="pagination">
							<li class="disabled">
								<a href="#" aria-label="First">
									<i class="fa fa-angle-double-left"></i>
								</a>
							</li>
							<li class="disabled">
								<a href="#" aria-label="Previous">
									<i class="fa fa-angle-left"></i>
								</a>
							</li>
							<li>
								<a href="#">
									1
								</a>
							</li>
							<li class="active">
								<a href="#">
									2
								</a>
							</li>
							<li class="disabled">
								<a href="#" aria-label="Next">
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
							<li class="disabled">
								<a href="#" aria-label="Last">
									<i class="fa fa-angle-double-right"></i>
								</a>
							</li>
						</ul>
					</div>
					
					<!-- 검색폼 -->
					<div class="form-info form-row">
						<form name="frmBoardSearch" method="get" action="#">
							<div class="col-sm-2 col-sm-offset-2">
								<select class="form-select" name="type">
									<option value="title">제목</option>
									<option value="contents">내용</option>
									<option value="name">작성자</option>
								</select>
							</div>
							
							<div class="col-sm-4">
								<input type="text" class="form-text" id="boardSearchKeyword" name="keyword"
									placeholder="Search" value="">
							</div>
							<div class="col-sm-2">
								<input type="submit" class="site-btn-submit site-btn-full" value="검색">
							</div>
						</form>
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
<%@ include file="../../inc/footer.jsp" %>
