<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.tab_menu {
    position: relative;
    z-index: 10;
    height: 42px;
    /* background: url(../img/altoolsRenewal/bg_tabmenu.gif) repeat-x 0 100%; */
    margin-bottom: 26px;
    
   	/*clear: both;*/
	width:60%;margin: 0 auto;
	overflow: auto;
	background: white;
}
.tab_menu div {
    float: left;
    height: 40px;
    margin-right: -1px;
    line-height: 38px;
    border: 1px solid #b7b7b7;
    border-bottom: 0;
    background: #ececec;
    text-align: center;
    font-size: 16px;
    letter-spacing: -1px;
}
.tab_menu div a{
 	color: black;
}

</style>
	<div class="tab_menu container">
		<div class= 'col-sm-3'>
			<a href="<c:url value="/customer/list.do"/>">전체</a>
		</div>
		<div class= 'col-sm-3'>
			<a href="<c:url value="/customer/listByCategory.do?qnaTypeNo=1"/>">회원문의</a>
		</div>
		<div class= 'col-sm-3'>
			<a href="<c:url value="/customer/listByCategory.do?qnaTypeNo=2"/>">업체문의</a>
		</div>
		<div class= 'col-sm-3'>
			<a href="<c:url value="/customer/listByCategory.do?qnaTypeNo=3"/>">예약문의</a>
		</div>
	</div>