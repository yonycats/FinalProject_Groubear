<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!-- sweetalert2 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<!-- axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<style>
.weatherDiv {
	border: 3px solid cornflowerblue;
    height: 400px;
    width: 440px;
    border-radius: 50px;
    box-shadow: 10px;
    box-shadow: 0px 0px 20px 0px #3b73d857;
}

.button {
	width: 400px;
    height: 130px;
}

.fontDoHyeun {
	font-family: "Do Hyeon", sans-serif;
	font-weight: 400;
	font-style: normal;
}

.windy {
	position: relative;
    transform: translate(-50%, -50%);
    top: 27px;
    left: -20px;
}

.foodEffect {
	z-index: 1;
	border-radius: 50px;
	box-shadow: 0px 0px 20px 0px #3968bc69;
    animation-name: foodEffect;
    animation-duration: 2s;
    animation-fill-mode: forwards; /* 애니메이션 완료 후 최종 상태 유지 */
    animation-timing-function: ease-in-out; /* 이징 효과 추가 */
}

@keyframes foodEffect {
    0% {
       transform: scale(0.05) rotate(0deg); /* 작게 시작하고 회전 없음 */
    }
    100% {
       transform: scale(0.85) rotate(1440deg); /* 원래 크기로 확대하면서 360도 회전 */
    }
}

.foodName {
	opacity: 0; /* 초기 상태: 투명 */
	width: 95%;
	margin-top: 90px;
    position: absolute;
    z-index: 2;
    animation-delay: 1s; /* 1초 후에 애니메이션 시작 */
    animation-name: foodName;
    animation-duration: 2s;
    animation-fill-mode: forwards; /* 애니메이션 완료 후 최종 상태 유지 */
    animation-timing-function: ease-in-out; /* 이징 효과 추가 */
}

@keyframes foodName {
    0% {
        transform: scale(0.1) rotate(0deg); /* 작게 시작하고 회전 없음 */
        opacity: 1;
    }
    50% {
        transform: scale(1.5) rotate(0deg); /* 원래 크기로 확대 */ 
        opacity: 1;
    }
    100% {
        transform: scale(0.9) rotate(0deg); /* 원래 크기로 확대 */
        opacity: 1;
    }
}

.party {
    position: absolute; /* 부모 요소에 상대적으로 위치 설정 */
    z-index: 0; /* 가장 뒤에 위치 */
    opacity: 0; /* 초기 상태: 투명 */
    animation: fadeIn 0.5s forwards; /* 애니메이션 이름과 지속 시간 설정 */
    animation-delay: 2s; /* 2초 후에 애니메이션 시작 */
    top: 57%; /* Y축 가운데 정렬 */
    left: 50%; /* X축 가운데 정렬 */
    transform: translate(-50%, -50%); /* 중앙 정렬을 위해 변환 */
    width: 800px;
    height: 794px; 
}

@keyframes fadeIn {
    to {
        opacity: 1; /* 애니메이션이 끝날 때: 불투명 */
    }
}

.fontShadow {
    margin-left: -30px;
    width: 40px;
    height: 5px;
    background-color: gray;
    border-radius: 50%;
    opacity: 60%;
    position: absolute;
    margin-top: 25%;
}
</style>

<div style="margin-bottom: 30px;">
	<div style="margin-top: -32px;">
		<div class="separator border-2 my-10"></div>
	</div>
	<div style="margin-left: 30px; margin-top: -100px;">
		<h3>메뉴추천</h3>
		<h6>메뉴추천</h6>
	</div>
</div>

<div id="kt_app_content_container" class="app-container container-fluid"> 
	<div class="card card-flush" style="margin-bottom: 40px; min-height: 43em;">
    	
    	<div class="ms-20 ps-10  my-10 mt-20">
    		<span>
	    		<i class="ki-duotone ki-geolocation fs-2tx" style="color: #0074ff"> 
				 <span class="path1"></span>
				 <span class="path2"></span> 
				</i>
    		</span>
    		<span class="fontDoHyeun fs-2tx ms-5">대전시 중구 오류동</span>
    	</div>
    	
    	<div id="weather" class="row ms-20 me-10 d-flex justify-content-center">
    		
		</div>
		
		<div class="d-flex justify-content-center">
			<button type="button" class="btn btn-light-info button fontDoHyeun fs-3hx mx-10 mt-10 mb-20" data-bs-stacked-modal="#kt_modal_stacked_2" onclick="f_randomRcmdtn()">랜덤메뉴 추천</button>
			<button type="button" class="btn btn-light-danger button fontDoHyeun fs-3hx mx-10 mt-10 mb-20" onclick="f_weatherRcmdtn()">날씨메뉴 추천</button>
		</div>
		
	</div>
	
	<div class="card card-flush" style="margin-bottom: 40px; min-height: 55em;">
		<div class="modal-body text-center">
			<div class="row">
				<div class="col-2">
	    	        <div class="fontDoHyeun fs-5tx">비빔밥</div>
					<img src="${pageContext.request.contextPath }/resources/file/image/food/bibimbap.jpg" class="mw-300px"> 
				</div>
				 
				 <div class="col-10">
				 	ss
				 </div>
			</div>
        </div> 
	</div>
	
</div>


<!-- 모달 시작 -->
<div class="modal fade" tabindex="-1" id="menuRcmdtn" style="background-color: #000000ab">
	<div class="modal-dialog modal-dialog-centered modal-lg">
	    <div class="modal-content" style="min-height: 800px;">
	        <div class="modal-header">
	            <h3 id="menuTitle" class="modal-title fs-3qx w-100 text-center fontDoHyeun">오늘의 메뉴추천!</h3>
				<img src="${pageContext.request.contextPath }/resources/file/image/food/party.gif" class="party"> 
	            <div class="btn btn-icon btn-sm btn-active-light-primary ms-2" data-bs-dismiss="modal" aria-label="Close">
	                <i class="ki-duotone ki-cross fs-3qx"><span class="path1"></span><span class="path2"></span></i>
	            </div>
	        </div>
	        <div class="modal-body text-center">
	            <div class="fontDoHyeun fs-5tx foodName">비빔밥</div>
				<img src="${pageContext.request.contextPath }/resources/file/image/food/bibimbap.jpg" class="mw-750px foodEffect"> 
	        </div>
	    </div>
	</div>
</div>
<!-- 모달 끝 -->
	        
<%-- 			<img src="${pageContext.request.contextPath }/resources/file/image/food/menuRoading.gif" class="mw-150px">  --%>

<script>
let weather = document.querySelector("#weather");	// 날씨 위젯을 넣을 위치
let todayWeatherState = "";		// 오늘의 날씨 상태 (메뉴추천을 위한 날씨 키워드 세팅)

let allFoodList = [];	// 모든 메뉴 목록
let weatherRcmdtnFoodList = [];	// 날씨 추천 메뉴

const modal = new bootstrap.Modal(menuRcmdtn);

$(function() {

	// 모든 메뉴 목록 가져오기
	axios.get("/employee/foodSelectList.do")
	.then(function(res) {

		if (res.status == 200) {
			let data = res.data;
			console.log(res);
			
			allFoodList = data;
			console.log("allFoodList");
			console.log(allFoodList);
		}
	}).catch(function(error) {
		console.log(error);
		Swal.fire({
			icon: 'warning',
			title: '서버 접속에 실패했습니다.',
			text:  '다시 시도해주세요.',
			confirmButtonColor: '#4FC9DA',
		});
	});

	
	/* 
	# getVilageFcst (단기예보)
	최대치(1000)로 요청 시 11개의 속성이 시간단위로 3일~4일간의 정보가 전달되기 때문에 600 ~ 900 개의 row 값을 갖는다.
	
	- TMP : 1시간 기온
	- UUU: 풍속(동서성분) m/s
	- VVV: 풍속(남북성분) m/s
	- VEC: 풍향 deg
	- WSD: 풍속 m/s
	- SKY: 맑음(1), 구름많음(3), 흐림(4)
	- PTY: 강수형태 - (단기) 없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4)
	- POP: 강수확률 %
	- WAV: 파고 M
	- PCP: 1시간 강수량 (mm)
	- REH: 습도 %
	- SNO: 적설량 (cm)
	*/
	
	
	//오늘 날짜 구하기
	let currentDate = new Date();
	
	let year = currentDate.getFullYear();
	let month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
	let day = ('0' + currentDate.getDate()).slice(-2);
	
	let formattedDate = year + month + day;
	
	// 결과 출력
	
	// 단기예보 기준시간
	let baseTimes = ['0200', '0500', '0800', '1100', '1400', '1700', '2000', '2300'];
	 
	// 현재 시간 기준으로 단기예보 기준시간 중, 예보가 공개된 가장 가까운 시간 구하기
	let formattedTime = null;
	let hours = ('0' + currentDate.getHours()).slice(-2) + "00"; 
	/* console.log("hours : ", hours); */
	 
	for (let i=0; i < baseTimes.length; i++) {
		if (baseTimes[i] < hours) {
			formattedTime = baseTimes[i];
		}
	} 
	/* console.log("formattedTime : ", formattedTime); */
	
	// 좌표를 격자 x,y point로 바꾸기
	let result = dfs_xy_conv("toXY", latPoint, lonPoint);
	/* console.log("좌표를 격자 x,y point로 바꾸기");
	console.log("X:", result.x, "Y:", result.y); */
	
	xPoint = result.x;
	yPoint = result.y;
	
	// 날짜별로 데이터를 정리할 변수
	let forecastData = {};
	
	// 기상청 단기예보 API 요청하기
	let xhr = new XMLHttpRequest();
	let url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst'; /*URL*/
	let queryParams = '?' + encodeURIComponent('serviceKey') + '='+'AjLqAMVpLCijw8iZyI1GTt9ntTWfCAIjUDyOga5Becn7TLmzEmAYrJ6dNZ%2FtOqZLkQzQ3GWRy2PZ1f0nzgnsKA%3D%3D'; /*인증키*/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /*한 페이지 결과 수*/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지번호*/
	queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /*요청자료형식(XML/JSON)*/
	queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent(formattedTime); /* 발표시각 */
	queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent(formattedDate); /* 발표일자 */
	queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent(xPoint); /* 예보지점 X 좌표 */
	queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent(yPoint); /* 예보지점 Y 좌표 */
	/* console.log(url + queryParams); */
	
	xhr.open('GET', url + queryParams);
	
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	        if (this.status == 200) {
	            console.log("Success");
	            console.log(this.responseText); 
	           
	            // JSON 파싱
	            let jsonResponse = JSON.parse(this.responseText);
	            /* console.log(jsonResponse); */
	            
	            // 필요한 정보 리스트 추출
	            let items = jsonResponse.response.body.items.item;
	
	            
	            /*  
	            - TMP : 1시간 기온
	            - POP: 강수확률 %
	            - PTY: 강수형태 - (단기) 없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4)
	            - SKY: 맑음(1), 구름많음(3), 흐림(4)
	            - WSD: 풍속 m/s
	            - REH: 습도 %
	             */
	            items.forEach(item => {
	                const date = item.fcstDate; // 예보 날짜
	                const category = item.category; // 예보 카테고리
	                const value = parseFloat(item.fcstValue); // 예보 값
	
	             	// 날짜별 객체 생성
	             	// 동일한 날짜의 여러 날씨 데이터를 압축하여 하나의 객체로 통합함 
	                if (!forecastData[date]) {
	                    forecastData[date] = {
	                        temperature: { min: Infinity, max: -Infinity },
	                        rain: { min: Infinity, max: -Infinity },
	                        rainType: { min: Infinity, max: -Infinity },
	                        snow: { min: Infinity, max: -Infinity },
	                        sky: { min: Infinity, max: -Infinity },
	                        windy: { min: Infinity, max: -Infinity },
	                        wet: { min: Infinity, max: -Infinity }
	                    };
	                };
	                 
	                // 데이터 추가
	                if (category === 'TMP') {
	                    // 기온
	                    forecastData[date].temperature.min = Math.min(forecastData[date].temperature.min, parseFloat(value));
	                    forecastData[date].temperature.max = Math.max(forecastData[date].temperature.max, parseFloat(value));
	                } else if (category === 'POP') {
	                    // 강수량
	                    forecastData[date].rain.min = Math.min(forecastData[date].rain.min, parseFloat(value));
	                    forecastData[date].rain.max = Math.max(forecastData[date].rain.max, parseFloat(value));
	                } else if (category === 'PTY') {
	                    // 강수형태
	                    forecastData[date].rainType.min = Math.min(forecastData[date].rainType.min, parseFloat(value));
	                    forecastData[date].rainType.max = Math.max(forecastData[date].rainType.max, parseFloat(value));
	                } else if (category === 'SKY') {
	                    // 하늘 상태
	                    forecastData[date].sky.min = Math.min(forecastData[date].sky.min, parseFloat(value));
	                    forecastData[date].sky.max = Math.max(forecastData[date].sky.max, parseFloat(value));
	                } else if (category === 'WSD') {
	                    // 풍속
	                    forecastData[date].windy.min = Math.min(forecastData[date].windy.min, parseFloat(value));
	                    forecastData[date].windy.max = Math.max(forecastData[date].windy.max, parseFloat(value));
	                } else if (category === 'REH') {
	                    // 습도
	                    forecastData[date].wet.min = Math.min(forecastData[date].wet.min, parseFloat(value));
	                    forecastData[date].wet.max = Math.max(forecastData[date].wet.max, parseFloat(value));
	                }
	            });
	
	            // 결과 출력
	            // JSON.stringify(변환할 객체, 변환 과정에서 사용할 replacer 함수 또는 배열/null로 설정하면 모든 속성이 변환, JSON 문자열의 들여쓰기(spacing) 수준을 지정)
	            /* console.log(JSON.stringify(forecastData, null, 2)); */
	            
	            
	         	// 날짜별로 분류한 데이터를 사용해서 화면에 가공해서 넣기
	         	 
	         	// forecastData가 객체 형태로 되어 있기 때문에, forecastData.length를 사용할 수 없음
	         	// forecastData의 키(날짜)를 배열로 가져오기
				let dates = Object.keys(forecastData);
	            
	            for (let i = 0; i < 3; i++) {	// 날씨는 3일만 출력
	            	// 날짜 (키) 
	            	let date = (dates[i]);
	            	let forecast = forecastData[date];
	            	/* console.log(JSON.stringify(forecast, null, 2)); */
	            	
	            	// 날짜 세팅
	            	let weatherDate = date.substring(4,6) + "." + date.substring(6,8);
	            	
	            	const today = currentDate.getDay();
	            	const dayList = ['일', '월', '화', '수', '목', '금', '토'];
	                const index = (today + i) % dayList.length;
	            	let weatherWeek = dayList[index];
	            	
	            	let weatherDay = "";
	            	if (i == 0) {
	            		weatherDay = "오늘";
	            	} else if (i == 1) {
	            		weatherDay = "내일"; 
	            	} else if (i == 2) {
	            		weatherDay = "모레";
	            	}
	            	
					// 하늘 상태 아이콘 세팅
	            	/* let weatherSky = Math.round((forecast.sky.max + forecast.sky.min) / 2); */	// 반올림
	            	let weatherSky = Math.trunc((forecast.sky.max + forecast.sky.min) / 2);	// 소수점 절삭
					if (weatherSky == 1 || weatherSky == 2) {
						weatherSky = "/resources/file/image/weather/fill/clear-day.svg";
					} else if (weatherSky == 3) {
						weatherSky = "/resources/file/image/weather/fill/overcast-day.svg";
					} else if (weatherSky == 4) {
						weatherSky = "/resources/file/image/weather/fill/overcast.svg";
					}
					
					// 온도 세팅
					let weatherTemMin = forecast.temperature.min;
					let weatherTemMax = forecast.temperature.max;
	            	
					// 현재 날씨 상태 글자 세팅
					let weatherState = "";
					switch(forecast.rainType.max) {
						case 0:
							weatherState = "맑음";
							break;
						case 1:
							weatherState = "비";
							break;
						case 2:
							weatherState = "비/눈";
							break;
						case 3:
							weatherState = "눈";
							break;
						case 4:
							weatherState = "소나기";
							break;
					}
					
					// 현재 날씨 상태에 따른 아이콘 변경 (비,눈,소나기)
					if (weatherState == 1) {
						weatherSky = "/resources/file/image/weather/fill/rain.svg";
					} else if (weatherState == 2) {
						weatherSky = "/resources/file/image/weather/fill/sleet.svg";
					} else if (weatherState == 3) {
						weatherSky = "/resources/file/image/weather/fill/snow.svg";
					} else if (weatherState == 4) {
						weatherSky = "/resources/file/image/weather/fill/rain.svg";
					}
					
					// 현재 습도 세팅
					let weatherWet = Math.trunc((forecast.wet.max + forecast.wet.min) / 2);	// 소수점 절삭
					
					// 현재 풍속 아이콘 세팅
					let weatherWindy = Math.trunc((forecast.windy.max + forecast.windy.min) / 2);	// 소수점 절삭;
					/* console.log("weatherWindy : ", weatherWindy); */
					switch(weatherWindy) {
						case 0:
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-0.svg";
							break;
						case 1:
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-1.svg";
							break;
						case 2:
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-2.svg";
							break;
						case 3:
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-3.svg";
							break;
						case 4:
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-4.svg";
							break;
						case 5:
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-5.svg";
							break;
						case 6:
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-6.svg";
							break;
						case 7:
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-7.svg";
							break;
						case 8:
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-8.svg";
							break;
						case 9:
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-9.svg";
							break;
						case 10:
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-10.svg";
							break;
						case 11:
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-11.svg";
							break;
						default:	// 12 이상인 경우
							weatherWindy = "/resources/file/image/weather/fill/wind-beaufort-12.svg";
							break;
					}
					
					// 메뉴추천을 위한 오늘의 날씨 상태 세팅
					if (weatherState == "맑음") {
						todayWeatherState = "맑음";
					} else if (weatherSky == 3 || weatherSky == 4) {
						todayWeatherState = "흐림";
					} else if (weatherState == "눈") {
						todayWeatherState = "추움";
					} else if (weatherTemMax < 20) {
						todayWeatherState = "추움";
					} else if (weatherTemMax > 27) {
						todayWeatherState = "더움";
					} else if (weatherState == "비" || weatherState == "비/눈" || weatherState == "소나기") {
						todayWeatherState = "습함";
					} else if (weatherWet > 90) {
						todayWeatherState = "습함";
					}
					/* console.log("todayWeatherState : ", todayWeatherState); */
					
	            	// 날씨 위젯을 만들어서 화면에 넣기
	                let weatherDiv = document.createElement('div');
	                weatherDiv.className = 'col-4 mb-20 me-10 weatherDiv'; 
	            	 
	            	weatherDiv.innerHTML = `<div class='text-center fontDoHyeun fs-2tx mt-5'>\${weatherDate}(\${weatherWeek}) \${weatherDay}</div>
								    			<div class='d-flex'> 
								    				<img src='${pageContext.request.contextPath }\${weatherSky}' class='mw-200px'>
													<span class='row pt-10 ps-5'> 
														<span class='fs-4hx fontDoHyeun mt-3' style='height: 20px;'>
															<font color='blue'>\${weatherTemMin}&deg;</font>
															<font class='fontDoHyeun'> / </font> 
															<font color='red'>\${weatherTemMax}&deg;</font>  
														</span>		
														<span class='mt-10'> 
															<span class='fs-2tx fontDoHyeun'>\${weatherState}</span>
														</span>							                    
													</span> 
								    			</div>
								    			<div style='margin-top: -25px;'>
								    				<span class='ms-4 me-15' style='width: 50%;'>
									    				<img src='${pageContext.request.contextPath }/resources/file/image/weather/line/humidity.svg' class='mw-100px'>
								    					<span class='fs-3tx fontDoHyeun' style='position: absolute; margin-top: 40px;'>\${weatherWet}<font class='fs-1'>%</font></span> 
								    				</span> 
								    				<span class='ms-15' style='width: 50%;'> 
									    				<img src='${pageContext.request.contextPath }\${weatherWindy}' class='mw-150px'>
								    					<span class="fw-bold fs-2 windy">m/s</span>
									    			</span>
								    			</div>`
	            	
	            	weather.appendChild(weatherDiv);
								    			
					
	            }
				
				// 오늘의 날씨 상테에 따라서 날씨추천 리슽 (weatherRcmdtnFood)에 리스트 넣기
            	allFoodList.forEach(food => {
            		if (food.foodLinkWeather.includes(todayWeatherState)) {
            			weatherRcmdtnFoodList.push(food);
            		}
            	});
				
            	console.log("todayWeatherState"); 
            	console.log(todayWeatherState);
				console.log("weatherRcmdtnFoodList");
				console.log(weatherRcmdtnFoodList);
	
	        } else {
	            console.log("Error: " + this.status);
	        }
	    }
	};

	xhr.send('');
	
	
	// 모달이 닫힐 때 이벤트 리스너 추가
	document.querySelector('#menuRcmdtn').addEventListener('hidden.bs.modal', function () {
		alert("sss");
		
		let container = document.querySelector('#kt_app_content_container');
		
		
	    // 스크롤을 내릴 위치 (예: 문서의 높이)
	    window.scrollTo(0, document.body.scrollHeight);
	});

});

// 랜덤 메뉴추천 버튼 눌렀을 때
function f_randomRcmdtn() { 
	let index = Math.floor(Math.random() * allFoodList.length);
	f_foodModalPut(allFoodList[index]);
	
	let menuTitle = document.querySelector('#menuTitle'); 
	menuTitle.innerHTML = "<span class='fs-3qx'>오늘의 <span class='fs-4qx'>랜덤</span> 메뉴는?</span>";
	
	modal.show();
}

// 날씨 메뉴추천 버튼 눌렀을 때
function f_weatherRcmdtn() {
	let index = Math.floor(Math.random() * weatherRcmdtnFoodList.length);
	f_foodModalPut(weatherRcmdtnFoodList[index]);
	
	let menuTitle = document.querySelector('#menuTitle');
	menuTitle.innerHTML = "<span class='fs-3qx'>오늘의 날씨는 </span><span class='fs-4qx'>'" + todayWeatherState + "!'</span>";
	
	modal.show();
}

// 랜덤으로 골라진 음식의 이름과 이미지 주소를 DOM에 넣는 함수
function f_foodModalPut(fdList) {
	let foodName = document.querySelector(".foodName");
	foodName.innerText = fdList.foodNmKor;
	
	let foodEffect = document.querySelector(".foodEffect");
	foodEffect.src = "${pageContext.request.contextPath }/resources/file/image/food/" + fdList.foodNmEng + ".jpg";
	
	console.log("fdList.foodNmKor : ", fdList.foodNmKor);
}

let lonPoint = "127.405922222222";  // 경도
let latPoint = "36.3226";  // 위도
let xPoint = "";    // 격자 x 포인트
let yPoint = "";    // 격자 y 포인트 

/** 위도, 경도를 x,y 격자 포인트로 변경 */
var RE = 6371.00877; // 지구 반경(km)
var GRID = 5.0; // 격자 간격(km)
var SLAT1 = 30.0; // 투영 위도1(degree)
var SLAT2 = 60.0; // 투영 위도2(degree)
var OLON = 126.0; // 기준점 경도(degree)
var OLAT = 38.0; // 기준점 위도(degree)
var XO = 43; // 기준점 X좌표(GRID)
var YO = 136; // 기1준점 Y좌표(GRID)

// LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
function dfs_xy_conv(code, v1, v2) {
    // LCC DFS 좌표변환을 위한 기초 자료
    var DEGRAD = Math.PI / 180.0;
    var RADDEG = 180.0 / Math.PI;

    var re = RE / GRID;
    var slat1 = SLAT1 * DEGRAD;
    var slat2 = SLAT2 * DEGRAD;
    var olon = OLON * DEGRAD;
    var olat = OLAT * DEGRAD;

    var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
    var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
    var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
    ro = re * sf / Math.pow(ro, sn);
    var rs = {};
    if (code == "toXY") {
        rs['lat'] = v1;
        rs['lng'] = v2;
        var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
        ra = re * sf / Math.pow(ra, sn);
        var theta = v2 * DEGRAD - olon;
        if (theta > Math.PI) theta -= 2.0 * Math.PI;
        if (theta < -Math.PI) theta += 2.0 * Math.PI;
        theta *= sn;
        rs['x'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
        rs['y'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
    }
    else {
        rs['x'] = v1;
        rs['y'] = v2;
        var xn = v1 - XO;
        var yn = ro - v2 + YO;
        ra = Math.sqrt(xn * xn + yn * yn);
        if (sn < 0.0) - ra;
        var alat = Math.pow((re * sf / ra), (1.0 / sn));
        alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;

        if (Math.abs(xn) <= 0.0) {
            theta = 0.0;
        }
        else {
            if (Math.abs(yn) <= 0.0) {
                theta = Math.PI * 0.5;
                if (xn < 0.0) - theta;
            }
            else theta = Math.atan2(xn, yn);
        }
        var alon = theta / sn + olon;
        rs['lat'] = alat * RADDEG;
        rs['lng'] = alon * RADDEG;
    }
    return rs;
}
</script>