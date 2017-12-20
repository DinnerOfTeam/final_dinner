<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>

<link href="<c:url value='/css/site-board.css'/>" rel="stylesheet" type="text/css" />
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


<div class="site-board wow fadeInUp animated" data-wow-delay=".5s">
	<div class="container">
		<div class="board-inner">
			<c:url var="listURL" value='/indiGroup/groupBoard/list.do'>
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
							<c:url var='boardURL' value='/indiGroup/groupBoard/detail.do'>
								<c:param name="no" value="${vo.freeNo }"></c:param>
								<c:param name="keyword" value="${searchVO.keyword }"></c:param>
								<c:param name="type" value="${searchVO.type }"></c:param>
								<c:param name="currentPage" value="${searchVO.currentPage}" />
							</c:url>
							<c:set var="rowClass" value="row board-list-row"/>
							<c:if test="${!empty param.isImport and vo.freeNo==param.no }">
								<c:set var="rowClass" value="${rowClass} board-list-sel"/>
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
											<img src="<c:url value='/images/boardFileIcon.png'/>">
										</c:if>
										<c:if test="${vo.timePass<24 }">
											<img src="<c:url value='/images/boardNewIcon.png'/>">
										</c:if>
									</div>
									<div class="board-list-writer col-xs-4 col-sm-2"><p>${vo.freeName }</p></div>
									<div class="board-list-date col-xs-4 col-xs-offset-4 col-sm-2 col-sm-offset-0">
										<p><fmt:formatDate value="${vo.freeRegdate }" pattern="yyyy-MM-dd" /></p>
									</div>
								</a>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
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
									<a href="<c:url value='${listURL}'>
												<c:param name="currentPage" value="${searchVO.currentPage-1}" />
											</c:url>">
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
									<a href="<c:url value='${listURL}'>
												<c:param name="currentPage" value="${searchVO.currentPage+1}" />
											</c:url>">
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
										<a href="<c:url value='${listURL}'>
													<c:param name="currentPage" value="1" />
												</c:url>" aria-label="First">
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
										<a href="<c:url value='${listURL}'>
													<c:param name="currentPage" value="${searchVO.firstBlockPage-1}" />
												</c:url>" aria-label="Previous">
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
											<a href="<c:url value='${listURL}'>
														<c:param name="currentPage" value="${i}" />
													</c:url>">
												${i}
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${searchVO.lastBlockPage<searchVO.totalPage }">
									<li>
										<a href="<c:url value='${listURL}'>
													<c:param name="currentPage" value="${searchVO.lastBlockPage+1}" />
												</c:url>" aria-label="Next">
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
										<a href="<c:url value='${listURL}'>
													<c:param name="currentPage" value="${searchVO.totalPage}" />
												</c:url>" aria-label="Last">
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

<%@include file="../../inc/footer.jsp" %>