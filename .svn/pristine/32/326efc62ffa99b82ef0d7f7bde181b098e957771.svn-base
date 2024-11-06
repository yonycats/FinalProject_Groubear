<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="${pageContext.request.contextPath }/resources/design/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/resources/design/plugins/custom/fullcalendar/fullcalendar.bundle.js"></script>
<script src="${pageContext.request.contextPath }/resources/design/js/custom/apps/calendar/vehicleCalendar.js"></script>
<div style="margin-bottom: 0px;">
	<div style="margin-top: -32px;">
		<div class="separator my-10"></div>
	</div>
	<div style="margin-left: 30px; margin-top: -100px;">
		<h3>차량 예약</h3>
		<h6>차량 예약</h6>
	</div>
</div>
<style>
    #vhclslideshow-container {
        position: relative;
        width: 100%;
        height: 300px; /* 카드 높이에 맞게 조정 */
        overflow: hidden;
    }
    .slide {
        position: absolute;
        width: 100%;
        height: 100%;
        display: none; /* 기본적으로 숨김 */
    }
</style>
<%-- <c:set var="vehicle"></c:set> --%>
<%-- <c:if test="${status eq 'vehicle'}"> --%>
<%-- </c:if> --%>
<div class="card card-flush h-xl-100 d-flex flex-column">
	<div class="card">
		<div style="background-image: url('/upload/Gradient03.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center;">
			<div class="card-header border-0 pt-6">
				<div class="d-flex flex-column fv-row">
					<h3 class="fw-bold text-gray-800 py-3">차량 목록</h3>
					<span class="fs-4 fw-semibold text-gray-600 d-block">
					</span>
				</div>
				<c:choose>
					<c:when test="${empty vhclList}">
						<div class="text-center mt-3">
						    <span>0</span> / <span>0</span>
						</div>
					</c:when>
					<c:otherwise>
						<div id="slide-index" class="text-center mt-3">
						    <span id="current-slide">1</span> / <span id="total-slides">${fn:length(vhclList)}</span>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="card-toolbar pb-3">
				</div>
			</div>
			<div class="d-flex align-items-center justify-content-center h-400px">
			    <div class="image-input px-5" data-kt-image-input="true">
			        <div class="image-input-wrapper w-50px h-50px arrow" onclick="slide('prev')" style="background-image: url('/upload/arrow_back_ios_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.png'); cursor: pointer;" id="leftBtn"></div>
			    </div>
			    <div class="image-input px-5 h-400px" id="vhclslideshow-container">
					<c:choose>
						<c:when test="${empty vhclList}">
							<div class="slide" style="display: none;">
			                    <div class="row">
					                <div class="image-input d-flex align-items-center justify-content-center" data-kt-image-input="true">
					                    <div class="image-input-wrapper w-900px h-550px" style="background-image: url('/upload/shadow.png'); background-size: contain; background-repeat: no-repeat; background-position: bottom;"></div>
					                </div>
			                    </div>
				            </div>
						</c:when>
						<c:otherwise>
					        <c:forEach items="${vhclList }" var="vhcl">
				            <div class="slide" style="display: none;">
			                    <div class="row vhclNoFind" data-vhcl-no="${vhcl.vhclNo }">
					                <table class="table py-5">
					                    <tbody class="d-flex align-items-center justify-content-center">
					                        <tr>
					                            <td><span class="badge badge-light-success fs-7 fw-bold">모델명 - ${vhcl.vhclMdlNm }</span></td>
					                            <td><span class="badge badge-light-primary fs-7 fw-bold">차량 번호 - ${vhcl.vhclNo }</span></td>
					                            <td><span class="badge badge-light-info fs-7 fw-bold">차종 - ${vhcl.vhclKndNm }</span></td>
					                            <td><span class="badge badge-light fs-7 fw-bold">유종 - ${vhcl.vhclTypeFuel}</span></td>
					                            <td><span class="badge badge-light-danger fs-7 fw-bold">연비 - ${vhcl.vhclAvgFuel }㎞/ℓ</span></td>
					                        </tr>
					                    </tbody>
					                </table>
					                <div class="image-input d-flex align-items-center justify-content-center" data-kt-image-input="true">
					                    <div class="image-input-wrapper w-900px h-350px" style="background-image: url('/upload/${vhcl.vhclImgPath }'); background-size: contain; background-repeat: no-repeat; background-position: center;"></div>
					                </div>
			                    </div>
				            </div>
					        </c:forEach>
						</c:otherwise>
					</c:choose>		        	
			    </div>
			    <div class="image-input px-5" data-kt-image-input="true">
			        <div class="image-input-wrapper w-50px h-50px arrow" onclick="slide('next')" style="background-image: url('/upload/arrow_forward_ios_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.png'); cursor: pointer;" id="rightBtn"></div>
			    </div>
			</div>
		</div>
	</div>
</div>
<input type="hidden" id="proStartDt" value="${proStartDt }">
<input type="hidden" id="proEndDt" value="${proEndDt }">
<div class="d-flex mx-2 py-5">
	<form action="/empvehicle/vehiclereservationinsert.do" method="post" id="rsvtForm">
		<div class="py-3 px-3">
			<div class="card card-flush h-xl-100 d-flex flex-column">
				<div class="card-header border-0 pt-7">
					<h1>차량 예약</h1>
				</div>
				<div class="separator separator-dashed my-0"></div>
				<div class="row card-body pt-5">
					<div class="d-flex flex-column fv-row">
						<label class="fs-5 fw-semibold pt-5">이용 시간</label>
					    <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
					    <div class="col-12">
					        <div class="d-flex">
					            <input type="hidden" class="form-control flatpickr-input active" id="vhclIndt" name="vhclIndt">
					            <input type="datetime-local" class="form-control flatpickr-input active" id="vhclRntlDt" name="vhclRntlDt">
					            <input type="datetime-local" class="form-control flatpickr-input active" id="vhclRtnDt" name="vhclRtnDt">
					        </div>
					    </div>
						    
						<label class="fs-5 fw-semibold pt-5">목적지</label>
						<div class="input-group">
						    <input type="text" class="form-control" placeholder="목적지를 입력해주세요" name="vhclBtdst" id="vhclBtdst">
						    <span class="input-group-text">검색</span>
						</div>
						
						<label class="fs-5 fw-semibold pt-5">대여사유</label>
						<div class="input-group">
							<textarea class="form-control" placeholder="대여 사유를 입력해주세요" rows="3" name="rntlRsn" id="rntlRsn"></textarea> <!-- Bootstrap 클래스 추가 -->
						</div>
						<div class="card-footer d-flex align-middle justify-content-center">
							<div class="card-toolbar">
								<button type="submit" class="btn btn-light-success" id="rstvBtn">
								예약하기</button>
							</div>
						</div>
						
						<div class="separator separator-dashed"></div>
						    
						<label class="fs-5 fw-semibold pt-5">차량 정보</label>
					    <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
					    <div class="col-12">
					        <div class="d-flex">
					            <input type="text" class="form-control form-control-solid mx-1" id="modifyVhclNo" name="vhclNo" readonly="readonly">
					            <input type="text" class="form-control form-control-solid mx-1" id="modifyVhclMdlNm" name="vhclMdlNm" readonly="readonly">
					        </div>
					    </div>
						<label class="fs-5 fw-semibold form-control-solid pt-5">차종</label>
						<div class="input-group">
						    <input type="text" class="form-control form-control-solid mx-1" name="vhclAvgFuel" id="modifyVhclKndNm" readonly="readonly">
						</div>
						<label class="fs-5 fw-semibold pt-5">유종</label>
						<div class="input-group">
						    <input type="text" class="form-control form-control-solid mx-1" name="vhclAvgFuel" id="modifyVhclTypeFuel" readonly="readonly">
						</div>
						<label class="fs-5 fw-semibold pt-5">연비</label>
						<div class="input-group">
						    <input type="text" class="form-control form-control-solid mx-1" name="vhclAvgFuel" id="modifyVhclAvgFuel" readonly="readonly">
						    <span class="input-group-text">㎞/ℓ</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="col-xl-8 py-3">
		<div class="card card-flush h-xl-100 d-flex flex-column">
			<div class="card-header border-0 pt-7">
				<h1>주행 일정</h1>
			</div>
			<div class="separator separator-dashed my-0"></div>
			<div class="row card-body pt-5">
				<div id="kt_calendar_app"></div>
				<div class="modal fade" id="kt_modal_add_event" tabindex-="1" aria-hidden="true" data-bs-focus="false">
					<div class="modal-dialog modal-dialog-centered mw-650px">
						<div class="modal-content">
							<form class="form" action="#" id="kt_modal_add_event_form">
							</form>
						</div>
					</div>
				</div>
				<div class="modal fade" id="kt_modal_view_event" tabindex="-1" data-bs-focus="false" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered mw-650px">
						<div class="modal-content">
							<div class="modal-header border-0 justify-content-end">
								<div class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-primary me-2" data-bs-toggle="tooltip" data-bs-dismiss="click" title="일정 수정" id="kt_modal_view_event_edit">
									<i class="ki-duotone ki-pencil fs-2">
										<span class="path1"></span>
										<span class="path2"></span>
									</i>
								</div>
								<div class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-danger me-2" data-bs-toggle="tooltip" data-bs-dismiss="click" title="일정 삭제" id="kt_modal_view_event_delete">
									<i class="ki-duotone ki-trash fs-2">
										<span class="path1"></span>
										<span class="path2"></span>
										<span class="path3"></span>
										<span class="path4"></span>
										<span class="path5"></span>
									</i>
								</div>
								<div class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-primary" data-bs-toggle="tooltip" title="목록" data-bs-dismiss="modal">
									<i class="ki-duotone ki-cross fs-2x">
										<span class="path1"></span>
										<span class="path2"></span>
									</i>
								</div>
							</div>
							<div class="modal-body pt-0 pb-20 px-lg-17">
								<div class="d-flex">
									<i class="ki-duotone ki-calendar-8 fs-1 text-muted me-5">
										<span class="path1"></span>
										<span class="path2"></span>
										<span class="path3"></span>
										<span class="path4"></span>
										<span class="path5"></span>
										<span class="path6"></span>
									</i>
									<div class="mb-9">
										<div class="d-flex align-items-center mb-2">
											<span class="fs-3 fw-bold me-3" data-kt-calendar="event_name"></span>
											<span class="badge badge-light-success" data-kt-calendar="all_day"></span>
										</div>
										<div class="fs-6" data-kt-calendar="event_description"></div>
									</div>
								</div>
								<div class="d-flex align-items-center mb-2">
									<span class="bullet bullet-dot h-10px w-10px bg-success ms-2 me-7"></span>
									<div class="fs-6">
										<span class="fw-bold">시작</span>
										<span data-kt-calendar="event_start_date"></span>
									</div>
								</div>
								<div class="d-flex align-items-center mb-9">
									<span class="bullet bullet-dot h-10px w-10px bg-danger ms-2 me-7"></span>
									<div class="fs-6">
										<span class="fw-bold">종료</span>
										<span data-kt-calendar="event_end_date"></span>
									</div>
								</div>
								<div class="d-flex align-items-center">
									<i class="ki-duotone ki-geolocation fs-1 text-muted me-5">
										<span class="path1"></span>
										<span class="path2"></span>
									</i>
									<div class="fs-6" data-kt-calendar="event_location"></div>
								</div>
							</div>
						</div>
					</div>
				</div>





			</div>
		</div>
	</div>
</div>




<script type="text/javascript">
$(function() {
    let currentSlide = 0; // 현재 슬라이드 인덱스
    const slides = $('#vhclslideshow-container .slide'); // 모든 슬라이드 요소 가져오기
    const totalSlides = slides.length;
    var vhclModifyId = $("#vhclModifyId");
    var delForm = $("#delForm");
    var vhclDelBtn = $("#vhclDelBtn");
    var vhclRntlDt = $("#vhclRntlDt");
    var vhclRtnDt = $("#vhclRtnDt");
    var delVhclNo = $("#delVhclNo");
    var modifyVhclNo = $("#modifyVhclNo");
    var modifyVhclMdlNm = $("#modifyVhclMdlNm");
    var modifyVhclAvgFuel = $("#modifyVhclAvgFuel");
    var modifyVhclKndNm = $("#modifyVhclKndNm");
    var modifyVhclTypeFuel = $("#modifyVhclTypeFuel");
    var modifyVhclImgPath = $("#modifyVhclImgPath");
    var modifyVhclRsvtPsbltyYn = $("#modifyVhclRsvtPsbltyYn");
    var hiddenVhclImgPath = $("#hiddenVhclImgPath");
    var rstvBtn = $("#rstvBtn");
    var vhclNo = ""; // 차량 번호를 전역 변수로 선언
    
    // 현재 슬라이드 인덱스 표시 업데이트 함수
    function updateSlideIndex() {
        $('#current-slide').text(currentSlide + 1); // 1부터 시작하도록 +1
        $('#total-slides').text(totalSlides); // 총 슬라이드 수
    }

    // 첫 번째 슬라이드 표시
    function showSlide(index) {
        slides.hide(); // 모든 슬라이드 숨김
        const currentSlideElement = slides.eq(index); // 현재 슬라이드 요소 가져오기
        currentSlideElement.show(); // 현재 슬라이드만 보이도록 설정
        
        // 현재 슬라이드의 vhclNo 값 가져오기
        vhclNo = currentSlideElement.find('.vhclNoFind').data('vhcl-no'); // .vhclNoFind에서 data-vhcl-no 가져오기
        console.log("현재 슬라이드의 vhclNo: " + vhclNo); // 확인을 위한 로그 출력
        
        $.ajax({
            url: "/empvehicle/findvhclvo.do",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ vhclNo: vhclNo }), // vhclNo를 JSON 문자열로 변환하여 요청
            success: function(vhcl) {
            	console.log("실행후 나온 번호" + vhcl.vhclNo);
            	
            	modifyVhclNo.val(vhcl.vhclNo);
            	delVhclNo.val(vhcl.vhclNo);
            	modifyVhclMdlNm.val(vhcl.vhclMdlNm);
            	modifyVhclAvgFuel.val(vhcl.vhclAvgFuel);
            	modifyVhclKndNm.val(vhcl.vhclKndNm);
            	modifyVhclTypeFuel.val(vhcl.vhclTypeFuel);
            	hiddenVhclImgPath.val(vhcl.vhclImgPath);
    	    },
            error: function() {
                Swal.fire({
                    icon: 'warning',
                    title: '수정 실행 실패!',
                    confirmButtonColor: '#4FC9DA',
                });
            }
        });

        updateSlideIndex(); // 슬라이드 인덱스 업데이트
    }

    // 슬라이드 이동 함수
    window.slide = function(direction) {
        if (direction === 'next') {
            currentSlide = (currentSlide + 1) % totalSlides; // 다음 슬라이드로 이동 (순환)
        } else if (direction === 'prev') {
            currentSlide = (currentSlide - 1 + totalSlides) % totalSlides; // 이전 슬라이드로 이동 (순환)
        }
        showSlide(currentSlide); // 현재 슬라이드 표시
        
        
    };

    // 페이지 로드 시 첫 번째 슬라이드 표시
    showSlide(currentSlide);
    
    vhclRntlDt.on("change", function () {
		var currentTaskDt = new Date();
		var proTaskStartDt = $(this).val();
		var newTaskStartDt = new Date(proTaskStartDt);
		
		if (newTaskStartDt < currentTaskDt) {
			Swal.fire({
				title: '미래의 시간을 입력해주세요!',
				icon: 'warning',
				confirmButtonColor: '#4FC9DA',
				confirmButtonText: '확인',
				reverseButtons: false,
			});
			$(this).val('');
			return;
		}
		
	});
	
	// 마감일 유효성 검사
	vhclRtnDt.on("change", function () {
		var proTaskEndDt = $(this).val();
		var newTaskEndDt = new Date(proTaskEndDt);
		var proTaskStartDt = new Date($("#vhclRntlDt").val());
		
		if (proTaskStartDt && newTaskEndDt < proTaskStartDt) {
			Swal.fire({
				title: '대여일시보다 미래의 시간을 입력해주세요!',
				icon: 'warning',
				confirmButtonColor: '#4FC9DA',
				confirmButtonText: '확인',
				reverseButtons: false,
			});
			$(this).val('');
			return;
		}
	});

});

</script>
