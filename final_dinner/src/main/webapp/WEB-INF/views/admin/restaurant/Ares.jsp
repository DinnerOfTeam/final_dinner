<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cdbb1fcc37fcc24c8dd0e57204ffee3c&libraries=services"></script>
<script>
	$(function() {
		
		$('#searchMap').click(function() {
			var add1= $('#addr_sido :selected').text();
			var add2= $('#addr_sigungu :selected').text();
			var is2= $('#addr_sigungu :selected').val();
			$('#map').find('div').remove();

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
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
			    }
			});
			</c:forEach>
			
			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places(); 

			// 키워드로 장소를 검색합니다
			if(is2!= 0) {
				ps.keywordSearch(add1+ add2, placesSearchCB); 
			}else {
				ps.keywordSearch(add1, placesSearchCB); 
			}

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
						var addEl= $('<option value="'+ res[i].sigunguNo+ '">'+ res[i].sigunguName+ '</option>');
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
</div>

