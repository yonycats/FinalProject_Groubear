<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="kt_app_content_container" class="app-container container-fluid">
	<div class="card card-flush py-4">
		<div class="card-header">
			<div class="card-title">
				<h2>GROUBEAR와 함께하는 기업</h2>
			</div>
		</div>
		<div class="card-body pt-0">
			<div class="card card-flush"
				style="overflow-y: scroll; height: 600px; width: 30%; float: left;">
				<div class="card-header mb-5 pt-7" id="kt_chat_contacts_header">
					<form class="w-100 position-relative" autocomplete="off">
						<i
							class="ki-duotone ki-magnifier fs-3 text-gray-500 position-absolute top-50 ms-5 translate-middle-y">
							<span class="path1"></span> <span class="path2"></span>
						</i> <input type="text" class="form-control form-control-solid px-13"
							name="search" value="" placeholder="검색">
					</form>
				</div>


				<div id="kt_account_settings_signin_method" class="collapse show">
					<div class="card-body border-top p-9">
						<c:forEach items="${mapList }" var="map">
							<div class="d-flex flex-wrap align-items-center">
								<div id="kt_signin_email">
									<div class="fs-6 fw-bold mb-1">${map.coNm }</div>
									<div class="fw-semibold text-gray-600">${map.coAddr }</div>
								</div>
							</div>
							<div class="separator separator-dashed my-6"></div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="flex-column" id="chartdiv" style="width: 68%; height: 600px; float: right;">
			</div>
		</div>
	</div>




</div>




<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=711db03122284265cef8780056e74af7"></script>
<script>
    var map = new kakao.maps.Map(document.getElementById('chartdiv'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
        level : 14 // 지도의 확대 레벨 
    });
    
    // 마커 클러스터러를 생성합니다 
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });
 
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.get("/download/web/data/chicken.json", function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        var markers = $(data.positions).map(function(i, position) {
            return new kakao.maps.Marker({
                position : new kakao.maps.LatLng(position.lat, position.lng)
            });
        });

        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
    });
</script>

