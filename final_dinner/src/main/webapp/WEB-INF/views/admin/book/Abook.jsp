<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<p>예약</p><hr>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(function() {
		$('button#search_book').click(function() {
			var s= $('input[name=startDay]').val();
			var e= $('input[name=endDay]').val();
			location.href= "<c:url value= '/admin/main.do?startDay="+ s+ "&endDay="+ e+ "' />";
		});
	});
</script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['line']});
 	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Day');
		data.addColumn('number', '예약수');
		
		data.addRows([
			['0', 0],
			<c:forEach var= 'map' items= "${list }">
			["${map['BOOK_DATES'] }", ${map["COUNT"] }],
			</c:forEach>
		]);
		
		var options = {
		  chart: {
		    title: '검색 기간동안의 예약 수',
		    subtitle: '예약 횟수 (번)'
		  },
		  width: 700,
		  height: 450
		};
		
		var chart = new google.charts.Line(document.getElementById('linechart_material'));
		
		chart.draw(data, google.charts.Line.convertOptions(options));
	}
	
	function drawChart2(datas) {
		alert(datas);
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Day');
		data.addColumn('number', '예약수');
		
		data.addRows([
			['0', 0],
		]);
		
		var options = {
		  chart: {
		    title: '검색 기간동안의 예약 수',
		    subtitle: '예약 횟수 (번)'
		  },
		  width: 900,
		  height: 500
		};
		
		var chart = new google.charts.Line(document.getElementById('linechart_material'));
		
		chart.draw(data, google.charts.Line.convertOptions(options));
	}
</script>
<div id= 'linechart_material'></div>
<div class= 'container'>
	<input type="text" name= 'startDay' value="${param.startDay }" />~
	<input type="text" name= 'endDay' value="${param.endDay }" />
	<button id="search_book">검색</button>
</div>