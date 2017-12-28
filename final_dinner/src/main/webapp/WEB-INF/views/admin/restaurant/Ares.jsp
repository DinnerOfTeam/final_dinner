<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cdbb1fcc37fcc24c8dd0e57204ffee3c&libraries=services"></script>
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
		   	console.log(latlng.getLat()+ ", "+ latlng.getLng());
		});
		
		$('#searchMap2').click(function() {
			var key= $('#key').val();
			//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
			var infowindow = new daum.maps.InfoWindow({zIndex:1});

			var mapContainer = document.getElementById('searchedMap2'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = null;
			map= new daum.maps.Map(mapContainer, mapOption); 

			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places(); 

			// 키워드로 장소를 검색합니다
			ps.keywordSearch(key, placesSearchCB); 

			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
			    if (status === daum.maps.services.Status.OK) {

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new daum.maps.LatLngBounds();

			        for (var i=0; i<data.length; i++) {
			            displayMarker(data[i]);    
			            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
			        }       

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			        map.setBounds(bounds);
			    } 
			}

			// 지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {
			    
			    // 마커를 생성하고 지도에 표시합니다
			    var marker = new daum.maps.Marker({
			        map: map,
			        position: new daum.maps.LatLng(place.y, place.x) 
			    });

			    // 마커에 클릭이벤트를 등록합니다
			    daum.maps.event.addListener(marker, 'click', function() {
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			    });
			}
		});
		
		$('#searchMap').click(function() {
			var wi= $('#addr_sigungu :selected').find('input:eq(0)').val();
			var ky= $('#addr_sigungu :selected').find('input:eq(1)').val();
/* 			alert(wi+ ", "+ ky+ '지도 띄우기'+ text); */

			var container = document.getElementById('seachedMap');
			var options = {
					center: new daum.maps.LatLng(wi, ky),
					level: 6,
			};
			var map= new daum.maps.Map(container, options);
		});
		$('#addr_sido').change(function() {
			$('#addr_sigungu').find('option').each(function() {
				if($(this).val()!= 0) {
					$(this).remove();
				}
			});
			var no= $('#addr_sido').val();
			$.ajax({
				type: "post",
				url: "/dinner/admin/restaurant/getSigungu.do",
				data: {
					sidoNo: no,
				},
				success: function(res) {
					console.log(res);
					for(var i in res) {
						var wi= $('<input type="hidden" value="'+res[i].addrWi + '" />');
						var ky= $('<input type="hidden" value="'+res[i].addrKy + '" />');
						var addEl= $('<option value="'+ res[i].sigunguNo+ '">'+ res[i].sigunguName+ '</option>');
						addEl.append(wi);
						addEl.append(ky);
						$('#addr_sigungu').append(addEl);
					}
				},
				error: function(xhr, sta, err) {
					alert(sta+ ' => '+ err);
				},
			});
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

<div>
	<h2>지도 위치 변경해서 띄우기</h2>
	<label for="addr_sido">시도</label>
	<select id="addr_sido">
		<option value="0">시도를 선택하세요</option>
		<c:forEach var= "vo" items= "${sido_list }">
			<option value="${vo.sidoNo }">${vo.sidoName }</option>
		</c:forEach>
	</select>
	<label for="addr_sigungu">시군구</label>
	<select id="addr_sigungu">
		<option value="0">시군구를 선택하세요</option>
		<c:forEach var= "vo" items= "${sigungu_list }">
			<option value="${vo.sigunguNo }">${vo.sigunguName }</option>
		</c:forEach>
	</select>
	<button id="searchMap">지도 보기</button>
	<div id= 'seachedMap' style="width: 300px; height: 300px;"></div>
</div>

<div>
	<h2>검색하기</h2>
	<input type="text" id= key>
	<button id="searchMap2">지도 보기</button>
	<div id= 'searchedMap2' style="width: 300px; height: 300px;"></div>
</div>