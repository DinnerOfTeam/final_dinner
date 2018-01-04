<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<div class="site-top-title" style="background-color: rgb(255, 230, 234);" >
	<div class="container">
		<h1>고객센터</h1>
	</div>
</div>
<%@ include file="tab_menu.jsp" %>
<script type="text/javascript">
	function goPage(page) {
		$('form[name=frm_page]').find('input[name=currentPage]').val(page);
		$('form[name=frm_page]').submit();
	}
</script>
<form name="frm_page" action="<c:url value='/customer/list.do' />">
	<input type="hidden" name="keyword" value="${searchVO.keyword }">
	<input type="hidden" name="type" value="${searchVO.type}">
	<input type="hidden" name="currentPage" value="">
</form>
	<div class="table-wrap">
		<div class="container">
			<div class="table-box">
				<div class="table-table table-hover">
					<div class="table-thead hidden-xs">
						<div class="col-xs-1">번호</div>
						<div class="col-xs-6">제목</div>
						<div class="col-xs-2">작성자</div>
						<div class="col-xs-2">작성일</div>
						<div class="col-xs-1">조회수</div>
					</div>
					<div class="table-tbody">
						<c:if test="${empty list }">
						<div class="table-tr-nodata">
							<span>글이 없습니다.</span>
						</div>
						</c:if>
						<c:if test="${!empty list }">
							<c:forEach var="vo" items="${list }">
						<div class="table-tr">
							<a href="<c:url value='/customer/countUpdate.do?no=${vo.qnaQuestionNo}'/>">
								<div class="table-td table-td-center col-sm-1 hidden-xs">
									<p>${vo.qnaQuestionNo }</p>
								</div>
								<div class="table-td table-td-title col-xs-12 col-sm-6">
									<c:if test="${vo.questionOpen==1 }">
									<p>${vo.questionTitle }
									</c:if>
									<c:if test="${vo.questionOpen==2 }">
									<p color="#BDBDBD">※비밀글 입니다.※
									</c:if>
									<c:if test="${empty vo.questionOpen }">
										<p>${vo.questionTitle }
									</c:if>
									<c:if test="${vo.isAnswer> 0 }">
										<img alt="reply ok image" src="<c:url value= '/images/re_ok.jpg' />">
									</c:if></p>
								</div>
								<div class="table-td table-td-center table-xs-left table-xs-sub col-xs-4 col-sm-2">
									<p>${vo.memName}</p>
								</div>
								<div class="table-td table-td-center table-xs-right table-xs-sub col-xs-4 col-xs-offset-4 col-sm-2 col-sm-offset-0">
									<p><fmt:formatDate value="${vo.questionRegdate }"
							pattern="yyyy-MM-dd"/></p>
								</div>
								<div class="table-td table-td-center col-sm-1 hidden-xs">
									<p>${vo.questionViewCount }</p>
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
							<c:if test="${searchVO.currentPage== 1 }">
								<li class="previous disabled">
									<a>
										<i class="fa fa-angle-left"></i>&nbsp;
										이전
									</a>
								</li>
							</c:if>
							<c:if test="${searchVO.currentPage!= 1 }">
								<li class="previous">
									<a href="#" onclick="goPage(${searchVO.currentPage- 1 })">
										<i class="fa fa-angle-left"></i>&nbsp;
										이전
									</a>
								</li>
							</c:if>
							<li class="current">
								<span>${searchVO.currentPage }</span>
							</li>
							<c:if test="${searchVO.currentPage== searchVO.totalPage }">
								<li class="next disabled">
									<a>
										<i class="fa fa-angle-right"></i>
										다음&nbsp;
									</a>
								</li>
							</c:if>
							<c:if test="${searchVO.currentPage!= searchVO.totalPage }">
								<li class="next">
									<a href="#" onclick="goPage(${searchVO.currentPage+ 1 })">
										<i class="fa fa-angle-right"></i>&nbsp;
										다음&nbsp;
									</a>
								</li>
							</c:if>
						</ul>
					</div>
					
					<div class="table-sub col-xs-12 col-sm-4 col-sm-offset-8 col-md-2 col-md-offset-10">
						<a class="site-btn-submit site-btn-full" href="write.do" role="button">
							<i class="fa fa-pencil"></i>&nbsp;
							글쓰기
						</a>
					</div>
					
					<!-- 페이징 -->
					<c:if test="${!empty list }">
					<div class="table-sub col-xs-12 hidden-xs">
						<ul class="pagination">
							<c:choose>
								<c:when test="${searchVO.currentPage>1 }">
									<li>
										<a href="#" aria-label="First" onclick="goPage(1)">
											<i class="fa fa-angle-double-left"></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="disabled">
										<span aria-label="First">
											<i class="fa fa-angle-double-left"></i>
										</span>
									</li>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${searchVO.firstBlockPage>1 }">
									<li>
										<a href="#" aria-label="First" onclick="goPage(${searchVO.firstBlockPage-1})">
											<i class="fa fa-angle-left"></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="disabled">
										<span aria-label="Previous">
											<i class="fa fa-angle-left"></i>
										</span>
									</li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="i" begin="${searchVO.firstBlockPage}" end="${searchVO.lastBlockPage}">
								<c:choose>
									<c:when test="${i==searchVO.currentPage }">
										<li class="active">
											<span>
												${i}
											</span>
										</li>
									</c:when>
									<c:otherwise>
										<li><a href="#" aria-label="First" onclick="goPage(${i})">
												${i}
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${searchVO.lastBlockPage<searchVO.totalPage }">
									<li>
										<a href="#" aria-label="First" onclick="goPage(${searchVO.lastBlockPage+1})">
											<i class="fa fa-angle-right"></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="disabled">
										<span aria-label="Next">
											<i class="fa fa-angle-right"></i>
										</span>
									</li>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${searchVO.currentPage<searchVO.totalPage }">
									<li>
										<a href="#" aria-label="First" onclick="goPage(${searchVO.totalPage})">
											<i class="fa fa-angle-double-right"></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="disabled">
										<span aria-label="Last">
											<i class="fa fa-angle-double-right"></i>
										</span>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					</c:if>
					
					<!-- 검색폼 -->
					<div class="form-info form-row">
						<form name="frmBoardSearch" method="get" action="#">
							<div class="col-sm-2 col-sm-offset-2">
								<select class="form-select" name="type">
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="name">작성자</option>
								</select>
							</div>
							
							<div class="col-sm-4">
								<input type="text" class="form-text" id="boardSearchKeyword" name="keyword"
									placeholder="Search" value="${searchVO.keyword }">
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
	
<%@ include file="../inc/footer.jsp" %>