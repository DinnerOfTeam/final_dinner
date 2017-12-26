<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cdbb1fcc37fcc24c8dd0e57204ffee3c"></script>
<script>
	$(function() {
		var container = document.getElementById('map');
		var options = {
				center: new daum.maps.LatLng(37.56686, 126.97746),
				level: 7,
		};
		var map= new daum.maps.Map(container, options);
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new daum.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter(),
		}); 
		
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		});
	});
</script>
<style type="text/css">
	div#map2 {
		width: 600px;
		height: 600px;
		border: 1px solid silver;
	}
</style>
<div id="map" style="height: 500px;"></div>
