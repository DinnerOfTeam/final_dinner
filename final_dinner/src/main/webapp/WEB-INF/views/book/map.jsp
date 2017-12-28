<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../inc/top.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Geocoding service</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 800px;
	width: 800px;
	text-align: center;
	margin-left: 550px;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 70%;
	margin: 0;
	padding: 0;
}

#floating-panel {
	top: 10px;
	left: 25%;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
	text-align: center;
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}
</style>
</head>
<body>
	<div id="floating-panel">
		<input id="address" type="textbox" value="Sydney, NSW"> <input
			id="submit" type="button" value="Geocode">
	</div>
	<div id="map"></div>
	<script>
	function initMap() {
		  var pos = {lat: 37.485647, lng: 126.8758};
		  var map = new google.maps.Map(document.getElementById('map'), {
		    zoom: 17,
		    center: pos
		  });
		  var marker = new google.maps.Marker({
		    position: pos,
		    map: map
		  });
		  
		}
	
		/* function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 8,
				center : {
					lat : 37.485647,
					lng : 126.8758
				}
			});
			var geocoder = new google.maps.Geocoder();

			document.getElementById('submit').addEventListener('click',
					function() {
						geocodeAddress(geocoder, map);
					});
		}

		function geocodeAddress(geocoder, resultsMap) {
			var address = document.getElementById('address').value;
			geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status === 'OK') {
									resultsMap
											.setCenter(results[0].geometry.location);
									var marker = new google.maps.Marker({
										map : resultsMap,
										position : results[0].geometry.location
									});
									var pos = marker.getPosition();
									alert("lat: " + pos.lat() + ", lng: " + pos.lng());
								} else {
									alert('Geocode was not successful for the following reason: '
											+ status);
								}
							});
		} */
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDIOCGfr-bxs_5x_o6TnQghNGVd4vVH7ik&callback=initMap">
		
	</script>
</body>
</html>