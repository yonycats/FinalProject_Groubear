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
			<div class="flex-column" id="chartdiv"
				style="width: 68%; height: 600px; float: right;">
				<div aria-hidden="true"
					style="position: absolute; width: 239px; height: 300px;">
					<div>
						<canvas class="am5-layer-0" width="268" height="337"
							style="position: absolute; top: 0px; left: 0px; width: 239px; height: 300px;"></canvas>
						<canvas class="am5-layer-30" width="268" height="337"
							style="position: absolute; top: 0px; left: 0px; width: 239px; height: 300px;"></canvas>
					</div>
				</div>
				<div class="am5-html-container"
					style="position: absolute; pointer-events: none; overflow: hidden; width: 239px; height: 300px;"></div>
				<div class="am5-reader-container" role="alert"
					style="position: absolute; width: 1px; height: 1px; overflow: hidden; clip: rect(1px, 1px, 1px, 1px);"></div>
				<div class="am5-focus-container" role="graphics-document"
					style="position: absolute; pointer-events: none; top: 0px; left: 0px; overflow: hidden; width: 239px; height: 300px;">
					<div tabindex="0"
						style="position: absolute; pointer-events: none; top: -2px; left: -2px; width: 39px; height: 39px;"></div>
					<div tabindex="0"
						style="position: absolute; pointer-events: none; top: -2px; left: -2px; width: 39px; height: 39px;"></div>
					<div tabindex="0"
						style="position: absolute; pointer-events: none; top: -2px; left: -2px; width: 39px; height: 39px;"></div>
				</div>
				<div class="am5-tooltip-container"></div>
			</div>
		</div>
	</div>




</div>


<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/map.js"></script>
<script src="https://cdn.amcharts.com/lib/5/geodata/worldLow.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
<script type="text/javascript">


// am5.ready(function() {
//     var root = am5.Root.new("chartdiv");

//     root.setThemes([am5themes_Animated.new(root)]);

//     var chart = root.container.children.push(
//         am5map.MapChart.new(root, {
//             panX: "rotateX",
//             panY: "translateY",
//             projection: am5map.geoMercator(),
//         })
//     );

//     var polygonSeries = chart.series.push(
//         am5map.MapPolygonSeries.new(root, {
//             geoJSON: am5geodata_worldLow,
//             exclude: ["AQ"]
//         })
//     );

//     polygonSeries.mapPolygons.template.setAll({
//         fill: am5.color(0xdadada)
//     });

//     var pointSeries = chart.series.push(am5map.ClusteredPointSeries.new(root, {}));

//     // 도시 데이터
//     var cities = [
//         { title: "서울", latitude: 37.5665, longitude: 126.978 },
//         { title: "부산", latitude: 35.1796, longitude: 129.0756 },
//     ];

//     for (var i = 0; i < cities.length; i++) {
//         var city = cities[i];
//         addCity(city.longitude, city.latitude, city.title);
//     }

//     function addCity(longitude, latitude, title) {
//         pointSeries.data.push({
//             geometry: { type: "Point", coordinates: [longitude, latitude] },
//             title: title
//         });
//     }

//     // 페이지 로드 시 한국으로 이동
//     chart.appear(1000, 100);
//     chart.set("zoom", 4); // 확대 비율 설정
//     chart.set("center", [126.978, 37.5665]); // 한국 중심으로 설정
// }); // end am5.ready()



//지도
am5.ready(function() {

// 	Create root element
// 	https://www.amcharts.com/docs/v5/getting-started/#Root_element
	var root = am5.Root.new("chartdiv");

	// Set themes
	// https://www.amcharts.com/docs/v5/concepts/themes/
	root.setThemes([
	  am5themes_Animated.new(root)
	]);

	// Create the map chart
	// https://www.amcharts.com/docs/v5/charts/map-chart/
	var chart = root.container.children.push(
	  am5map.MapChart.new(root, {
	    panX: "rotateX",
	    panY: "translateY",
	    projection: am5map.geoMercator(),
	  })
	);

	var zoomControl = chart.set("zoomControl", am5map.ZoomControl.new(root, {}));
	zoomControl.homeButton.set("visible", true);


	// Create main polygon series for countries
	// https://www.amcharts.com/docs/v5/charts/map-chart/map-polygon-series/
	var polygonSeries = chart.series.push(
	  am5map.MapPolygonSeries.new(root, {
	    geoJSON: am5geodata_worldLow,
	    exclude: ["AQ"]
	  })
	);

	polygonSeries.mapPolygons.template.setAll({
	  fill:am5.color(0xdadada)
	});


	// Create point series for markers
	// https://www.amcharts.com/docs/v5/charts/map-chart/map-point-series/
	var pointSeries = chart.series.push(am5map.ClusteredPointSeries.new(root, {}));


	// Set clustered bullet
	// https://www.amcharts.com/docs/v5/charts/map-chart/clustered-point-series/#Group_bullet
	pointSeries.set("clusteredBullet", function(root) {
	  var container = am5.Container.new(root, {
	    cursorOverStyle:"pointer"
	  });

	  var circle1 = container.children.push(am5.Circle.new(root, {
	    radius: 8,
	    tooltipY: 0,
	    fill: am5.color(0xff8c00)
	  }));

	  var circle2 = container.children.push(am5.Circle.new(root, {
	    radius: 12,
	    fillOpacity: 0.3,
	    tooltipY: 0,
	    fill: am5.color(0xff8c00)
	  }));

	  var circle3 = container.children.push(am5.Circle.new(root, {
	    radius: 16,
	    fillOpacity: 0.3,
	    tooltipY: 0,
	    fill: am5.color(0xff8c00)
	  }));

	  var label = container.children.push(am5.Label.new(root, {
	    centerX: am5.p50,
	    centerY: am5.p50,
	    fill: am5.color(0xffffff),
	    populateText: true,
	    fontSize: "8",
	    text: "{value}"
	  }));

	  container.events.on("click", function(e) {
	    pointSeries.zoomToCluster(e.target.dataItem);
	  });

	  return am5.Bullet.new(root, {
	    sprite: container
	  });
	});

	// Create regular bullets
	pointSeries.bullets.push(function() {
	  var circle = am5.Circle.new(root, {
	    radius: 6,
	    tooltipY: 0,
	    fill: am5.color(0xff8c00),
	    tooltipText: "{title}"
	  });

	  return am5.Bullet.new(root, {
	    sprite: circle
	  });
	});


	// Set data		// 점이야 이거
	var cities = [
	  { title: "Vienna", latitude: 48.2092, longitude: 16.3728 },
	  { title: "Minsk", latitude: 53.9678, longitude: 27.5766 },
	  { title: "Brussels", latitude: 50.8371, longitude: 4.3676 },
	  { title: "Sarajevo", latitude: 43.8608, longitude: 18.4214 },
	  { title: "Sofia", latitude: 42.7105, longitude: 23.3238 },
	  { title: "Zagreb", latitude: 45.815, longitude: 15.9785 },
	  { title: "Pristina", latitude: 42.666667, longitude: 21.166667 },
	  { title: "Prague", latitude: 50.0878, longitude: 14.4205 },
	  { title: "Copenhagen", latitude: 55.6763, longitude: 12.5681 },
	  { title: "Tallinn", latitude: 59.4389, longitude: 24.7545 },
	  { title: "Helsinki", latitude: 60.1699, longitude: 24.9384 },
	  { title: "Paris", latitude: 48.8567, longitude: 2.351 },
	  { title: "Berlin", latitude: 52.5235, longitude: 13.4115 },
	  { title: "Athens", latitude: 37.9792, longitude: 23.7166 },
	  { title: "Budapest", latitude: 47.4984, longitude: 19.0408 },
	  { title: "Reykjavik", latitude: 64.1353, longitude: -21.8952 },
	  { title: "Dublin", latitude: 53.3441, longitude: -6.2675 },
	  { title: "Rome", latitude: 41.8955, longitude: 12.4823 },
	  { title: "Riga", latitude: 56.9465, longitude: 24.1049 },
	  { title: "Vaduz", latitude: 47.1411, longitude: 9.5215 },
	  { title: "Vilnius", latitude: 54.6896, longitude: 25.2799 },
	  { title: "Luxembourg", latitude: 49.61, longitude: 6.1296 },
	  { title: "Skopje", latitude: 42.0024, longitude: 21.4361 },
	  { title: "Valletta", latitude: 35.9042, longitude: 14.5189 },
	  { title: "Chisinau", latitude: 47.0167, longitude: 28.8497 },
	  { title: "Monaco", latitude: 43.7325, longitude: 7.4189 },
	  { title: "Podgorica", latitude: 42.4602, longitude: 19.2595 },
	  { title: "Amsterdam", latitude: 52.3738, longitude: 4.891 },
	  { title: "Oslo", latitude: 59.9138, longitude: 10.7387 },
	  { title: "Warsaw", latitude: 52.2297, longitude: 21.0122 },
	  { title: "Lisbon", latitude: 38.7072, longitude: -9.1355 },
	  { title: "Bucharest", latitude: 44.4479, longitude: 26.0979 },
	  { title: "Moscow", latitude: 55.7558, longitude: 37.6176 },
	  { title: "San Marino", latitude: 43.9424, longitude: 12.4578 },
	  { title: "Belgrade", latitude: 44.8048, longitude: 20.4781 },
	  { title: "Bratislava", latitude: 48.2116, longitude: 17.1547 },
	  { title: "Ljubljana", latitude: 46.0514, longitude: 14.506 },
	  { title: "Madrid", latitude: 40.4167, longitude: -3.7033 },
	  { title: "Stockholm", latitude: 59.3328, longitude: 18.0645 },
	  { title: "Bern", latitude: 46.948, longitude: 7.4481 },
	  { title: "Kiev", latitude: 50.4422, longitude: 30.5367 },
	  { title: "London", latitude: 51.5002, longitude: -0.1262 },
	  { title: "Gibraltar", latitude: 36.1377, longitude: -5.3453 },
	  { title: "Saint Peter Port", latitude: 49.466, longitude: -2.5522 },
	  { title: "Douglas", latitude: 54.167, longitude: -4.4821 },
	  { title: "Saint Helier", latitude: 49.1919, longitude: -2.1071 },
	  { title: "Longyearbyen", latitude: 78.2186, longitude: 15.6488 },
	  { title: "Kabul", latitude: 34.5155, longitude: 69.1952 },
	  { title: "Yerevan", latitude: 40.1596, longitude: 44.509 },
	  { title: "Baku", latitude: 40.3834, longitude: 49.8932 },
	  { title: "Manama", latitude: 26.1921, longitude: 50.5354 },
	  { title: "Dhaka", latitude: 23.7106, longitude: 90.3978 },
	  { title: "Thimphu", latitude: 27.4405, longitude: 89.673 },
	  { title: "Bandar Seri Begawan", latitude: 4.9431, longitude: 114.9425 },
	  { title: "Phnom Penh", latitude: 11.5434, longitude: 104.8984 },
	  { title: "Peking", latitude: 39.9056, longitude: 116.3958 },
	  { title: "Nicosia", latitude: 35.1676, longitude: 33.3736 },
	  { title: "T'bilisi", latitude: 41.701, longitude: 44.793 },
	  { title: "New Delhi", latitude: 28.6353, longitude: 77.225 },
	  { title: "Jakarta", latitude: -6.1862, longitude: 106.8063 },
	  { title: "Teheran", latitude: 35.7061, longitude: 51.4358 },
	  { title: "Baghdad", latitude: 33.3157, longitude: 44.3922 },
	  { title: "Jerusalem", latitude: 31.76, longitude: 35.17 },
	  { title: "Tokyo", latitude: 35.6785, longitude: 139.6823 },
	  { title: "Amman", latitude: 31.9394, longitude: 35.9349 },
	  { title: "Astana", latitude: 51.1796, longitude: 71.4475 },
	  { title: "Kuwait", latitude: 29.3721, longitude: 47.9824 },
	  { title: "Bishkek", latitude: 42.8679, longitude: 74.5984 },
	  { title: "Vientiane", latitude: 17.9689, longitude: 102.6137 },
	  { title: "Beyrouth / Beirut", latitude: 33.8872, longitude: 35.5134 },
	  { title: "Kuala Lumpur", latitude: 3.1502, longitude: 101.7077 },
	  { title: "Ulan Bator", latitude: 47.9138, longitude: 106.922 },
	  { title: "Pyinmana", latitude: 19.7378, longitude: 96.2083 },
	  { title: "Kathmandu", latitude: 27.7058, longitude: 85.3157 },
	  { title: "Muscat", latitude: 23.6086, longitude: 58.5922 },
	  { title: "Islamabad", latitude: 33.6751, longitude: 73.0946 },
	  { title: "Manila", latitude: 14.579, longitude: 120.9726 },
	  { title: "Doha", latitude: 25.2948, longitude: 51.5082 },
	  { title: "Riyadh", latitude: 24.6748, longitude: 46.6977 },
	  { title: "Singapore", latitude: 1.2894, longitude: 103.85 },
	  { title: "Seoul", latitude: 37.5139, longitude: 126.9828 },
	  { title: "Colombo", latitude: 6.9155, longitude: 79.8572 },
	  { title: "Damascus", latitude: 33.5158, longitude: 36.2939 },
	  { title: "Taipei", latitude: 25.0338, longitude: 121.5645 },
	  { title: "Dushanbe", latitude: 38.5737, longitude: 68.7738 },
	  { title: "Bangkok", latitude: 13.7573, longitude: 100.502 },
	  { title: "Dili", latitude: -8.5662, longitude: 125.588 },
	  { title: "Ankara", latitude: 39.9439, longitude: 32.856 },
	  { title: "Ashgabat", latitude: 37.9509, longitude: 58.3794 },
	  { title: "Abu Dhabi", latitude: 24.4764, longitude: 54.3705 },
	  { title: "Tashkent", latitude: 41.3193, longitude: 69.2481 },
	  { title: "Hanoi", latitude: 21.0341, longitude: 105.8372 },
	  { title: "Sanaa", latitude: 15.3556, longitude: 44.2081 },
	  { title: "Buenos Aires", latitude: -34.6118, longitude: -58.4173 },
	  { title: "Bridgetown", latitude: 13.0935, longitude: -59.6105 },
	  { title: "Belmopan", latitude: 17.2534, longitude: -88.7713 },
	  { title: "Sucre", latitude: -19.0421, longitude: -65.2559 },
	  { title: "Brasilia", latitude: -15.7801, longitude: -47.9292 },
	  { title: "Ottawa", latitude: 45.4235, longitude: -75.6979 },
	  { title: "Santiago", latitude: -33.4691, longitude: -70.642 },
	  { title: "Bogota", latitude: 4.6473, longitude: -74.0962 },
	  { title: "San Jose", latitude: 9.9402, longitude: -84.1002 },
	  { title: "Havana", latitude: 23.1333, longitude: -82.3667 },
	  { title: "Roseau", latitude: 15.2976, longitude: -61.39 },
	  { title: "Santo Domingo", latitude: 18.479, longitude: -69.8908 },
	  { title: "Quito", latitude: -0.2295, longitude: -78.5243 },
	  { title: "San Salvador", latitude: 13.7034, longitude: -89.2073 },
	  { title: "Guatemala", latitude: 14.6248, longitude: -90.5328 },
	  { title: "Ciudad de Mexico", latitude: 19.4271, longitude: -99.1276 },
	  { title: "Managua", latitude: 12.1475, longitude: -86.2734 },
	  { title: "Panama", latitude: 8.9943, longitude: -79.5188 },
	  { title: "Asuncion", latitude: -25.3005, longitude: -57.6362 },
	  { title: "Lima", latitude: -12.0931, longitude: -77.0465 },
	  { title: "Castries", latitude: 13.9972, longitude: -60.0018 },
	  { title: "Paramaribo", latitude: 5.8232, longitude: -55.1679 },
	  { title: "Washington D.C.", latitude: 38.8921, longitude: -77.0241 },
	  { title: "Montevideo", latitude: -34.8941, longitude: -56.0675 },
	  { title: "Caracas", latitude: 10.4961, longitude: -66.8983 },
	  { title: "Oranjestad", latitude: 12.5246, longitude: -70.0265 },
	  { title: "Cayenne", latitude: 4.9346, longitude: -52.3303 },
	  { title: "Plymouth", latitude: 16.6802, longitude: -62.2014 },
	  { title: "San Juan", latitude: 18.45, longitude: -66.0667 },
	  { title: "Algiers", latitude: 36.7755, longitude: 3.0597 },
	  { title: "Luanda", latitude: -8.8159, longitude: 13.2306 },
	  { title: "Porto-Novo", latitude: 6.4779, longitude: 2.6323 },
	  { title: "Gaborone", latitude: -24.657, longitude: 25.9089 },
	  { title: "Ouagadougou", latitude: 12.3569, longitude: -1.5352 },
	  { title: "Bujumbura", latitude: -3.3818, longitude: 29.3622 },
	  { title: "Yaounde", latitude: 3.8612, longitude: 11.5217 },
	  { title: "Bangui", latitude: 4.3621, longitude: 18.5873 },
	  { title: "Brazzaville", latitude: -4.2767, longitude: 15.2662 },
	  { title: "Kinshasa", latitude: -4.3369, longitude: 15.3271 },
	  { title: "Yamoussoukro", latitude: 6.8067, longitude: -5.2728 },
	  { title: "Djibouti", latitude: 11.5806, longitude: 43.1425 },
	  { title: "Cairo", latitude: 30.0571, longitude: 31.2272 },
	  { title: "Asmara", latitude: 15.3315, longitude: 38.9183 },
	  { title: "Addis Abeba", latitude: 9.0084, longitude: 38.7575 },
	  { title: "Libreville", latitude: 0.3858, longitude: 9.4496 },
	  { title: "Banjul", latitude: 13.4399, longitude: -16.6775 },
	  { title: "Accra", latitude: 5.5401, longitude: -0.2074 },
	  { title: "Conakry", latitude: 9.537, longitude: -13.6785 },
	  { title: "Bissau", latitude: 11.8598, longitude: -15.5875 },
	  { title: "Nairobi", latitude: -1.2762, longitude: 36.7965 },
	  { title: "Maseru", latitude: -29.2976, longitude: 27.4854 },
	  { title: "Monrovia", latitude: 6.3106, longitude: -10.8047 },
	  { title: "Tripoli", latitude: 32.883, longitude: 13.1897 },
	  { title: "Antananarivo", latitude: -18.9201, longitude: 47.5237 },
	  { title: "Lilongwe", latitude: -13.9899, longitude: 33.7703 },
	  { title: "Bamako", latitude: 12.653, longitude: -7.9864 },
	  { title: "Nouakchott", latitude: 18.0669, longitude: -15.99 },
	  { title: "Port Louis", latitude: -20.1654, longitude: 57.4896 },
	  { title: "Rabat", latitude: 33.9905, longitude: -6.8704 },
	  { title: "Maputo", latitude: -25.9686, longitude: 32.5804 },
	  { title: "Windhoek", latitude: -22.5749, longitude: 17.0805 },
	  { title: "Niamey", latitude: 13.5164, longitude: 2.1157 },
	  { title: "Abuja", latitude: 9.058, longitude: 7.4891 },
	  { title: "Kigali", latitude: -1.9441, longitude: 30.0619 },
	  { title: "Dakar", latitude: 14.6953, longitude: -17.4439 },
	  { title: "Freetown", latitude: 8.4697, longitude: -13.2659 },
	  { title: "Mogadishu", latitude: 2.0411, longitude: 45.3426 },
	  { title: "Pretoria", latitude: -25.7463, longitude: 28.1876 },
	  { title: "Mbabane", latitude: -26.3186, longitude: 31.141 },
	  { title: "Dodoma", latitude: -6.167, longitude: 35.7497 },
	  { title: "Lome", latitude: 6.1228, longitude: 1.2255 },
	  { title: "Tunis", latitude: 36.8117, longitude: 10.1761 }
	];

	for (var i = 0; i < cities.length; i++) {
	  var city = cities[i];
	  addCity(city.longitude, city.latitude, city.title);
	}

	function addCity(longitude, latitude, title) {
	  pointSeries.data.push({
	    geometry: { type: "Point", coordinates: [longitude, latitude] },
	    title: title
	  });
	}

	// Make stuff animate on load
	chart.appear(1000, 100);
	 chart.set("center", [126.978, 37.5665]);	// 한국 위도 경도
	
	
	//chart

    // Create root element
    // https://www.amcharts.com/docs/v5/getting-started/#Root_element
    
    
    
    
//    var root = am5.Root.new("kt_amcharts_1");

//     // Set themes
//     // https://www.amcharts.com/docs/v5/concepts/themes/
//     root.setThemes([
//         am5themes_Animated.new(root)
//     ]);

    // Create chart
    // https://www.amcharts.com/docs/v5/charts/xy-chart/
//     var chart = root.container.children.push(am5xy.XYChart.new(root, {
//         panX: false,
//         panY: false,
//         wheelX: "panX",
//         wheelY: "zoomX",
//         layout: root.verticalLayout
//     }));

    // Add legend
    // https://www.amcharts.com/docs/v5/charts/xy-chart/legend-xy-series/
    var legend = chart.children.push(
        am5.Legend.new(root, {
            centerX: am5.p50,
            x: am5.p50
        })
    );

    var data = ['10','20','30']

    // Create axes
    // https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
//     var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
//         categoryField: "year",
//         renderer: am5xy.AxisRendererX.new(root, {
//             cellStartLocation: 0.1,
//             cellEndLocation: 0.9
//         }),
//         tooltip: am5.Tooltip.new(root, {})
//     }));

//     xAxis.data.setAll(data);

//     var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
//         renderer: am5xy.AxisRendererY.new(root, {})
//     }));

    // Add series
    // https://www.amcharts.com/docs/v5/charts/xy-chart/series/
    function makeSeries(name, fieldName) {
        var series = chart.series.push(am5xy.ColumnSeries.new(root, {
            name: name,
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: fieldName,
            categoryXField: "year"
        }));

        series.columns.template.setAll({
            tooltipText: "{name}, {categoryX}:{valueY}",
            width: am5.percent(90),
            tooltipY: 0
        });

        series.data.setAll(data);

        // Make stuff animate on load
        // https://www.amcharts.com/docs/v5/concepts/animations/
        series.appear();

        series.bullets.push(function () {
            return am5.Bullet.new(root, {
                locationY: 0,
                sprite: am5.Label.new(root, {
                    text: "{valueY}",
                    fill: root.interfaceColors.get("alternativeText"),
                    centerY: 0,
                    centerX: am5.p50,
                    populateText: true
                })
            });
        });

        legend.data.push(series);
    }

//     makeSeries("Europe", "europe");
//     makeSeries("North America", "namerica");
//     makeSeries("Asia", "asia");
//     makeSeries("Latin America", "lamerica");
//     makeSeries("Middle East", "meast");
//     makeSeries("Africa", "africa");


    // Make stuff animate on load
    // https://www.amcharts.com/docs/v5/concepts/animations/
    chart.appear(1000, 100);
	
	
}); // end am5.ready()


</script>
