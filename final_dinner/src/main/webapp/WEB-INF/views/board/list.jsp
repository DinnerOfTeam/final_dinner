<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty param.isImport}">
	<%@include file="../inc/top.jsp" %>
</c:if>
<!--BoardList-page -->
<c:if test="${empty param.hideStyle}">
	<link href="<c:url value='/css/site-board.css'/>" rel="stylesheet" type="text/css" media="all" />
</c:if>
<script type="text/javascript">
	$(function(){
		$('form[name=frmBoardSearch]').submit(function(){
			if($('#boardSearchKeyword').val()==""){
				alert("검색어를 입력하세요")
				$('#boardSearchKeyword').focus();
				return false;
			}
		});
	});
</script>
<c:if test="${empty param.isImport}">
	<div class="site-board-title wow fadeIn animated" data-wow-delay=".5s">
		<h1 class="col-center">게시판</h1>
	</div>
</c:if>

<div class="site-board wow fadeIn animated" data-wow-delay=".5s">
	<div class="container">
		<div class="board-inner">
			<c:url var="listURL" value='/board/list.do'>
				<c:param name="keyword" value="${searchVO.keyword }"></c:param>
				<c:param name="type" value="${searchVO.type }"></c:param>
			</c:url>
			<div class="board-list">
				<div class="row board-list-header hidden-xs">
					<div class="col-xs-1">번호</div>
					<div class="col-xs-7">제목</div>
					<div class="col-xs-2">작성자</div>
					<div class="col-xs-2">날짜</div>
				</div>
				<div class="row board-list-body">
					<c:if test="${empty list }">
					<div class="row board-list-nodata">
						<span>글이 없습니다.</span>
					</div>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="vo" items="${list }">
							<c:url var='boardURL' value='/board/detail.do'>
								<c:param name="no" value="${vo.freeNo }"></c:param>
								<c:param name="keyword" value="${searchVO.keyword }"></c:param>
								<c:param name="type" value="${searchVO.type }"></c:param>
								<c:param name="currentPage" value="${searchVO.currentPage}" />
							</c:url>
							<c:set var="rowClass" value="row board-list-row"/>
							<c:if test="${!empty param.isImport and vo.freeNo==param.no }">
								<c:set var="rowClass" value="${rowClass} board-list-sel" />
							</c:if>
							<div class="${rowClass}">
								<a href="${boardURL}">
									<div class="col-sm-1 hidden-xs">
										<c:choose>
											<c:when test="${!empty param.isImport and vo.freeNo==param.freeNo }">
												<i class="fa fa-arrow-right"></i>
											</c:when>
											<c:otherwise>
												<p>${vo.freeNo }</p>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="board-list-title col-xs-12 col-sm-7">
										<p>${vo.freeTitle }</p>
										<c:if test="${vo.commentCount>0 }">
											<c:if test="${vo.commentCount<1000 }">
												<span>[${vo.commentCount }]</span>
											</c:if>
											<c:if test="${vo.commentCount>=1000 }">
												<span>[999+]</span>
											</c:if>
										</c:if>
										<c:if test="${vo.fileCount>0 }">
											&nbsp;<img src="${pageContext.request.contextPath }/images/boardFileIcon.png" alt="첨부파일">
										</c:if>
										<c:if test="${vo.timePass<24 }">
											&nbsp;<img src="${pageContext.request.contextPath }/images/boardNewIcon.png" alt="24시간 이내에 작성">
										</c:if>
									</div>
									<div class="board-list-writer col-xs-4 col-sm-2">
										<p>
											<c:if test="${vo.memNo!=0 }">
												<img src="${pageContext.request.contextPath }/images/boardMemberIcon.png" alt="회원 작성">&nbsp;
											</c:if>
											${vo.freeName }
										</p>
									</div>
									<div class="board-list-date col-xs-4 col-xs-offset-4 col-sm-2 col-sm-offset-0">
										<p><fmt:formatDate value="${vo.freeRegdate }" pattern="yyyy-MM-dd" /></p>
									</div>
								</a>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<div>
				<!-- 페이징(모바일) -->
				<div class="visible-xs">
					<ul class="pager">
						<c:choose>
							<c:when test="${searchVO.currentPage<=1 }">
								<li class="previous disabled">
									<span>
										<i class="fa fa-angle-left"></i>&nbsp;
										이전
									</span>
								</li>
							</c:when>
							<c:otherwise>
								<li class="previous">
									<a href="${listURL}&currentPage=${searchVO.currentPage-1}">
										<i class="fa fa-angle-left"></i>&nbsp;
										이전
									</a>
								</li>
							</c:otherwise>
						</c:choose>
						<li class="current">
							<span>${searchVO.currentPage }</span>
						</li>
						<c:choose>
							<c:when test="${searchVO.currentPage>=searchVO.totalPage }">
								<li class="next disabled">
									<span>
										다음&nbsp;
										<i class="fa fa-angle-right"></i>
									</span>
								</li>
							</c:when>
							<c:otherwise>
								<li class="next">
									<a href="${listURL}&currentPage=${searchVO.currentPage+1}">
										다음&nbsp;
										<i class="fa fa-angle-right"></i>
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				
				<div class="board-list-sub col-xs-12 col-sm-4 col-sm-offset-8 col-md-2 col-md-offset-10">
					<a class="site-btn-submit site-btn-full" href="<c:url value='/board/write.do'/>" role="button">
						<i class="fa fa-pencil"></i>&nbsp;
						글쓰기
					</a>
				</div>
				
				<!-- 페이징 -->
				<c:if test="${!empty list }">
					<div class="board-list-sub col-xs-12 hidden-xs">
						<ul class="pagination">
							<c:choose>
								<c:when test="${searchVO.currentPage>1 }">
									<li>
										<a href="${listURL}&currentPage=1" aria-label="First">
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
										<a href="${listURL}&currentPage=${searchVO.firstBlockPage-1}" aria-label="Previous">
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
										<li>
											<a href="${listURL}&currentPage=${i}">
												${i}
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${searchVO.lastBlockPage<searchVO.totalPage }">
									<li>
										<a href="${listURL}&currentPage=${searchVO.lastBlockPage+1}" aria-label="Next">
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
										<a href="${listURL}&currentPage=${searchVO.totalPage}" aria-label="Last">
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
					<form name="frmBoardSearch" method="get" action="<c:url value='/board/list.do'/>">
						<div class="col-sm-2 col-sm-offset-2">
							<select class="form-select" name="type">
								<option value="title"
									<c:if test="${searchVO.type=='free_title'}">
										selected
									</c:if>
								>제목</option>
								<option value="contents"
									<c:if test="${searchVO.type=='free_contents'}">
										selected
									</c:if>
								>내용</option>
								<option value="name"
									<c:if test="${searchVO.type=='free_name'}">
										selected
									</c:if>
								>작성자</option>
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
<!--//BoardList-->

<c:if test="${empty param.isImport}">
	<%@include file="../inc/footer.jsp" %>
</c:if>