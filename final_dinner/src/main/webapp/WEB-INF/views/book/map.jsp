<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@include file="../inc/top.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>식당 위치보기</title>
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

<<<<<<< HEAD


	
      function initMap() {
        var myLatLng = {lat: -25.363, lng: 131.044};

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: myLatLng
        });

        var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: 'Hello World!'
        });
      }

    </script> -->
    
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          <c:if test= "${empty param.wi}" >
          	center: new google.maps.LatLng(37.5340340823926, 126.90188414338486),
          </c:if>
          <c:if test= "${!empty param.wi}" >
          	center: new google.maps.LatLng(${param.wi }, ${param.ky }),
          </c:if>
          mapTypeId: 'roadmap',
        });

        var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
        var icons = {
          parking: {
            icon: iconBase + 'parking_lot_maps.png'
          },
          library: {
            icon: iconBase + 'library_maps.png'
          },
          info: {
            icon: iconBase + 'info-i_maps.png'
          }
        };

        var features = [
          {
            position: new google.maps.LatLng(37.5340340823926, 126.90188414338486),
            type: 'info'
          }, {
            position: new google.maps.LatLng(-33.91539, 151.22820),
            type: 'info'
          }, {
            position: new google.maps.LatLng(-33.91747, 151.22912),
            type: 'info'
          }, {
            position: new google.maps.LatLng(-33.91910, 151.22907),
            type: 'info'
          }, {
            position: new google.maps.LatLng(-33.91725, 151.23011),
            type: 'info'
          }, {
            position: new google.maps.LatLng(-33.91872, 151.23089),
            type: 'info'
          }, {
            position: new google.maps.LatLng(-33.91784, 151.23094),
            type: 'info'
          }, {
            position: new google.maps.LatLng(-33.91682, 151.23149),
            type: 'info'
          }, {
            position: new google.maps.LatLng(-33.91790, 151.23463),
            type: 'info'
          }, {
            position: new google.maps.LatLng(-33.91666, 151.23468),
            type: 'info'
          }, {
            position: new google.maps.LatLng(-33.916988, 151.233640),
            type: 'info'
          }, {
            position: new google.maps.LatLng(-33.91662347903106, 151.22879464019775),
            type: 'parking'
          }, {
            position: new google.maps.LatLng(-33.916365282092855, 151.22937399734496),
            type: 'parking'
          }, {
            position: new google.maps.LatLng(-33.91665018901448, 151.2282474695587),
            type: 'parking'
          }, {
            position: new google.maps.LatLng(-33.919543720969806, 151.23112279762267),
            type: 'parking'
          }, {
            position: new google.maps.LatLng(-33.91608037421864, 151.23288232673644),
            type: 'parking'
          }, {
            position: new google.maps.LatLng(-33.91851096391805, 151.2344058214569),
            type: 'parking'
          }, {
            position: new google.maps.LatLng(-33.91818154739766, 151.2346203981781),
            type: 'parking'
          }, {
            position: new google.maps.LatLng(-33.91727341958453, 151.23348314155578),
            type: 'library'
          }
        ];

        // Create markers.
        features.forEach(function(feature) {
          var marker = new google.maps.Marker({
            position: feature.position,
            icon: icons[feature.type].icon,
            map: map
          });
        });
      }
    </script>
    
    
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDIOCGfr-bxs_5x_o6TnQghNGVd4vVH7ik&callback=initMap">
    </script>
=======
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
>>>>>>> branch 'master' of https://github.com/DinnerOfTeam/final_dinner.git
</body>
</html>