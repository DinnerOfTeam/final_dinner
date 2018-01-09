<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<p>예약</p><hr>
<script type="text/javascript">
	$(function() {
		$('button#search_book').click(function() {
			var s= $('input[name=startDay]').val();
			var e= $('input[name=endDay]').val();
			var i= $('input[name=idx]').val();
			location.href= "<c:url value= '/admin/main.do?idx="+i + "&startDay="+ s+ "&endDay="+ e+ "' />";
		});
		$.applyDate= function(id) {
			$(id).datepicker({
				'dateFormat': 'yy-mm-dd',
			});
		};
		$.applyDate('input[name=startDay]');
		$.applyDate('input[name=endDay]');
	});
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
		    title: '-',
		    subtitle: '예약 횟수 (번)'
		  },
		  width: 700,
		  height: 450
		};
		
		var chart = new google.charts.Line(document.getElementById('linechart_material'));
		
		chart.draw(data, google.charts.Line.convertOptions(options));
	}
</script>
<div id= 'linechart_material'></div>
<div class= 'container'>
	<input type="hidden" name="idx" value="1">
	<input type="text" name= 'startDay' id='startDay' value="${param.startDay }" />~
	<input type="text" name= 'endDay' id= "endDay" value="${param.endDay }" />
	<button id="search_book">검색</button>
</div>