<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<p>예약</p>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['Year', 'Sales', 'Expenses'],
			['2004',  1000,      400],
			['2005',  1170,      660],
			['2006',  660,       1120],
			['2007',  1030,      540]
		]);
	
		var options = {
			title: 'Company Performance',
			curveType: 'function',
			legend: { position: 'right' }
		};
	
		var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
	
		chart.draw(data, options);
	}
</script>
<div id="curve_chart" style="width: 900px; height: 500px"></div>
<div>
<%-- 	<c:forEach var= 'map' items= "${list }">
		<p>map['BOOK_DATE']</p>
		<p>map['COUNT']</p>
	</c:forEach> --%>
</div>