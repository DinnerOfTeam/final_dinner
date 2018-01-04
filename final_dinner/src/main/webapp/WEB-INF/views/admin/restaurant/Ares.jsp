<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cdbb1fcc37fcc24c8dd0e57204ffee3c&libraries=services"></script>
<script>
	$(function() {
		var container = document.getElementById('map');
		var options = {
				center: new daum.maps.LatLng(37.54867003431813, 127.01539018309835),
				level: 9,
		};
		// 지도를 생성합니다    
		var map = new daum.maps.Map(container, options); 

		<c:forEach var="vo" items="${res_list }">
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		geocoder.addressSearch('${vo.resAddressDetail }', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords,
		            title: '${vo.resName}',
		        });
		    }
		});
		</c:forEach>
		
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
			$('#seachedMap').find('div').remove();
			var mapContainer = document.getElementById('seachedMap'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.54867003431813, 127.01539018309835), // 지도의 중심좌표
		        level: 11 // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 
	
			<c:forEach var="vo" items="${res_list }">
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			geocoder.addressSearch('${vo.resAddressDetail }', function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {

			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords,
			            title: '${vo.resName}',
			        });
/* 				// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
				var iwContent = '<div style="padding:5px;">${vo.resName}</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	
				// 인포윈도우를 생성합니다
				var infowindow = new daum.maps.InfoWindow({
				    content : iwContent
				});
	
				// 마커에 마우스오버 이벤트를 등록합니다
				daum.maps.event.addListener(marker, 'mouseover', function() {
				  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
				    infowindow.open(map, marker);
				});
	
				// 마커에 마우스아웃 이벤트를 등록합니다
				daum.maps.event.addListener(marker, 'mouseout', function() {
				    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
				    infowindow.close();
				}); */
			    }
			});
			</c:forEach>
		});
		
		$('#seachMap2').click(function() {
			var add1= $('#addr_sido2 :selected').text();
			var add2= $('#addr_sigungu2 :selected').text();
			$('#seachedMap').find('div').remove();

			var mapContainer = document.getElementById('seachedMap2'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 6 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 

			<c:forEach var="vo" items="${res_list }">
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			geocoder.addressSearch('${vo.resAddressDetail }', function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {

			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords,
			            title: '${vo.resName}',
			        });
/* 				// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
				var iwContent = '<div style="padding:5px;">${vo.resName}</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	
				// 인포윈도우를 생성합니다
				var infowindow = new daum.maps.InfoWindow({
				    content : iwContent
				});
	
				// 마커에 마우스오버 이벤트를 등록합니다
				daum.maps.event.addListener(marker, 'mouseover', function() {
				  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
				    infowindow.open(map, marker);
				});
	
				// 마커에 마우스아웃 이벤트를 등록합니다
				daum.maps.event.addListener(marker, 'mouseout', function() {
				    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
				    infowindow.close();
				}); */
			    }
			});
			</c:forEach>
			
			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places(); 

			// 키워드로 장소를 검색합니다
			ps.keywordSearch(add1+ add2, placesSearchCB); 

			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
			    if (status === daum.maps.services.Status.OK) {

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new daum.maps.LatLngBounds();

			        for (var i=0; i<data.length; i++) {
			            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
			        }       

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			        map.setBounds(bounds);
			    } 
			}
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
		$('#addr_sido2').change(function() {
			$('#addr_sigungu2').find('option').each(function() {
				if($(this).val()!= 0) {
					$(this).remove();
				}
			});
			var no= $('#addr_sido2').val();
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
						$('#addr_sigungu2').append(addEl);
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
<%-- 	<c:forEach var="vo" items="${res_list }">
		<span>${vo.resAddressDetail }</span>
	</c:forEach> --%>
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
	<h2>지도 위치 변경해서 띄우기2</h2>
	<label for="addr_sido2">시도</label>
	<select id="addr_sido2">
		<option value="0">시도를 선택하세요</option>
		<c:forEach var= "vo" items= "${sido_list }">
			<option value="${vo.sidoNo }">${vo.sidoName }</option>
		</c:forEach>
	</select>
	<label for="addr_sigungu2">시군구</label>
	<select id="addr_sigungu2">
		<option value="0">시군구를 선택하세요</option>
		<c:forEach var= "vo" items= "${sigungu_list }">
			<option value="${vo.sigunguNo }">${vo.sigunguName }</option>
		</c:forEach>
	</select>
	<button id="seachMap2">지도 보기2</button>
	<div id= 'seachedMap2' style="width: 300px; height: 300px;"></div>
</div>

<div>
	<h2>검색하기</h2>
	<input type="text" id= key>
	<button id="searchMap2">지도 보기</button>
	<div id= 'searchedMap2' style="width: 300px; height: 300px;"></div>
</div>