<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


<style>
a {
  color: rgb(21 21 21);
  text-decoration: none;
}
a:hover { 
  color: rgb(57 196 215); 
  text-decoration: none;
}
.txt_line {
   width:22em;
   padding:0 5px;
   overflow:hidden;
   text-overflow:ellipsis;
   white-space:nowrap;
}
.numShadow {
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


<!-- 달력 관련 -->
<style>
/* 일반 캘린더 일정: 하늘색 */
.fc-event.calendar-event, .fc-event.calendar-event * {
	background-color: #BFECFF !important;
	border-color: #BFECFF !important;
	color: #000000 !important;
}

/* 프로젝트 일정: 노란색 */
.fc-event.project-event, .fc-event.project-event * {
	background-color: #F6EFBD !important;
	border-color: #F6EFBD !important;
	color: #000000 !important;
}

/* 전자결재 일정: 핑크색 */
.fc-event.elapr-event, .fc-event.elapr-event * {
	background-color: #FFE1FF !important;
	border-color: #FFE1FF !important;
	color: #000000 !important;
}
</style>
<link
	href="${pageContext.request.contextPath }/resources/design/plugins/custom/fullcalendar/fullcalendar.bundle.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath }/resources/design/plugins/custom/fullcalendar/fullcalendar.bundle.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/design/js/custom/apps/calendar/comCalendar.js"></script>



<div style="margin-bottom: 20px;">
	<div style="margin-top: -32px;">
		<div class="separator border-2 my-10"></div>
	</div>
	<div style="margin-left: 30px; margin-top: -100px;">
		<h1>홈피드</h1>
		<!-- <h6></h6> -->
	</div>
</div>

<!-- div 중에 row가 있는 곳이 한 줄이고, row 내부에 card가 하나의 영역이며,
	 row는 kt_app_content_container 클래스가 있는 div 내부에 넣어야 합니다. 참고해주세용.
-->

<!-- 참고 예시 : (아래는 2개의 카드가 들어가있는 1개의 꽉찬 row임) (그리드 영역은 6:6)
	<div class="row gx-5 gx-xl-10 mb-xl-10">
	
		<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-3 mb-10">
			<div class="card card-flush h-md-50 mb-5 mb-xl-10">
				<div class="card-header pt-5">
				</div>
				<div class="card-body pt-2 pb-4 d-flex align-items-center">
				</div>
			</div>
		</div>
		
		<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-3 mb-10">
			<div class="card card-flush h-md-50 mb-5 mb-xl-10">
				<div class="card-header pt-5">
				</div>
				<div class="card-body pt-2 pb-4 d-flex align-items-center">
				</div>
			</div>
		</div>
		
	</div>
-->

<div class="app-main flex-column flex-row-fluid mb-10" id="kt_app_main">
	<div class="d-flex flex-column flex-column-fluid">
		<div id="kt_app_content" class="app-content  flex-column-fluid ">
			<div id="kt_app_content_container" class="app-container  container-fluid ">

				<!-- 이 안부터 row넣기 시작 -->

				<!--프로젝트 시작-->
				<div class="row gx-5 gx-xl-10 mb-xl-10">
					<div class="col-xl-6">
						<div class="card card-flush h-md-100">
							<div class="card-header pt-7">
								<h3 class="card-title align-items-start flex-column">
									<span class="card-label fw-bold text-gray-800">
										<font style="vertical-align: inherit;">
											<font style="vertical-align: inherit;">프로젝트</font>
										</font>
									</span> 
								</h3>
							</div>
							<div class="card-body pt-6">
								<div class="table-responsive">
									<table
										class="table table-row-dashed align-middle gs-0 gy-3 my-0">
										<thead>
											<tr class="fs-7 fw-bold text-gray-500 border-bottom-0">
												<th class="p-0 pb-3 min-w-150px text-center" style="width: 150px;">
													<font style="vertical-align: inherit;">
														<font style="vertical-align: inherit;">제목</font>
													</font>
												</th>
												<th class="p-0 pb-3 min-w-90px text-center">
													<font style="vertical-align: inherit;">
														<font style="vertical-align: inherit;">담당</font>
													</font>
												</th>
												<th class="p-0 pb-3 min-w-130px text-center pe-10">
													<font style="vertical-align: inherit;">
														<font style="vertical-align: inherit;">참가자</font>
													</font>
												</th>
												<th class="p-0 pb-3 w-130px text-center">
													<font style="vertical-align: inherit;">
														<font style="vertical-align: inherit;">자세히</font>
													</font>
												</th>
											</tr>
										</thead>
										<tbody>
											<tbody class="fs-6">
												<c:set value="${proCardList }" var="proCardList"/>
												<c:choose>
													<c:when test="${empty proCardList }">
														<tr>
															<td colspan="4" class="text-center">
																<a href="/company/project.do">
											                	    <img src="/resources/file/image/cloudEmpty.png" class="w-50"/>
											                    	<h3 class=" fw-bolder text-dark">프로젝트가 존재하지 않습니다.</h3>
											                    </a>
					              				 			</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach items="${proCardList }" var="projectVO">
															<tr>
																<td>
																	<div class="d-flex align-items-center">
																		<div class="d-flex justify-content-start flex-column">
																			<a href="/company/canbanList.do?proNo=${projectVO.proNo }" class="text-gray-900 text-hover-primary">
																				<font style="vertical-align: inherit;">
																					<font style="vertical-align: inherit;">${projectVO.proNm }</font>
																				</font>
																			</a> 
																			<span class="text-gray-500 fw-semibold d-block fs-7">	
																				<font style="vertical-align: inherit;">
																					<font style="vertical-align: inherit;">${projectVO.proStartDt } - ${projectVO.proEndDt }</font>
																				</font>
																			</span>
																		</div>
																	</div>
																</td>
																<td class="text-center pe-0">
																	<span class="text-gray-600 fw-bold fs-6">
																		<font style="vertical-align: inherit;">
																			<font style="vertical-align: inherit;">${projectVO.empNm }</font>
																		</font>
																	</span>
																</td>
																<td class="text-center pe-12">
																	<div class="d-flex flex-stack flex-wrap mb-2">
																	    <div class="symbol-group symbol-hover my-1">
																	        <c:forEach items="${projectVO.participantImgFileUrlsList}" var="participantImgFileUrl" varStatus="status">
																	        	<c:choose>
																	        		 <c:when test="${status.index lt projectVO.participantEmpNamesList.size()}">
																	        			<div class="symbol symbol-30px symbol-circle" data-bs-toggle="tooltip"  title="${projectVO.participantEmpNamesList[status.index] }" style="overflow: hidden;">
																	        				<img alt="${projectVO.participantEmpNamesList[status.index] }" src="/upload/${participantImgFileUrl.trim() }" style="object-fit: cover;">
																	        			</div>
																	        		</c:when>
																	        	</c:choose>
																	        </c:forEach>
																	    </div>
																	</div>
																</td>
																<td>
																	<a href="#" class="btn btn-sm btn-light btn-flex btn-center btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">자세히보기
																	<i class="ki-duotone ki-down fs-5 ms-1"></i></a>
																	<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4" data-kt-menu="true">
																		<div class="menu-item px-3">
																			<a href="/company/canbanList.do?proNo=${projectVO.proNo }" class="menu-link px-3">칸반보드</a>
																		</div>
																		<div class="menu-item px-3">
																			<a href="/company/ganttList.do?proNo=${projectVO.proNo }" class="menu-link px-3">간트차트</a>
																		</div>
																	</div>
																</td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
	
					<!--캘린더 시작-->
					<div class="col-lg-12 col-xl-12 col-xxl-6 mb-5 mb-xl-0">
						<div class="card card-flush overflow-hidden h-md-100">
	
							<div
								class="card-body d-flex justify-content-between flex-column pb-1 px-5"
								style="height: 600px;">
								<!-- 캘린더 시작 -->
								<div id="kt_calendar_app"></div>
								<!-- 캘린더 종료 -->
							</div>
						</div>
	
						<!--전체 모달 시작-->
						<!--일정 추가 모달 시작-->
						<div class="modal fade" id="kt_modal_add_event" tabindex-="1"
							aria-hidden="true" data-bs-focus="false">
							<!--begin::Modal dialog-->
							<div class="modal-dialog modal-dialog-centered mw-650px">
								<!--begin::Modal content-->
								<div class="modal-content">
									<!--begin::Form-->
									<form class="form" action="/employee/calInsert.do" method="post"
										id="kt_modal_add_event_form">
										<!--begin::Modal header-->
										<div class="modal-header">
											<!--begin::Modal title-->
											<h2 class="fw-bold" data-kt-calendar="title">일정 추가</h2>
											<!--end::Modal title-->
											<!--begin::Close-->
											<div class="btn btn-icon btn-sm btn-active-icon-primary"
												id="kt_modal_add_event_close">
												<i class="ki-duotone ki-cross fs-1" data-bs-dismiss="modal"> <span class="path1"></span>
													<span class="path2"></span>
												</i>
											</div>
											<!--end::Close-->
										</div>
										<!--end::Modal header-->
										<!--begin::Modal body-->
										<div class="modal-body py-10 px-lg-17">
											<!--begin::Input group-->
											<div class="fv-row mb-9">
												<!--begin::Label-->
												<label class="fs-6 fw-semibold required mb-2">일정명</label>
												<!--end::Label-->
												<!--begin::Input-->
												<input type="text" class="form-control form-control-solid"
													placeholder="일정명을 입력해주세요." name="calendarNm" id="calendarNm"
													value="${calendarVO.calendarNm }" />
												<!--end::Input-->
											</div>
											<!--end::Input group-->
											<!--begin::Input group-->
											<div class="fv-row mb-9">
												<!--begin::Label-->
												<label class="fs-6 fw-semibold mb-2">일정 설명</label>
												<!--end::Label-->
												<!--begin::Input-->
												<input type="text" class="form-control form-control-solid"
													placeholder="일정 설명을 입력해주세요." name="calendarCn"
													id="calendarCn" value="${calendarVO.calendarCn }" />
												<!--end::Input-->
											</div>
											<!--end::Input group-->
											<!--begin::Input group-->
											<div class="fv-row mb-9">
												<!--begin::Label-->
												<label class="fs-6 fw-semibold mb-2">일정 장소</label>
												<!--end::Label-->
												<!--begin::Input-->
												<input type="text" class="form-control form-control-solid"
													placeholder="일정 장소를 입력해주세요." name="calendarDaddr"
													id="calendarDaddr" value="${calendarVO.calendarDaddr }" />
												<!--end::Input-->
											</div>
											<!--end::Input group-->
											<!--begin::Input group-->
											<div class="fv-row mb-9">
												<!--begin::Checkbox-->
												<label class="form-check form-check-custom form-check-solid">
													<input class="form-check-input" type="checkbox" value=""
													id="kt_calendar_datepicker_allday" /> <span
													class="form-check-label fw-semibold"
													for="kt_calendar_datepicker_allday">종일</span>
												</label>
												<!--end::Checkbox-->
											</div>
											<!--end::Input group-->
											<!--begin::Input group-->
											<div class="row row-cols-lg-2 g-10">
												<div class="col">
													<div class="fv-row mb-9">
														<!--begin::Label-->
														<label class="fs-6 fw-semibold mb-2 required">시작일</label>
														<!--end::Label-->
														<!--begin::Input-->
														<input class="form-control form-control-solid"
															name="calendarDt" placeholder="일정 시작일을 입력해주세요."
															id="kt_calendar_datepicker_start_date"
															value="${calendarVO.calendarDt }" />
														<%-- <input class="form-control form-control-solid" name="calendar_event_start_date" placeholder="Pick a start date" id="calendar_dt" value="${calendarVO.calendarDt }" /> --%>
														<!--end::Input-->
													</div>
												</div>
												<div class="col" data-kt-calendar="datepicker">
													<div class="fv-row mb-9">
														<!--begin::Label-->
														<label class="fs-6 fw-semibold mb-2">시작 시간</label>
														<!--end::Label-->
														<!--begin::Input-->
														<input class="form-control form-control-solid"
															name="calendarStartTime" placeholder="일정 시작 시간을 입력해주세요."
															id="kt_calendar_datepicker_start_time"
															value="${calendarVO.calendarStartTime }" />
														<!--end::Input-->
													</div>
												</div>
											</div>
											<!--end::Input group-->
											<!--begin::Input group-->
											<div class="row row-cols-lg-2 g-10">
												<div class="col">
													<div class="fv-row mb-9">
														<!--begin::Label-->
														<label class="fs-6 fw-semibold mb-2 required">종료일</label>
														<!--end::Label-->
														<!--begin::Input-->
														<input class="form-control form-control-solid"
															name="calendarEndDt" placeholder="일정 종료일을 입력해주세요."
															id="kt_calendar_datepicker_end_date"
															value="${calendarVO.calendarEndDt }" />
														<!-- <input class="form-control form-control-solid" name="calendar_event_end_date" placeholder="Pick a end date" id="kt_calendar_datepicker_end_date" /> -->
														<%-- <input class="form-control form-control-solid" name="calendar_event_end_date" placeholder="Pick a end date" id="calendar_end_dt" value="${calendarVO.calendarEndDt }" /> --%>
														<!--end::Input-->
													</div>
												</div>
												<div class="col" data-kt-calendar="datepicker">
													<div class="fv-row mb-9">
														<!--begin::Label-->
														<label class="fs-6 fw-semibold mb-2">종료 시간</label>
														<!--end::Label-->
														<!--begin::Input-->
														<input class="form-control form-control-solid"
															name="calendarEndTime" placeholder="일정 종료 시간을 입력해주세요."
															id="kt_calendar_datepicker_end_time"
															value="${calendarVO.calendarEndTime }" />
														<!--end::Input-->
													</div>
												</div>
											</div>
											<!--end::Input group-->
										</div>
										<!--end::Modal body-->
										<!--begin::Modal footer-->
										<div class="modal-footer flex-center">
											<!--begin::Button-->
											<button type="submit" id="kt_modal_add_event_submit"
												class="btn btn-primary">
												<span class="indicator-label">저장</span> <span
													class="indicator-progress">저장 중 <span
													class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
											</button>
											<button type="reset" id="kt_modal_add_event_cancel"
												class="btn btn-light me-3">취소</button>
											<!--end::Button-->
											<!--begin::Button-->
											<!--end::Button-->
										</div>
										<!--end::Modal footer-->
									</form>
									<!--end::Form-->
								</div>
							</div>
						</div>
						<!-- 일정 추가 모달 종료-->
						<!-- 일정 상세보기 모달 시작 -->
						<div class="modal fade" id="kt_modal_view_event" tabindex="-1"
							data-bs-focus="false" aria-hidden="true">
							<!--begin::Modal dialog-->
							<div class="modal-dialog modal-dialog-centered mw-650px">
								<!--begin::Modal content-->
								<div class="modal-content">
									<!--begin::Modal header-->
									<div class="modal-header border-0 justify-content-end">
										<!--begin::Edit-->
										<div
											class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-primary me-2"
											data-bs-toggle="tooltip" data-bs-dismiss="click" title="일정 수정"
											id="kt_modal_view_event_edit">
											<i class="ki-duotone ki-pencil fs-2"> <span class="path1"></span>
												<span class="path2"></span>
											</i>
										</div>
										<!--end::Edit-->
										<!--begin::Edit-->
										<div
											class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-danger me-2"
											data-bs-toggle="tooltip" data-bs-dismiss="click" title="일정 삭제"
											id="kt_modal_view_event_delete">
											<i class="ki-duotone ki-trash fs-2"> <span class="path1"></span>
												<span class="path2"></span> <span class="path3"></span> <span
												class="path4"></span> <span class="path5"></span>
											</i>
										</div>
										<!--end::Edit-->
										<!--begin::Close-->
										<div
											class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-primary"
											data-bs-toggle="tooltip" title="취소" data-bs-dismiss="modal">
											<i class="ki-duotone ki-cross fs-2x"> <span class="path1"></span>
												<span class="path2"></span>
											</i>
										</div>
										<!--end::Close-->
									</div>
									<!--end::Modal header-->
									<!--begin::Modal body-->
									<div class="modal-body pt-0 pb-20 px-lg-17">
										<!--begin::Row-->
										<div class="d-flex">
											<!--begin::Icon-->
											<i class="ki-duotone ki-calendar-8 fs-1 text-muted me-5">
												<span class="path1"></span> <span class="path2"></span> <span
												class="path3"></span> <span class="path4"></span> <span
												class="path5"></span> <span class="path6"></span>
											</i>
											<!--end::Icon-->
											<div class="mb-9">
												<!--begin::Event name-->
												<div class="d-flex align-items-center mb-2">
													<span class="fs-3 fw-bold me-3"
														data-kt-calendar="event_name"></span> <span
														class="badge badge-light-success"
														data-kt-calendar="all_day"></span>
												</div>
												<!--end::Event name-->
												<!--begin::Event description-->
												<div class="fs-6" data-kt-calendar="event_description"></div>
												<!--end::Event description-->
											</div>
										</div>
										<!--end::Row-->
										<!--begin::Row-->
										<div class="d-flex align-items-center mb-2">
											<!--begin::Bullet-->
											<span
												class="bullet bullet-dot h-10px w-10px bg-success ms-2 me-7"></span>
											<!--end::Bullet-->
											<!--begin::Event start date/time-->
											<div class="fs-6">
												<span class="fw-bold">시작</span> <span
													data-kt-calendar="event_start_date"></span>
											</div>
											<!--end::Event start date/time-->
										</div>
										<!--end::Row-->
										<!--begin::Row-->
										<div class="d-flex align-items-center mb-9">
											<!--begin::Bullet-->
											<span
												class="bullet bullet-dot h-10px w-10px bg-danger ms-2 me-7"></span>
											<!--end::Bullet-->
											<!--begin::Event end date/time-->
											<div class="fs-6">
												<span class="fw-bold">종료</span> <span
													data-kt-calendar="event_end_date"></span>
											</div>
											<!--end::Event end date/time-->
										</div>
										<!--end::Row-->
										<!--begin::Row-->
										<div class="d-flex align-items-center">
											<!--begin::Icon-->
											<i class="ki-duotone ki-geolocation fs-1 text-muted me-5">
												<span class="path1"></span> <span class="path2"></span>
											</i>
											<!--end::Icon-->
											<!--begin::Event location-->
											<div class="fs-6" data-kt-calendar="event_location"></div>
											<!--end::Event location-->
										</div>
										<!--end::Row-->
									</div>
									<!--end::Modal body-->
								</div>
							</div>
						</div>
						<!-- 일정 상세보기 모달 종료 -->
						<!--전체 모달 종료-->
	
	
					</div>
					<!--캘린더 종료-->
				</div>


				<div class="row g-5 g-xxl-10">

					<div class="col-md-5 col-lg-5 col-xl-5 col-xxl-3 mb-10">
						
						<!-- 증명서 위젯 시작 -->
						<div class="card card-flush h-lg-100 mb-5 mb-xl-10">
						
							<div class="card-header pt-9 ps-12">
								<div class="card-title d-flex flex-column">
									<div class="d-flex align-items-center ms-2">
										<span class="fs-4 fw-semibold text-gray-500 me-5 align-self-start">
											<i class="ki-duotone ki-tablet-text-up fs-2tx mt-1">
											 <span class="path1"></span>  
											 <span class="path2"></span>
											</i>
										</span>
										<span class="fs-2x fw-bold text-gray-900 me-2 lh-1 ls-n2">
											<a href="/company/provedocAplyList.do">증명서 요청관리</a>
										</span>
									</div> 
								</div>  
							</div> 

							<div class="card-body pt-2 pb-0">
								
								<div class="fs-3 fw-semibold ms-5">
									<div class="d-flex justify-content-center py-3">
										<div class="bullet w-15px h-8px rounded-2 bg-danger me-3 mt-3"></div>
										<div class="text-gray-700 ms-2 me-10 fs-2">미처리 발급요청</div>
									</div>
									<div class="fw-bolder text-gray-700 fs-1 me-4 d-flex justify-content-center"> 
										<span class="fs-5hx">
											<a href="/company/provedocAplyList.do">
												${provedocCount.prdocAprvN }
											</a>	
										</span>
										<span class="text-gray-800 ms-3 mt-13">건</span>
										<span class="numShadow"></span>
									</div>
								</div>
								
							</div>
						
						</div>
						<!-- 증명서 위젯 끝 -->
						 
					</div>
	

					<div class="col-xl-9 mb-5 mb-xxl-10">

						<div class="card card-flush h-xl-80">
							<div class="card-body pt-3">
								<div class="d-flex flex-column gap-10">
									<div class="table-responsive">
										<table class="table align-middle table-row-dashed fs-6 gy-5">
											<thead>
												<tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-3">
													<td><h4 class="text-gray-700">추가된 인사정보</h4></td>
												</tr>
											</thead>
											<tbody class="text-gray-600 fw-semibold">
											<c:choose>
												<c:when test="${empty empAllList }">
													<tr>
														<td colspan="7" class="text-center pt-5">
															사원이 존재하지 않습니다.
														</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${empAllList }" var="empList" begin="0" step="1" end="2">
														<tr>
															<td class="d-flex align-items-center py-1">
																<div class="symbol symbol-circle symbol-50px overflow-hidden me-3">
																	<a href="apps/user-management/users/view.html">
																		<span class="symbol-label">
																			<img src="/upload/${empList.imgFileUrl }" alt="" class="w-100" />
																		</span>
																	</a>
																</div>
																<div class="d-flex flex-column">
																    <div class="text-gray-800 text-hover-primary mb-1" onclick="this.closest('form').submit();" style="cursor: pointer;">
																    	<a href="/information/empdetail.do?empId=${empList.empId }">
																        ${empList.empNm}
																        </a>
																    </div>
																</div>
															</td>
															<td>${empList.empNo }</td>
															<td>
																<div class="badge badge-light-success fw-bold">${empList.deptCd }</div>
															</td>
															<td>
																<div class="badge badge-light-primary fw-bold">${empList.jbgdCd }</div>
															</td>
															<td>${empList.empTelno }</td>
														</tr>
													</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

					</div>
					
				</div>
	
	
				<div class="row gx-5 gx-xl-10 mb-xl-10">
	
					<!-- 긴급 문서함 -->
					<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-3 mb-10">
						<div class="card card-flush px-5 py-3 h-md-50 mb-5 mb-xl-10">
							<div id="kt_security_recent_alerts" class="carousel carousel-custom carousel-stretch slide" data-bs-ride="carousel" data-bs-interval="4000">
				                <div class="d-flex flex-stack align-items-center flex-wrap">
				                    <h4 class="text-gray-500 fw-semibold mb-0 pe-2"><span class="badge badge-light-danger mb-2">긴급 문서함</span></h4>
				                    <ol class="p-0 m-0 carousel-indicators carousel-indicators-dots">
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="0" class="ms-1 active"></li>
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="1" class="ms-1"></li>
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="2" class="ms-1"></li>
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="3" class="ms-1"></li>
				                    </ol>
				                </div>
				                <div class="carousel-inner">
				                	<c:set value="${emrgList }" var="elaprEmrgList"/>
									<c:choose>
										<c:when test="${empty elaprEmrgList }">
											<tr>
												<div class="d-flex flex-column flex-center ">
													<a href="/company/comElaprEmrg.do">
								                	    <img src="/resources/file/image/cloudEmpty.png" class="mw-150px"/>
								                    	<div class=" fw-bolder text-dark">긴급 문서가 존재하지 않습니다.</div>
								                    </a>
		              				 			</div>
											</tr>
										</c:when>
										<c:otherwise>
						                    <c:forEach items="${emrgList }" var="elaprVO" varStatus="status">
							                    <div class="carousel-item ${status.first ? 'active' : ''  }">
							                        <div class="carousel-wrapper">
							                            <div class="d-flex flex-column flex-grow-1">
							                                <a href="/company/elaprDetail.do?elaprNo=${elaprVO.elaprNo }" class="fs-5 fw-bold text-gray-900 text-hover-primary">${elaprVO.elaprNm }</a>
							                                <p class="text-gray-600 fs-6 fw-semibold pt-3 mb-0">기안자 | ${elaprVO.empNm }</p>
							                            </div>
							                            <div class="d-flex flex-stack pt-8">
							                                <div class="text-gray-700 fw-semibold fs-6 me-2">기안일 | ${elaprVO.elaprBgngDt }</div>
							                                <a href="/company/elaprDetail.do?elaprNo=${elaprVO.elaprNo }"  class="btn btn-sm btn-light">자세히 보기</a>
							                            </div>
							                        </div>
							                    </div>
						                    </c:forEach>
					                    </c:otherwise>
				                    </c:choose>
				                </div>
				            </div>
						</div>
						
						<!-- 참조 문서함 -->
						<div class="card card-flush px-5 py-3 h-md-50 mb-5 mb-xl-10">
							<div id="kt_security_recent_alerts" class="carousel carousel-custom carousel-stretch slide" data-bs-ride="carousel" data-bs-interval="4000">
				                <div class="d-flex flex-stack align-items-center flex-wrap">
				                    <h4 class="text-gray-500 fw-semibold mb-0 pe-2"><span class="badge badge-light-info mb-2">참조 문서함</span></h4>
				                    <ol class="p-0 m-0 carousel-indicators carousel-indicators-dots">
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="0" class="ms-1 active"></li>
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="1" class="ms-1"></li>
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="2" class="ms-1"></li>
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="3" class="ms-1"></li>
				                    </ol>
				                </div>
				                <div class="carousel-inner">
				                	<c:set value="${rerncList }" var="elaprRerncList"/>
									<c:choose>
										<c:when test="${empty elaprRerncList }">
											<tr>
												<div class="d-flex flex-column flex-center ">
													<a href="/company/comElaprRernc.do">
								                	    <img src="/resources/file/image/cloudEmpty.png" class="mw-150px"/>
								                    	<div class=" fw-bolder text-dark">참조 문서가 존재하지 않습니다.</div>
								                    </a>
		              				 			</div>
											</tr>
										</c:when>
										<c:otherwise>
						                    <c:forEach items="${rerncList }" var="elaprVO" varStatus="status">
							                    <div class="carousel-item ${status.first ? 'active' : ''  }">
							                        <div class="carousel-wrapper">
							                            <div class="d-flex flex-column flex-grow-1">
							                                <a href="/company/elaprDetail.do?elaprNo=${elaprVO.elaprNo }" class="fs-5 fw-bold text-gray-900 text-hover-primary">${elaprVO.elaprNm }</a>
							                                <p class="text-gray-600 fs-6 fw-semibold pt-3 mb-0">기안자 | ${elaprVO.empNm }</p>
							                            </div>
							                            <div class="d-flex flex-stack pt-8">
							                                <div class="text-gray-700 fw-semibold fs-6 me-2">기안일 | ${elaprVO.elaprBgngDt }</div>
							                                <a href="/company/elaprDetail.do?elaprNo=${elaprVO.elaprNo }"  class="btn btn-sm btn-light">자세히 보기</a>
							                            </div>
							                        </div>
							                    </div>
						                    </c:forEach>
					                    </c:otherwise>
				                    </c:choose>
				                </div>
				            </div>
						</div>
						<!-- 참조 문서함 -->
					</div>
	
	
					<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-3 mb-10">
						<!-- 전체 문서함 -->
						<div class="card card-flush px-5 py-3 h-md-50 mb-5 mb-xl-10">
							<div id="kt_security_recent_alerts" class="carousel carousel-custom carousel-stretch slide" data-bs-ride="carousel" data-bs-interval="4000">
				                <div class="d-flex flex-stack align-items-center flex-wrap">
				                    <h4 class="text-gray-500 fw-semibold mb-0 pe-2"><span class="badge badge-light-warning mb-2">전체 문서함</span></h4>
				                    <ol class="p-0 m-0 carousel-indicators carousel-indicators-dots">
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="0" class="ms-1 active"></li>
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="1" class="ms-1"></li>
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="2" class="ms-1"></li>
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="3" class="ms-1"></li>
				                    </ol>
				                </div>
				                <div class="carousel-inner">
				                	<c:set value="${allList }" var="elaprAllList"/>
									<c:choose>
										<c:when test="${empty elaprAllList }">
											<tr>
												<div class="d-flex flex-column flex-center ">
													<a href="/company/comElaprAll.do">
								                	    <img src="/resources/file/image/cloudEmpty.png" class="mw-150px"/>
								                    	<div class=" fw-bolder text-dark">문서가 존재하지 않습니다.</div>
								                    </a>
		              				 			</div>
											</tr>
										</c:when>
										<c:otherwise>
						                    <c:forEach items="${allList }" var="elaprVO" varStatus="status">
							                    <div class="carousel-item ${status.first ? 'active' : ''  }">
							                        <div class="carousel-wrapper">
														<c:if test="${elaprVO.elaprSttsCd eq 'APRZ001' }">
								                        	<h4 class="text-gray-500 fw-semibold mb-0 pe-2">
																<span class="badge badge-light-warning">진행</span>
															</h4>
														</c:if>
														<c:if test="${elaprVO.elaprSttsCd eq 'APRZ002' }">
								                        	<h4 class="text-gray-500 fw-semibold mb-0 pe-2">
																<span class="badge badge-light-info">완료</span>
															</h4>
														</c:if>
														<c:if test="${elaprVO.elaprSttsCd eq 'APRZ003' }">
								                        	<h4 class="text-gray-500 fw-semibold mb-0 pe-2">
																<span class="badge badge-light-danger">반려</span>
															</h4>
														</c:if>
							                            <div class="d-flex flex-column flex-grow-1">
							                                <a href="/company/elaprDetail.do?elaprNo=${elaprVO.elaprNo }" class="fs-5 fw-bold text-gray-900 text-hover-primary">${elaprVO.elaprNm }</a>
							                                <p class="text-gray-600 fs-6 fw-semibold pt-3 mb-0">기안자 | ${elaprVO.empNm }</p>
							                            </div>
							                            <div class="d-flex flex-stack pt-8">
							                                <div class="text-gray-700 fw-semibold fs-6 me-2">기안일 | ${elaprVO.elaprBgngDt }</div>
							                                <a href="/company/elaprDetail.do?elaprNo=${elaprVO.elaprNo }"  class="btn btn-sm btn-light">자세히 보기</a>
							                            </div>
							                        </div>
							                    </div>
						                    </c:forEach>
				                   	 	</c:otherwise>
				                    </c:choose>
				                </div>
				            </div>
						</div>
						<!-- 전체 문서함 -->
						
						<!-- 열람 문서함 -->
						<div class="card card-flush px-5 py-3 h-md-50 mb-5 mb-xl-10">
							<div id="kt_security_recent_alerts" class="carousel carousel-custom carousel-stretch slide" data-bs-ride="carousel" data-bs-interval="4000">
				                <div class="d-flex flex-stack align-items-center flex-wrap">
				                    <h4 class="text-gray-500 fw-semibold mb-0 pe-2"><span class="badge badge-light-success mb-2">열람 문서함</span></h4>
				                    <ol class="p-0 m-0 carousel-indicators carousel-indicators-dots">
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="0" class="ms-1 active"></li>
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="1" class="ms-1"></li>
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="2" class="ms-1"></li>
				                        <li data-bs-target="#kt_security_recent_alerts" data-bs-slide-to="3" class="ms-1"></li>
				                    </ol>
				                </div>
				                <div class="carousel-inner">
				                	<c:set value="${prslList }" var="elaprPrslList"/>
									<c:choose>
										<c:when test="${empty elaprPrslList }">
											<tr>
												<div class="d-flex flex-column flex-center ">
													<a href="/company/comElaprPrsl.do">
								                	    <img src="/resources/file/image/cloudEmpty.png" class="mw-150px"/>
								                    	<div class=" fw-bolder text-dark">열람 문서가 존재하지 않습니다.</div>
								                    </a>
		              				 			</div>
											</tr>
										</c:when>
										<c:otherwise>
						                    <c:forEach items="${prslList }" var="elaprVO" varStatus="status">
							                    <div class="carousel-item ${status.first ? 'active' : ''  }">
							                        <div class="carousel-wrapper">
							                            <div class="d-flex flex-column flex-grow-1">
							                                <a href="/company/elaprDetail.do?elaprNo=${elaprVO.elaprNo }" class="fs-5 fw-bold text-gray-900 text-hover-primary">${elaprVO.elaprNm }</a>
							                                <p class="text-gray-600 fs-6 fw-semibold pt-3 mb-0">기안자 | ${elaprVO.empNm }</p>
							                            </div>
							                            <div class="d-flex flex-stack pt-8">
							                                <div class="text-gray-700 fw-semibold fs-6 me-2">기안일 | ${elaprVO.elaprBgngDt }</div>
							                                <a href="/company/elaprDetail.do?elaprNo=${elaprVO.elaprNo }"  class="btn btn-sm btn-light">자세히 보기</a>
							                            </div>
							                        </div>
							                    </div>
						                    </c:forEach>
				                    	</c:otherwise>
				                    </c:choose>
				                </div>
				            </div>
						</div>
						<!-- 열람 문서함 -->
					</div>
					<!--end::Col-->
	
					<!--begin::Col-->
					<div class="col-lg-12 col-xl-12 col-xxl-6 mb-5 mb-xl-0">
						<!--begin::Chart widget 3-->
						<div class="card card-flush overflow-hidden h-md-100">
							<!--begin::Header-->
							<div class="card-header py-5">
								<!--begin::Title-->
								<h3 class="card-title align-items-start flex-column">
									<span class="card-label fw-bold text-gray-900">Sales This
										Months</span> <span class="text-gray-500 mt-1 fw-semibold fs-6">Users
										from all channels</span>
								</h3>
								<!--end::Title-->
	
								<!--begin::Toolbar-->
								<div class="card-toolbar">
									<!--begin::Menu-->
									<button
										class="btn btn-icon btn-color-gray-500 btn-active-color-primary justify-content-end"
										data-kt-menu-trigger="click"
										data-kt-menu-placement="bottom-end"
										data-kt-menu-overflow="true">
	
										<i class="ki-duotone ki-dots-square fs-1"><span
											class="path1"></span><span class="path2"></span><span
											class="path3"></span><span class="path4"></span></i>
									</button>
	
	
									<!--begin::Menu 2-->
									<div
										class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-semibold w-200px"
										data-kt-menu="true">
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<div class="menu-content fs-6 text-gray-900 fw-bold px-3 py-4">Quick
												Actions</div>
										</div>
										<!--end::Menu item-->
	
										<!--begin::Menu separator-->
										<div class="separator mb-3 opacity-75"></div>
										<!--end::Menu separator-->
	
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3"> New Ticket </a>
										</div>
										<!--end::Menu item-->
	
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3"> New Customer </a>
										</div>
										<!--end::Menu item-->
	
										<!--begin::Menu item-->
										<div class="menu-item px-3" data-kt-menu-trigger="hover"
											data-kt-menu-placement="right-start">
											<!--begin::Menu item-->
											<a href="#" class="menu-link px-3"> <span
												class="menu-title">New Group</span> <span class="menu-arrow"></span>
											</a>
											<!--end::Menu item-->
	
											<!--begin::Menu sub-->
											<div class="menu-sub menu-sub-dropdown w-175px py-4">
												<!--begin::Menu item-->
												<div class="menu-item px-3">
													<a href="#" class="menu-link px-3"> Admin Group </a>
												</div>
												<!--end::Menu item-->
	
												<!--begin::Menu item-->
												<div class="menu-item px-3">
													<a href="#" class="menu-link px-3"> Staff Group </a>
												</div>
												<!--end::Menu item-->
	
												<!--begin::Menu item-->
												<div class="menu-item px-3">
													<a href="#" class="menu-link px-3"> Member Group </a>
												</div>
												<!--end::Menu item-->
											</div>
											<!--end::Menu sub-->
										</div>
										<!--end::Menu item-->
	
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3"> New Contact </a>
										</div>
										<!--end::Menu item-->
	
										<!--begin::Menu separator-->
										<div class="separator mt-3 opacity-75"></div>
										<!--end::Menu separator-->
	
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<div class="menu-content px-3 py-3">
												<a class="btn btn-primary  btn-sm px-4" href="#">
													Generate Reports </a>
											</div>
										</div>
										<!--end::Menu item-->
									</div>
									<!--end::Menu 2-->
	
									<!--end::Menu-->
								</div>
								<!--end::Toolbar-->
							</div>
							<!--end::Header-->
	
							<!--begin::Card body-->
							<div
								class="card-body d-flex justify-content-between flex-column pb-1 px-0">
								<!--begin::Statistics-->
								<div class="px-9 mb-5">
									<!--begin::Statistics-->
									<div class="d-flex mb-2">
										<span class="fs-4 fw-semibold text-gray-500 me-1">$</span> <span
											class="fs-2hx fw-bold text-gray-800 me-2 lh-1 ls-n2">14,094</span>
									</div>
									<!--end::Statistics-->
	
									<!--begin::Description-->
									<span class="fs-6 fw-semibold text-gray-500">Another
										$48,346 to Goal</span>
									<!--end::Description-->
								</div>
								<!--end::Statistics-->
	
								<!--begin::Chart-->
								<div id="kt_charts_widget_3" class="min-h-auto ps-4 pe-6"
									style="height: 300px; min-height: 315px;">
									<div id="apexchartsbqjezb"
										class="apexcharts-canvas apexchartsbqjezb apexcharts-theme-"
										style="width: 721.5px; height: 300px;">
										<svg id="SvgjsSvg1006" width="721.5" height="300"
											xmlns="http://www.w3.org/2000/svg" version="1.1"
											xmlns:xlink="http://www.w3.org/1999/xlink"
											xmlns:svgjs="http://svgjs.dev"
											class="apexcharts-svg apexcharts-zoomable"
											xmlns:data="ApexChartsNS" transform="translate(0, 0)">
												<foreignObject x="0" y="0" width="721.5" height="300">
												<div class="apexcharts-legend"
												xmlns="http://www.w3.org/1999/xhtml"
												style="max-height: 150px;"></div></foreignObject>
												<g id="SvgjsG1014" class="apexcharts-datalabels-group"
												transform="translate(0, 0) scale(1)"></g>
												<g id="SvgjsG1015" class="apexcharts-datalabels-group"
												transform="translate(0, 0) scale(1)"></g>
												<rect id="SvgjsRect1037" width="0" height="0" x="0" y="0"
												rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fefefe"></rect>
												<g id="SvgjsG1100" class="apexcharts-yaxis" rel="0"
												transform="translate(37.76041793823242, 0)">
												<g id="SvgjsG1101" class="apexcharts-yaxis-texts-g">
												<text id="SvgjsText1103" font-family="inherit" x="20" y="34"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
												<tspan id="SvgjsTspan1104">$24K</tspan>
												<title>$24K</title></text>
												<text id="SvgjsText1106" font-family="inherit" x="20"
												y="89.72466666666666" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
												<tspan id="SvgjsTspan1107">$20.5K</tspan>
												<title>$20.5K</title></text>
												<text id="SvgjsText1109" font-family="inherit" x="20"
												y="145.44933333333333" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
												<tspan id="SvgjsTspan1110">$17K</tspan>
												<title>$17K</title></text>
												<text id="SvgjsText1112" font-family="inherit" x="20"
												y="201.17399999999998" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
												<tspan id="SvgjsTspan1113">$13.5K</tspan>
												<title>$13.5K</title></text>
												<text id="SvgjsText1115" font-family="inherit" x="20"
												y="256.89866666666666" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
												<tspan id="SvgjsTspan1116">$10K</tspan>
												<title>$10K</title></text></g></g>
												<g id="SvgjsG1008"
												class="apexcharts-inner apexcharts-graphical"
												transform="translate(67.76041793823242, 30)">
												<defs id="SvgjsDefs1007">
												<clipPath id="gridRectMaskbqjezb">
												<rect id="SvgjsRect1012" width="650.7395820617676"
												height="229.89866666666666" x="-3.5" y="-3.5" rx="0" ry="0"
												opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fff"></rect></clipPath>
												<clipPath id="forecastMaskbqjezb"></clipPath>
												<clipPath id="nonForecastMaskbqjezb"></clipPath>
												<clipPath id="gridRectMarkerMaskbqjezb">
												<rect id="SvgjsRect1013" width="647.7395820617676"
												height="226.89866666666666" x="-2" y="-2" rx="0" ry="0"
												opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fff"></rect></clipPath>
												<linearGradient id="SvgjsLinearGradient1020" x1="0" y1="0"
												x2="0" y2="1">
												<stop id="SvgjsStop1021" stop-opacity="0.4"
												stop-color="rgba(184,217,53,0.4)" offset="0"></stop>
												<stop id="SvgjsStop1022" stop-opacity="0"
												stop-color="rgba(255,255,255,0)" offset="0.8"></stop>
												<stop id="SvgjsStop1023" stop-opacity="0"
												stop-color="rgba(255,255,255,0)" offset="1"></stop></linearGradient></defs>
												<g id="SvgjsG1026" class="apexcharts-grid">
												<g id="SvgjsG1027" class="apexcharts-gridlines-horizontal">
												<line id="SvgjsLine1031" x1="0" y1="55.724666666666664"
												x2="643.7395820617676" y2="55.724666666666664"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
												<line id="SvgjsLine1032" x1="0" y1="111.44933333333333"
												x2="643.7395820617676" y2="111.44933333333333"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
												<line id="SvgjsLine1033" x1="0" y1="167.17399999999998"
												x2="643.7395820617676" y2="167.17399999999998"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line></g>
												<g id="SvgjsG1028" class="apexcharts-gridlines-vertical"></g>
												<line id="SvgjsLine1036" x1="0" y1="222.89866666666666"
												x2="643.7395820617676" y2="222.89866666666666"
												stroke="transparent" stroke-dasharray="0"
												stroke-linecap="butt"></line>
												<line id="SvgjsLine1035" x1="0" y1="1" x2="0"
												y2="222.89866666666666" stroke="transparent"
												stroke-dasharray="0" stroke-linecap="butt"></line></g>
												<g id="SvgjsG1029" class="apexcharts-grid-borders">
												<line id="SvgjsLine1030" x1="0" y1="0" x2="643.7395820617676"
												y2="0" stroke="#eaeaea" stroke-dasharray="4"
												stroke-linecap="butt" class="apexcharts-gridline"></line>
												<line id="SvgjsLine1034" x1="0" y1="222.89866666666666"
												x2="643.7395820617676" y2="222.89866666666666"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line></g>
												<g id="SvgjsG1016"
												class="apexcharts-area-series apexcharts-plot-series">
												<g id="SvgjsG1017" class="apexcharts-series" zIndex="0"
												seriesName="Sales" data:longestSeries="true" rel="1"
												data:realIndex="0">
												<path id="SvgjsPath1024"
												d="M0 95.52799999999996C12.517158540089927 95.52799999999996 23.24615157445272 95.52799999999996 35.76331011454265 95.52799999999996C48.28046865463257 95.52799999999996 59.00946168899537 63.68533333333329 71.5266202290853 63.68533333333329C84.04377876917522 63.68533333333329 94.772771803538 63.68533333333329 107.28993034362793 63.68533333333329C119.80708888371785 63.68533333333329 130.53608191808067 95.52799999999996 143.0532404581706 95.52799999999996C155.57039899826052 95.52799999999996 166.2993920326233 95.52799999999996 178.81655057271323 95.52799999999996C191.33370911280315 95.52799999999996 202.06270214716594 31.842666666666616 214.57986068725586 31.842666666666616C227.09701922734578 31.842666666666616 237.8260122617086 31.842666666666616 250.34317080179852 31.842666666666616C262.8603293418885 31.842666666666616 273.58932237625123 63.68533333333329 286.1064809163412 63.68533333333329C298.6236394564311 63.68533333333329 309.3526324907939 63.68533333333329 321.8697910308838 63.68533333333329C334.38694957097374 63.68533333333329 345.1159426053365 95.52799999999996 357.63310114542645 95.52799999999996C370.1502596855164 95.52799999999996 380.87925271987916 95.52799999999996 393.3964112599691 95.52799999999996C405.913569800059 95.52799999999996 416.6425628344218 63.68533333333329 429.1597213745117 63.68533333333329C441.67687991460167 63.68533333333329 452.40587294896443 63.68533333333329 464.9230314890544 63.68533333333329C477.44019002914433 63.68533333333329 488.1691830635071 95.52799999999996 500.68634160359704 95.52799999999996C513.2035001436869 95.52799999999996 523.9324931780498 95.52799999999996 536.4496517181396 95.52799999999996C548.9668102582295 95.52799999999996 559.6958032925925 63.68533333333329 572.2129618326824 63.68533333333329C584.7301203727723 63.68533333333329 595.4591134071351 63.68533333333329 607.976271947225 63.68533333333329C620.4934304873149 63.68533333333329 631.2224235216777 31.842666666666616 643.7395820617676 31.842666666666616C643.7395820617676 31.842666666666616 643.7395820617676 31.842666666666616 643.7395820617676 222.89866666666666L0 222.89866666666666C0 222.89866666666666 0 95.52799999999996 0 95.52799999999996 "
												fill="url(#SvgjsLinearGradient1020)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="butt" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-area" index="0"
												clip-path="url(#gridRectMaskbqjezb)"
												pathTo="M 0 95.52799999999996C 12.517158540089927 95.52799999999996 23.24615157445272 95.52799999999996 35.76331011454265 95.52799999999996C 48.28046865463257 95.52799999999996 59.00946168899537 63.68533333333329 71.5266202290853 63.68533333333329C 84.04377876917522 63.68533333333329 94.772771803538 63.68533333333329 107.28993034362793 63.68533333333329C 119.80708888371785 63.68533333333329 130.53608191808067 95.52799999999996 143.0532404581706 95.52799999999996C 155.57039899826052 95.52799999999996 166.2993920326233 95.52799999999996 178.81655057271323 95.52799999999996C 191.33370911280315 95.52799999999996 202.06270214716594 31.842666666666616 214.57986068725586 31.842666666666616C 227.09701922734578 31.842666666666616 237.8260122617086 31.842666666666616 250.34317080179852 31.842666666666616C 262.8603293418885 31.842666666666616 273.58932237625123 63.68533333333329 286.1064809163412 63.68533333333329C 298.6236394564311 63.68533333333329 309.3526324907939 63.68533333333329 321.8697910308838 63.68533333333329C 334.38694957097374 63.68533333333329 345.1159426053365 95.52799999999996 357.63310114542645 95.52799999999996C 370.1502596855164 95.52799999999996 380.87925271987916 95.52799999999996 393.3964112599691 95.52799999999996C 405.913569800059 95.52799999999996 416.6425628344218 63.68533333333329 429.1597213745117 63.68533333333329C 441.67687991460167 63.68533333333329 452.40587294896443 63.68533333333329 464.9230314890544 63.68533333333329C 477.44019002914433 63.68533333333329 488.1691830635071 95.52799999999996 500.68634160359704 95.52799999999996C 513.2035001436869 95.52799999999996 523.9324931780498 95.52799999999996 536.4496517181396 95.52799999999996C 548.9668102582295 95.52799999999996 559.6958032925925 63.68533333333329 572.2129618326824 63.68533333333329C 584.7301203727723 63.68533333333329 595.4591134071351 63.68533333333329 607.976271947225 63.68533333333329C 620.4934304873149 63.68533333333329 631.2224235216777 31.842666666666616 643.7395820617676 31.842666666666616C 643.7395820617676 31.842666666666616 643.7395820617676 31.842666666666616 643.7395820617676 222.89866666666666 L 0 222.89866666666666z"
												pathFrom="M 0 382.11199999999997 L 0 382.11199999999997 L 35.76331011454265 382.11199999999997 L 71.5266202290853 382.11199999999997 L 107.28993034362793 382.11199999999997 L 143.0532404581706 382.11199999999997 L 178.81655057271323 382.11199999999997 L 214.57986068725586 382.11199999999997 L 250.34317080179852 382.11199999999997 L 286.1064809163412 382.11199999999997 L 321.8697910308838 382.11199999999997 L 357.63310114542645 382.11199999999997 L 393.3964112599691 382.11199999999997 L 429.1597213745117 382.11199999999997 L 464.9230314890544 382.11199999999997 L 500.68634160359704 382.11199999999997 L 536.4496517181396 382.11199999999997 L 572.2129618326824 382.11199999999997 L 607.976271947225 382.11199999999997 L 643.7395820617676 382.11199999999997z"></path>
												<path id="SvgjsPath1025"
												d="M0 95.52799999999996C12.517158540089927 95.52799999999996 23.24615157445272 95.52799999999996 35.76331011454265 95.52799999999996C48.28046865463257 95.52799999999996 59.00946168899537 63.68533333333329 71.5266202290853 63.68533333333329C84.04377876917522 63.68533333333329 94.772771803538 63.68533333333329 107.28993034362793 63.68533333333329C119.80708888371785 63.68533333333329 130.53608191808067 95.52799999999996 143.0532404581706 95.52799999999996C155.57039899826052 95.52799999999996 166.2993920326233 95.52799999999996 178.81655057271323 95.52799999999996C191.33370911280315 95.52799999999996 202.06270214716594 31.842666666666616 214.57986068725586 31.842666666666616C227.09701922734578 31.842666666666616 237.8260122617086 31.842666666666616 250.34317080179852 31.842666666666616C262.8603293418885 31.842666666666616 273.58932237625123 63.68533333333329 286.1064809163412 63.68533333333329C298.6236394564311 63.68533333333329 309.3526324907939 63.68533333333329 321.8697910308838 63.68533333333329C334.38694957097374 63.68533333333329 345.1159426053365 95.52799999999996 357.63310114542645 95.52799999999996C370.1502596855164 95.52799999999996 380.87925271987916 95.52799999999996 393.3964112599691 95.52799999999996C405.913569800059 95.52799999999996 416.6425628344218 63.68533333333329 429.1597213745117 63.68533333333329C441.67687991460167 63.68533333333329 452.40587294896443 63.68533333333329 464.9230314890544 63.68533333333329C477.44019002914433 63.68533333333329 488.1691830635071 95.52799999999996 500.68634160359704 95.52799999999996C513.2035001436869 95.52799999999996 523.9324931780498 95.52799999999996 536.4496517181396 95.52799999999996C548.9668102582295 95.52799999999996 559.6958032925925 63.68533333333329 572.2129618326824 63.68533333333329C584.7301203727723 63.68533333333329 595.4591134071351 63.68533333333329 607.976271947225 63.68533333333329C620.4934304873149 63.68533333333329 631.2224235216777 31.842666666666616 643.7395820617676 31.842666666666616C643.7395820617676 31.842666666666616 643.7395820617676 31.842666666666616 643.7395820617676 31.842666666666616 "
												fill="none" fill-opacity="1" stroke="#b8d935"
												stroke-opacity="1" stroke-linecap="butt" stroke-width="3"
												stroke-dasharray="0" class="apexcharts-area" index="0"
												clip-path="url(#gridRectMaskbqjezb)"
												pathTo="M 0 95.52799999999996C 12.517158540089927 95.52799999999996 23.24615157445272 95.52799999999996 35.76331011454265 95.52799999999996C 48.28046865463257 95.52799999999996 59.00946168899537 63.68533333333329 71.5266202290853 63.68533333333329C 84.04377876917522 63.68533333333329 94.772771803538 63.68533333333329 107.28993034362793 63.68533333333329C 119.80708888371785 63.68533333333329 130.53608191808067 95.52799999999996 143.0532404581706 95.52799999999996C 155.57039899826052 95.52799999999996 166.2993920326233 95.52799999999996 178.81655057271323 95.52799999999996C 191.33370911280315 95.52799999999996 202.06270214716594 31.842666666666616 214.57986068725586 31.842666666666616C 227.09701922734578 31.842666666666616 237.8260122617086 31.842666666666616 250.34317080179852 31.842666666666616C 262.8603293418885 31.842666666666616 273.58932237625123 63.68533333333329 286.1064809163412 63.68533333333329C 298.6236394564311 63.68533333333329 309.3526324907939 63.68533333333329 321.8697910308838 63.68533333333329C 334.38694957097374 63.68533333333329 345.1159426053365 95.52799999999996 357.63310114542645 95.52799999999996C 370.1502596855164 95.52799999999996 380.87925271987916 95.52799999999996 393.3964112599691 95.52799999999996C 405.913569800059 95.52799999999996 416.6425628344218 63.68533333333329 429.1597213745117 63.68533333333329C 441.67687991460167 63.68533333333329 452.40587294896443 63.68533333333329 464.9230314890544 63.68533333333329C 477.44019002914433 63.68533333333329 488.1691830635071 95.52799999999996 500.68634160359704 95.52799999999996C 513.2035001436869 95.52799999999996 523.9324931780498 95.52799999999996 536.4496517181396 95.52799999999996C 548.9668102582295 95.52799999999996 559.6958032925925 63.68533333333329 572.2129618326824 63.68533333333329C 584.7301203727723 63.68533333333329 595.4591134071351 63.68533333333329 607.976271947225 63.68533333333329C 620.4934304873149 63.68533333333329 631.2224235216777 31.842666666666616 643.7395820617676 31.842666666666616"
												pathFrom="M 0 382.11199999999997 L 0 382.11199999999997 L 35.76331011454265 382.11199999999997 L 71.5266202290853 382.11199999999997 L 107.28993034362793 382.11199999999997 L 143.0532404581706 382.11199999999997 L 178.81655057271323 382.11199999999997 L 214.57986068725586 382.11199999999997 L 250.34317080179852 382.11199999999997 L 286.1064809163412 382.11199999999997 L 321.8697910308838 382.11199999999997 L 357.63310114542645 382.11199999999997 L 393.3964112599691 382.11199999999997 L 429.1597213745117 382.11199999999997 L 464.9230314890544 382.11199999999997 L 500.68634160359704 382.11199999999997 L 536.4496517181396 382.11199999999997 L 572.2129618326824 382.11199999999997 L 607.976271947225 382.11199999999997 L 643.7395820617676 382.11199999999997"
												fill-rule="evenodd"></path>
												<g id="SvgjsG1018"
												class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown"
												data:realIndex="0">
												<g class="apexcharts-series-markers">
												<path id="SvgjsPath1120"
												d="M 0, 0 
	           m -0, 0 
	           a 0,0 0 1,0 0,0 
	           a 0,0 0 1,0 -0,0"
												fill="#b8d935" fill-opacity="1" stroke="#b8d935"
												stroke-opacity="0.9" stroke-linecap="butt" stroke-width="3"
												stroke-dasharray="0" cx="0" cy="0" shape="circle"
												class="apexcharts-marker w5p17rset no-pointer-events"
												default-marker-size="0"></path></g></g></g>
												<g id="SvgjsG1019" class="apexcharts-datalabels"
												data:realIndex="0"></g></g>
												<line id="SvgjsLine1038" x1="0" y1="0" x2="0"
												y2="222.89866666666666" stroke="#b8d935" stroke-dasharray="3"
												stroke-linecap="butt" class="apexcharts-xcrosshairs" x="0"
												y="0" width="1" height="222.89866666666666" fill="#b1b9c4"
												filter="none" fill-opacity="0.9" stroke-width="1"></line>
												<line id="SvgjsLine1039" x1="0" y1="0" x2="643.7395820617676"
												y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1"
												stroke-linecap="butt" class="apexcharts-ycrosshairs"></line>
												<line id="SvgjsLine1040" x1="0" y1="0" x2="643.7395820617676"
												y2="0" stroke-dasharray="0" stroke-width="0"
												stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line>
												<g id="SvgjsG1041" class="apexcharts-xaxis"
												transform="translate(0, 0)">
												<g id="SvgjsG1042" class="apexcharts-xaxis-texts-g"
												transform="translate(0, -10)">
												<text id="SvgjsText1044" font-family="inherit" x="0"
												y="244.89866666666666" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1045"></tspan>
												<title></title></text>
												<text id="SvgjsText1047" font-family="inherit"
												x="35.76331011454265" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1048"></tspan>
												<title></title></text>
												<text id="SvgjsText1050" font-family="inherit"
												x="71.52662022908528" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1051"></tspan>
												<title></title></text>
												<text id="SvgjsText1053" font-family="inherit"
												x="107.28993034362792" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;"
												transform="rotate(0 108.2899398803711 239.56533813476562)">
												<tspan id="SvgjsTspan1054">Apr 04</tspan>
												<title>Apr 04</title></text>
												<text id="SvgjsText1056" font-family="inherit"
												x="143.05324045817054" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1057"></tspan>
												<title></title></text>
												<text id="SvgjsText1059" font-family="inherit"
												x="178.81655057271317" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1060"></tspan>
												<title></title></text>
												<text id="SvgjsText1062" font-family="inherit"
												x="214.5798606872558" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;"
												transform="rotate(0 215.5798797607422 239.56533813476562)">
												<tspan id="SvgjsTspan1063">Apr 07</tspan>
												<title>Apr 07</title></text>
												<text id="SvgjsText1065" font-family="inherit"
												x="250.34317080179844" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1066"></tspan>
												<title></title></text>
												<text id="SvgjsText1068" font-family="inherit"
												x="286.1064809163411" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1069"></tspan>
												<title></title></text>
												<text id="SvgjsText1071" font-family="inherit"
												x="321.8697910308838" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;"
												transform="rotate(0 322.8698024749756 239.56533813476562)">
												<tspan id="SvgjsTspan1072">Apr 10</tspan>
												<title>Apr 10</title></text>
												<text id="SvgjsText1074" font-family="inherit"
												x="357.63310114542645" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1075"></tspan>
												<title></title></text>
												<text id="SvgjsText1077" font-family="inherit"
												x="393.3964112599691" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1078"></tspan>
												<title></title></text>
												<text id="SvgjsText1080" font-family="inherit"
												x="429.1597213745118" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;"
												transform="rotate(0 430.1597595214844 239.56533813476562)">
												<tspan id="SvgjsTspan1081">Apr 13</tspan>
												<title>Apr 13</title></text>
												<text id="SvgjsText1083" font-family="inherit"
												x="464.92303148905444" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1084"></tspan>
												<title></title></text>
												<text id="SvgjsText1086" font-family="inherit"
												x="500.6863416035971" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1087"></tspan>
												<title></title></text>
												<text id="SvgjsText1089" font-family="inherit"
												x="536.4496517181396" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;"
												transform="rotate(0 537.4496459960938 239.56533813476562)">
												<tspan id="SvgjsTspan1090">Apr 16</tspan>
												<title>Apr 16</title></text>
												<text id="SvgjsText1092" font-family="inherit"
												x="572.2129618326823" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1093"></tspan>
												<title></title></text>
												<text id="SvgjsText1095" font-family="inherit"
												x="607.9762719472249" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1096"></tspan>
												<title></title></text>
												<text id="SvgjsText1098" font-family="inherit"
												x="643.7395820617675" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1099"></tspan>
												<title></title></text></g></g>
												<g id="SvgjsG1117"
												class="apexcharts-yaxis-annotations apexcharts-hidden-element-shown"></g>
												<g id="SvgjsG1118"
												class="apexcharts-xaxis-annotations apexcharts-hidden-element-shown"></g>
												<g id="SvgjsG1119"
												class="apexcharts-point-annotations apexcharts-hidden-element-shown"></g>
												<rect id="SvgjsRect1121" width="0" height="0" x="0" y="0"
												rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fefefe"
												class="apexcharts-zoom-rect"></rect>
												<rect id="SvgjsRect1122" width="0" height="0" x="0" y="0"
												rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fefefe"
												class="apexcharts-selection-rect"></rect></g></svg>
										<div class="apexcharts-tooltip apexcharts-theme-light">
											<div class="apexcharts-tooltip-title"
												style="font-family: inherit; font-size: 12px;"></div>
											<div class="apexcharts-tooltip-series-group" style="order: 1;">
												<span class="apexcharts-tooltip-marker"
													style="background-color: rgb(184, 217, 53);"></span>
												<div class="apexcharts-tooltip-text"
													style="font-family: inherit; font-size: 12px;">
													<div class="apexcharts-tooltip-y-group">
														<span class="apexcharts-tooltip-text-y-label"></span><span
															class="apexcharts-tooltip-text-y-value"></span>
													</div>
													<div class="apexcharts-tooltip-goals-group">
														<span class="apexcharts-tooltip-text-goals-label"></span><span
															class="apexcharts-tooltip-text-goals-value"></span>
													</div>
													<div class="apexcharts-tooltip-z-group">
														<span class="apexcharts-tooltip-text-z-label"></span><span
															class="apexcharts-tooltip-text-z-value"></span>
													</div>
												</div>
											</div>
										</div>
										<div
											class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light">
											<div class="apexcharts-xaxistooltip-text"
												style="font-family: inherit; font-size: 12px;"></div>
										</div>
										<div
											class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
											<div class="apexcharts-yaxistooltip-text"></div>
										</div>
									</div>
								</div>
								<!--end::Chart-->
							</div>
							<!--end::Card body-->
						</div>
						<!--end::Chart widget 3-->
					</div>
					<!--end::Col-->
				</div>
				<!--end::Row-->
	
	
				<!--begin::Row-->
				<div class="row gy-5 g-xl-10">
					<!--begin::Col-->
					<div class="col-xl-6 mb-xl-10">
	
						<!--begin::Table widget 2-->
						<div class="card h-md-100">
							<!--begin::Header-->
							<div class="card-header align-items-center border-0">
								<!--begin::Title-->
								<h3 class="fw-bold text-gray-900 m-0">Recent Orders</h3>
								<!--end::Title-->
	
								<!--begin::Menu-->
								<button
									class="btn btn-icon btn-color-gray-500 btn-active-color-primary justify-content-end"
									data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end"
									data-kt-menu-overflow="true">
	
									<i class="ki-duotone ki-dots-square fs-1"><span
										class="path1"></span><span class="path2"></span><span
										class="path3"></span><span class="path4"></span></i>
								</button>
	
								<!--begin::Menu 2-->
								<div
									class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-semibold w-200px"
									data-kt-menu="true">
									<!--begin::Menu item-->
									<div class="menu-item px-3">
										<div class="menu-content fs-6 text-gray-900 fw-bold px-3 py-4">Quick
											Actions</div>
									</div>
									<!--end::Menu item-->
	
									<!--begin::Menu separator-->
									<div class="separator mb-3 opacity-75"></div>
									<!--end::Menu separator-->
	
									<!--begin::Menu item-->
									<div class="menu-item px-3">
										<a href="#" class="menu-link px-3"> New Ticket </a>
									</div>
									<!--end::Menu item-->
	
									<!--begin::Menu item-->
									<div class="menu-item px-3">
										<a href="#" class="menu-link px-3"> New Customer </a>
									</div>
									<!--end::Menu item-->
	
									<!--begin::Menu item-->
									<div class="menu-item px-3" data-kt-menu-trigger="hover"
										data-kt-menu-placement="right-start">
										<!--begin::Menu item-->
										<a href="#" class="menu-link px-3"> <span
											class="menu-title">New Group</span> <span class="menu-arrow"></span>
										</a>
										<!--end::Menu item-->
	
										<!--begin::Menu sub-->
										<div class="menu-sub menu-sub-dropdown w-175px py-4">
											<!--begin::Menu item-->
											<div class="menu-item px-3">
												<a href="#" class="menu-link px-3"> Admin Group </a>
											</div>
											<!--end::Menu item-->
	
											<!--begin::Menu item-->
											<div class="menu-item px-3">
												<a href="#" class="menu-link px-3"> Staff Group </a>
											</div>
											<!--end::Menu item-->
	
											<!--begin::Menu item-->
											<div class="menu-item px-3">
												<a href="#" class="menu-link px-3"> Member Group </a>
											</div>
											<!--end::Menu item-->
										</div>
										<!--end::Menu sub-->
									</div>
									<!--end::Menu item-->
	
									<!--begin::Menu item-->
									<div class="menu-item px-3">
										<a href="#" class="menu-link px-3"> New Contact </a>
									</div>
									<!--end::Menu item-->
	
									<!--begin::Menu separator-->
									<div class="separator mt-3 opacity-75"></div>
									<!--end::Menu separator-->
	
									<!--begin::Menu item-->
									<div class="menu-item px-3">
										<div class="menu-content px-3 py-3">
											<a class="btn btn-primary  btn-sm px-4" href="#"> Generate
												Reports </a>
										</div>
									</div>
									<!--end::Menu item-->
								</div>
								<!--end::Menu 2-->
	
								<!--end::Menu-->
							</div>
							<!--end::Header-->
	
							<!--begin::Body-->
							<div class="card-body pt-2">
								<!--begin::Nav-->
								<ul class="nav nav-pills nav-pills-custom mb-3" role="tablist">
									<!--begin::Item-->
									<li class="nav-item mb-3 me-3 me-lg-6" role="presentation">
										<!--begin::Link--> <a
										class="nav-link d-flex justify-content-between flex-column flex-center overflow-hidden active w-80px h-85px py-4"
										data-bs-toggle="pill" href="#kt_stats_widget_2_tab_1"
										aria-selected="true" role="tab"> <!--begin::Icon-->
											<div class="nav-icon">
												<img alt=""
													src="/good/assets/media/svg/products-categories/t-shirt.svg"
													class="">
											</div> <!--end::Icon--> <!--begin::Subtitle--> <span
											class="nav-text text-gray-700 fw-bold fs-6 lh-1">
												T-shirt </span> <!--end::Subtitle--> <!--begin::Bullet--> <span
											class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
											<!--end::Bullet-->
									</a> <!--end::Link-->
									</li>
									<!--end::Item-->
	
									<!--begin::Item-->
									<li class="nav-item mb-3 me-3 me-lg-6" role="presentation">
										<!--begin::Link--> <a
										class="nav-link d-flex justify-content-between flex-column flex-center overflow-hidden w-80px h-85px py-4"
										data-bs-toggle="pill" href="#kt_stats_widget_2_tab_2"
										aria-selected="false" tabindex="-1" role="tab"> <!--begin::Icon-->
											<div class="nav-icon">
												<img alt=""
													src="/good/assets/media/svg/products-categories/gaming.svg"
													class="">
											</div> <!--end::Icon--> <!--begin::Subtitle--> <span
											class="nav-text text-gray-700 fw-bold fs-6 lh-1">
												Gaming </span> <!--end::Subtitle--> <!--begin::Bullet--> <span
											class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
											<!--end::Bullet-->
									</a> <!--end::Link-->
									</li>
									<!--end::Item-->
	
									<!--begin::Item-->
									<li class="nav-item mb-3 me-3 me-lg-6" role="presentation">
										<!--begin::Link--> <a
										class="nav-link d-flex justify-content-between flex-column flex-center overflow-hidden w-80px h-85px py-4"
										data-bs-toggle="pill" href="#kt_stats_widget_2_tab_3"
										aria-selected="false" tabindex="-1" role="tab"> <!--begin::Icon-->
											<div class="nav-icon">
												<img alt=""
													src="/good/assets/media/svg/products-categories/watch.svg"
													class="">
											</div> <!--end::Icon--> <!--begin::Subtitle--> <span
											class="nav-text text-gray-600 fw-bold fs-6 lh-1"> Watch
										</span> <!--end::Subtitle--> <!--begin::Bullet--> <span
											class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
											<!--end::Bullet-->
									</a> <!--end::Link-->
									</li>
									<!--end::Item-->
	
									<!--begin::Item-->
									<li class="nav-item mb-3 me-3 me-lg-6" role="presentation">
										<!--begin::Link--> <a
										class="nav-link d-flex justify-content-between flex-column flex-center overflow-hidden w-80px h-85px py-4"
										data-bs-toggle="pill" href="#kt_stats_widget_2_tab_4"
										aria-selected="false" tabindex="-1" role="tab"> <!--begin::Icon-->
											<div class="nav-icon">
												<img alt=""
													src="/good/assets/media/svg/products-categories/gloves.svg"
													class="nav-icon">
											</div> <!--end::Icon--> <!--begin::Subtitle--> <span
											class="nav-text text-gray-600 fw-bold fs-6 lh-1">
												Gloves </span> <!--end::Subtitle--> <!--begin::Bullet--> <span
											class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
											<!--end::Bullet-->
									</a> <!--end::Link-->
									</li>
									<!--end::Item-->
	
									<!--begin::Item-->
									<li class="nav-item mb-3" role="presentation">
										<!--begin::Link--> <a
										class="nav-link d-flex justify-content-between flex-column flex-center overflow-hidden w-80px h-85px py-4"
										data-bs-toggle="pill" href="#kt_stats_widget_2_tab_5"
										aria-selected="false" tabindex="-1" role="tab"> <!--begin::Icon-->
											<div class="nav-icon">
												<img alt=""
													src="/good/assets/media/svg/products-categories/shoes.svg"
													class="nav-icon">
											</div> <!--end::Icon--> <!--begin::Subtitle--> <span
											class="nav-text text-gray-600 fw-bold fs-6 lh-1"> Shoes
										</span> <!--end::Subtitle--> <!--begin::Bullet--> <span
											class="bullet-custom position-absolute bottom-0 w-100 h-4px bg-primary"></span>
											<!--end::Bullet-->
									</a> <!--end::Link-->
									</li>
									<!--end::Item-->
								</ul>
								<!--end::Nav-->
	
								<!--begin::Tab Content-->
								<div class="tab-content">
	
									<!--begin::Tap pane-->
									<div class="tab-pane fade show active"
										id="kt_stats_widget_2_tab_1" role="tabpanel">
										<!--begin::Table container-->
										<div class="table-responsive">
											<!--begin::Table-->
											<table
												class="table table-row-dashed align-middle gs-0 gy-4 my-0">
												<!--begin::Table head-->
												<thead>
													<tr class="fs-7 fw-bold text-gray-500 border-bottom-0">
														<th class="ps-0 w-50px">ITEM</th>
														<th class="min-w-125px"></th>
														<th class="text-end min-w-100px">QTY</th>
														<th class="pe-0 text-end min-w-100px">PRICE</th>
														<th class="pe-0 text-end min-w-100px">TOTAL PRICE</th>
													</tr>
												</thead>
												<!--end::Table head-->
	
												<!--begin::Table body-->
												<tbody>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/210.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">Elephant
																1802</a> <span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-2347</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x1</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$72.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$126.00</span>
														</td>
													</tr>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/215.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">Red
																Laga</a> <span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-1321</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x2</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$45.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$76.00</span></td>
													</tr>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/209.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">RiseUP</a>
															<span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-4312</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x3</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$84.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$168.00</span>
														</td>
													</tr>
												</tbody>
												<!--end::Table body-->
											</table>
											<!--end::Table-->
										</div>
										<!--end::Table container-->
									</div>
									<!--end::Tap pane-->
	
									<!--begin::Tap pane-->
									<div class="tab-pane fade " id="kt_stats_widget_2_tab_2"
										role="tabpanel">
										<!--begin::Table container-->
										<div class="table-responsive">
											<!--begin::Table-->
											<table
												class="table table-row-dashed align-middle gs-0 gy-4 my-0">
												<!--begin::Table head-->
												<thead>
													<tr class="fs-7 fw-bold text-gray-500 border-bottom-0">
														<th class="ps-0 w-50px">ITEM</th>
														<th class="min-w-125px"></th>
														<th class="text-end min-w-100px">QTY</th>
														<th class="pe-0 text-end min-w-100px">PRICE</th>
														<th class="pe-0 text-end min-w-100px">TOTAL PRICE</th>
													</tr>
												</thead>
												<!--end::Table head-->
	
												<!--begin::Table body-->
												<tbody>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/197.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">Elephant
																1802</a> <span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-4312</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x1</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$32.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$312.00</span>
														</td>
													</tr>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/178.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">Red
																Laga</a> <span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-3122</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x2</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$53.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$62.00</span></td>
													</tr>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/22.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">RiseUP</a>
															<span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-1142</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x3</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$74.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$139.00</span>
														</td>
													</tr>
												</tbody>
												<!--end::Table body-->
											</table>
											<!--end::Table-->
										</div>
										<!--end::Table container-->
									</div>
									<!--end::Tap pane-->
	
									<!--begin::Tap pane-->
									<div class="tab-pane fade " id="kt_stats_widget_2_tab_3"
										role="tabpanel">
										<!--begin::Table container-->
										<div class="table-responsive">
											<!--begin::Table-->
											<table
												class="table table-row-dashed align-middle gs-0 gy-4 my-0">
												<!--begin::Table head-->
												<thead>
													<tr class="fs-7 fw-bold text-gray-500 border-bottom-0">
														<th class="ps-0 w-50px">ITEM</th>
														<th class="min-w-125px"></th>
														<th class="text-end min-w-100px">QTY</th>
														<th class="pe-0 text-end min-w-100px">PRICE</th>
														<th class="pe-0 text-end min-w-100px">TOTAL PRICE</th>
													</tr>
												</thead>
												<!--end::Table head-->
	
												<!--begin::Table body-->
												<tbody>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/1.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">Elephant
																1324</a> <span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-1523</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x1</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$43.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$231.00</span>
														</td>
													</tr>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/24.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">Red
																Laga</a> <span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-5314</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x2</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$71.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$53.00</span></td>
													</tr>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/71.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">RiseUP</a>
															<span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-4222</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x3</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$23.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$213.00</span>
														</td>
													</tr>
												</tbody>
												<!--end::Table body-->
											</table>
											<!--end::Table-->
										</div>
										<!--end::Table container-->
									</div>
									<!--end::Tap pane-->
	
									<!--begin::Tap pane-->
									<div class="tab-pane fade " id="kt_stats_widget_2_tab_4"
										role="tabpanel">
										<!--begin::Table container-->
										<div class="table-responsive">
											<!--begin::Table-->
											<table
												class="table table-row-dashed align-middle gs-0 gy-4 my-0">
												<!--begin::Table head-->
												<thead>
													<tr class="fs-7 fw-bold text-gray-500 border-bottom-0">
														<th class="ps-0 w-50px">ITEM</th>
														<th class="min-w-125px"></th>
														<th class="text-end min-w-100px">QTY</th>
														<th class="pe-0 text-end min-w-100px">PRICE</th>
														<th class="pe-0 text-end min-w-100px">TOTAL PRICE</th>
													</tr>
												</thead>
												<!--end::Table head-->
	
												<!--begin::Table body-->
												<tbody>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/41.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">Elephant
																2635</a> <span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-1523</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x1</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$65.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$163.00</span>
														</td>
													</tr>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/63.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">Red
																Laga</a> <span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-2745</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x2</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$64.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$73.00</span></td>
													</tr>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/59.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">RiseUP</a>
															<span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-5173</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x3</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$54.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$173.00</span>
														</td>
													</tr>
												</tbody>
												<!--end::Table body-->
											</table>
											<!--end::Table-->
										</div>
										<!--end::Table container-->
									</div>
									<!--end::Tap pane-->
	
									<!--begin::Tap pane-->
									<div class="tab-pane fade " id="kt_stats_widget_2_tab_5"
										role="tabpanel">
										<!--begin::Table container-->
										<div class="table-responsive">
											<!--begin::Table-->
											<table
												class="table table-row-dashed align-middle gs-0 gy-4 my-0">
												<!--begin::Table head-->
												<thead>
													<tr class="fs-7 fw-bold text-gray-500 border-bottom-0">
														<th class="ps-0 w-50px">ITEM</th>
														<th class="min-w-125px"></th>
														<th class="text-end min-w-100px">QTY</th>
														<th class="pe-0 text-end min-w-100px">PRICE</th>
														<th class="pe-0 text-end min-w-100px">TOTAL PRICE</th>
													</tr>
												</thead>
												<!--end::Table head-->
	
												<!--begin::Table body-->
												<tbody>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/10.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">Nike</a>
															<span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-2163</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x1</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$64.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$287.00</span>
														</td>
													</tr>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/96.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">Adidas</a>
															<span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-2162</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x2</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$76.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$51.00</span></td>
													</tr>
													<tr>
														<td><img
															src="/good/assets/media/stock/ecommerce/13.png"
															class="w-50px ms-n1" alt=""></td>
														<td class="ps-0"><a
															href="/good/apps/ecommerce/catalog/edit-product.html"
															class="text-gray-800 fw-bold text-hover-primary mb-1 fs-6 text-start pe-0">Puma</a>
															<span
															class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Item:
																#XDG-1537</span></td>
														<td><span
															class="text-gray-800 fw-bold d-block fs-6 ps-0 text-end">x3</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$27.00</span></td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$167.00</span>
														</td>
													</tr>
												</tbody>
												<!--end::Table body-->
											</table>
											<!--end::Table-->
										</div>
										<!--end::Table container-->
									</div>
									<!--end::Tap pane-->
								</div>
								<!--end::Tab Content-->
							</div>
							<!--end: Card Body-->
						</div>
						<!--end::Table widget 2-->
					</div>
					<!--end::Col-->
	
					<!--begin::Col-->
					<div class="col-xl-6 mb-5 mb-xl-10">
						<!--begin::Chart widget 4-->
						<div class="card card-flush overflow-hidden h-md-100">
							<!--begin::Header-->
							<div class="card-header py-5">
								<!--begin::Title-->
								<h3 class="card-title align-items-start flex-column">
									<span class="card-label fw-bold text-gray-900">Discounted
										Product Sales</span> <span class="text-gray-500 mt-1 fw-semibold fs-6">Users
										from all channels</span>
								</h3>
								<!--end::Title-->
	
								<!--begin::Toolbar-->
								<div class="card-toolbar">
									<!--begin::Menu-->
									<button
										class="btn btn-icon btn-color-gray-500 btn-active-color-primary justify-content-end"
										data-kt-menu-trigger="click"
										data-kt-menu-placement="bottom-end"
										data-kt-menu-overflow="true">
	
										<i class="ki-duotone ki-dots-square fs-1"><span
											class="path1"></span><span class="path2"></span><span
											class="path3"></span><span class="path4"></span></i>
									</button>
	
	
									<!--begin::Menu 2-->
									<div
										class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-semibold w-200px"
										data-kt-menu="true">
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<div class="menu-content fs-6 text-gray-900 fw-bold px-3 py-4">Quick
												Actions</div>
										</div>
										<!--end::Menu item-->
	
										<!--begin::Menu separator-->
										<div class="separator mb-3 opacity-75"></div>
										<!--end::Menu separator-->
	
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3"> New Ticket </a>
										</div>
										<!--end::Menu item-->
	
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3"> New Customer </a>
										</div>
										<!--end::Menu item-->
	
										<!--begin::Menu item-->
										<div class="menu-item px-3" data-kt-menu-trigger="hover"
											data-kt-menu-placement="right-start">
											<!--begin::Menu item-->
											<a href="#" class="menu-link px-3"> <span
												class="menu-title">New Group</span> <span class="menu-arrow"></span>
											</a>
											<!--end::Menu item-->
	
											<!--begin::Menu sub-->
											<div class="menu-sub menu-sub-dropdown w-175px py-4">
												<!--begin::Menu item-->
												<div class="menu-item px-3">
													<a href="#" class="menu-link px-3"> Admin Group </a>
												</div>
												<!--end::Menu item-->
	
												<!--begin::Menu item-->
												<div class="menu-item px-3">
													<a href="#" class="menu-link px-3"> Staff Group </a>
												</div>
												<!--end::Menu item-->
	
												<!--begin::Menu item-->
												<div class="menu-item px-3">
													<a href="#" class="menu-link px-3"> Member Group </a>
												</div>
												<!--end::Menu item-->
											</div>
											<!--end::Menu sub-->
										</div>
										<!--end::Menu item-->
	
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3"> New Contact </a>
										</div>
										<!--end::Menu item-->
	
										<!--begin::Menu separator-->
										<div class="separator mt-3 opacity-75"></div>
										<!--end::Menu separator-->
	
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<div class="menu-content px-3 py-3">
												<a class="btn btn-primary  btn-sm px-4" href="#">
													Generate Reports </a>
											</div>
										</div>
										<!--end::Menu item-->
									</div>
									<!--end::Menu 2-->
	
									<!--end::Menu-->
								</div>
								<!--end::Toolbar-->
							</div>
							<!--end::Header-->
	
							<!--begin::Card body-->
							<div
								class="card-body d-flex justify-content-between flex-column pb-1 px-0">
								<!--begin::Info-->
								<div class="px-9 mb-5">
									<!--begin::Statistics-->
									<div class="d-flex align-items-center mb-2">
										<!--begin::Currency-->
										<span
											class="fs-4 fw-semibold text-gray-500 align-self-start me-1">$</span>
										<!--end::Currency-->
	
										<!--begin::Value-->
										<span class="fs-2hx fw-bold text-gray-800 me-2 lh-1 ls-n2">3,706</span>
										<!--end::Value-->
	
										<!--begin::Label-->
										<span class="badge badge-light-success fs-base"> <i
											class="ki-duotone ki-arrow-down fs-5 text-success ms-n1"><span
												class="path1"></span><span class="path2"></span></i> 4.5%
										</span>
										<!--end::Label-->
									</div>
									<!--end::Statistics-->
	
									<!--begin::Description-->
									<span class="fs-6 fw-semibold text-gray-500">Total
										Discounted Sales This Month</span>
									<!--end::Description-->
								</div>
								<!--end::Info-->
	
								<!--begin::Chart-->
								<div id="kt_charts_widget_4" class="min-h-auto ps-4 pe-6"
									style="height: 300px; min-height: 315px;">
									<div id="apexcharts94q6fdfy"
										class="apexcharts-canvas apexcharts94q6fdfy apexcharts-theme-"
										style="width: 721.5px; height: 300px;">
										<svg id="SvgjsSvg1123" width="721.5" height="300"
											xmlns="http://www.w3.org/2000/svg" version="1.1"
											xmlns:xlink="http://www.w3.org/1999/xlink"
											xmlns:svgjs="http://svgjs.dev"
											class="apexcharts-svg apexcharts-zoomable"
											xmlns:data="ApexChartsNS" transform="translate(0, 0)">
												<foreignObject x="0" y="0" width="721.5" height="300">
												<div class="apexcharts-legend"
												xmlns="http://www.w3.org/1999/xhtml"
												style="max-height: 150px;"></div></foreignObject>
												<g id="SvgjsG1131" class="apexcharts-datalabels-group"
												transform="translate(0, 0) scale(1)"></g>
												<g id="SvgjsG1132" class="apexcharts-datalabels-group"
												transform="translate(0, 0) scale(1)"></g>
												<rect id="SvgjsRect1156" width="0" height="0" x="0" y="0"
												rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fefefe"></rect>
												<g id="SvgjsG1219" class="apexcharts-yaxis" rel="0"
												transform="translate(26.96875, 0)">
												<g id="SvgjsG1220" class="apexcharts-yaxis-texts-g">
												<text id="SvgjsText1222" font-family="inherit" x="20" y="34"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
												<tspan id="SvgjsTspan1223">$363</tspan>
												<title>$363</title></text>
												<text id="SvgjsText1225" font-family="inherit" x="20"
												y="71.14977777777779" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
												<tspan id="SvgjsTspan1226">$357</tspan>
												<title>$357</title></text>
												<text id="SvgjsText1228" font-family="inherit" x="20"
												y="108.29955555555557" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
												<tspan id="SvgjsTspan1229">$352</tspan>
												<title>$352</title></text>
												<text id="SvgjsText1231" font-family="inherit" x="20"
												y="145.44933333333336" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
												<tspan id="SvgjsTspan1232">$346</tspan>
												<title>$346</title></text>
												<text id="SvgjsText1234" font-family="inherit" x="20"
												y="182.59911111111114" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
												<tspan id="SvgjsTspan1235">$341</tspan>
												<title>$341</title></text>
												<text id="SvgjsText1237" font-family="inherit" x="20"
												y="219.74888888888893" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
												<tspan id="SvgjsTspan1238">$335</tspan>
												<title>$335</title></text>
												<text id="SvgjsText1240" font-family="inherit" x="20"
												y="256.8986666666667" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
												<tspan id="SvgjsTspan1241">$330</tspan>
												<title>$330</title></text></g></g>
												<g id="SvgjsG1125"
												class="apexcharts-inner apexcharts-graphical"
												transform="translate(56.96875, 30)">
												<defs id="SvgjsDefs1124">
												<clipPath id="gridRectMask94q6fdfy">
												<rect id="SvgjsRect1129" width="661.53125"
												height="229.89866666666666" x="-3.5" y="-3.5" rx="0" ry="0"
												opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fff"></rect></clipPath>
												<clipPath id="forecastMask94q6fdfy"></clipPath>
												<clipPath id="nonForecastMask94q6fdfy"></clipPath>
												<clipPath id="gridRectMarkerMask94q6fdfy">
												<rect id="SvgjsRect1130" width="658.53125"
												height="226.89866666666666" x="-2" y="-2" rx="0" ry="0"
												opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fff"></rect></clipPath>
												<linearGradient id="SvgjsLinearGradient1137" x1="0" y1="0"
												x2="0" y2="1">
												<stop id="SvgjsStop1138" stop-opacity="0.4"
												stop-color="rgba(79,201,218,0.4)" offset="0"></stop>
												<stop id="SvgjsStop1139" stop-opacity="0"
												stop-color="rgba(255,255,255,0)" offset="0.8"></stop>
												<stop id="SvgjsStop1140" stop-opacity="0"
												stop-color="rgba(255,255,255,0)" offset="1"></stop></linearGradient></defs>
												<g id="SvgjsG1143" class="apexcharts-grid">
												<g id="SvgjsG1144" class="apexcharts-gridlines-horizontal">
												<line id="SvgjsLine1148" x1="0" y1="37.14977777777778"
												x2="654.53125" y2="37.14977777777778" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
												<line id="SvgjsLine1149" x1="0" y1="74.29955555555556"
												x2="654.53125" y2="74.29955555555556" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
												<line id="SvgjsLine1150" x1="0" y1="111.44933333333333"
												x2="654.53125" y2="111.44933333333333" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
												<line id="SvgjsLine1151" x1="0" y1="148.5991111111111"
												x2="654.53125" y2="148.5991111111111" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
												<line id="SvgjsLine1152" x1="0" y1="185.7488888888889"
												x2="654.53125" y2="185.7488888888889" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
												<line id="SvgjsLine1153" x1="0" y1="222.89866666666668"
												x2="654.53125" y2="222.89866666666668" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line></g>
												<g id="SvgjsG1145" class="apexcharts-gridlines-vertical"></g>
												<line id="SvgjsLine1155" x1="0" y1="222.89866666666666"
												x2="654.53125" y2="222.89866666666666" stroke="transparent"
												stroke-dasharray="0" stroke-linecap="butt"></line>
												<line id="SvgjsLine1154" x1="0" y1="1" x2="0"
												y2="222.89866666666666" stroke="transparent"
												stroke-dasharray="0" stroke-linecap="butt"></line></g>
												<g id="SvgjsG1146" class="apexcharts-grid-borders">
												<line id="SvgjsLine1147" x1="0" y1="0" x2="654.53125" y2="0"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line></g>
												<g id="SvgjsG1133"
												class="apexcharts-area-series apexcharts-plot-series">
												<g id="SvgjsG1134" class="apexcharts-series" zIndex="0"
												seriesName="Sales" data:longestSeries="true" rel="1"
												data:realIndex="0">
												<path id="SvgjsPath1141"
												d="M0 121.58109090909056C12.726996527777777 121.58109090909056 23.635850694444443 121.58109090909056 36.36284722222222 121.58109090909056C49.08984375 121.58109090909056 59.998697916666664 87.8085656565654 72.72569444444444 87.8085656565654C85.45269097222223 87.8085656565654 96.36154513888889 87.8085656565654 109.08854166666667 87.8085656565654C121.81553819444444 87.8085656565654 132.72439236111111 54.03604040404025 145.45138888888889 54.03604040404025C158.17838541666666 54.03604040404025 169.08723958333334 54.03604040404025 181.81423611111111 54.03604040404025C194.54123263888889 54.03604040404025 205.45008680555557 87.8085656565654 218.17708333333334 87.8085656565654C230.90407986111111 87.8085656565654 241.8129340277778 87.8085656565654 254.53993055555557 87.8085656565654C267.2669270833333 87.8085656565654 278.17578125 54.03604040404025 290.90277777777777 54.03604040404025C303.62977430555554 54.03604040404025 314.53862847222223 54.03604040404025 327.265625 54.03604040404025C339.99262152777777 54.03604040404025 350.90147569444446 87.8085656565654 363.62847222222223 87.8085656565654C376.35546875 87.8085656565654 387.2643229166667 87.8085656565654 399.99131944444446 87.8085656565654C412.71831597222223 87.8085656565654 423.6271701388889 121.58109090909056 436.3541666666667 121.58109090909056C449.08116319444446 121.58109090909056 459.99001736111114 121.58109090909056 472.7170138888889 121.58109090909056C485.4440104166667 121.58109090909056 496.35286458333337 87.8085656565654 509.07986111111114 87.8085656565654C521.8068576388889 87.8085656565654 532.7157118055555 87.8085656565654 545.4427083333334 87.8085656565654C558.1697048611111 87.8085656565654 569.0785590277778 54.03604040404025 581.8055555555555 54.03604040404025C594.5325520833334 54.03604040404025 605.44140625 54.03604040404025 618.1684027777778 54.03604040404025C630.8953993055555 54.03604040404025 641.8042534722223 87.8085656565654 654.53125 87.8085656565654C654.53125 87.8085656565654 654.53125 87.8085656565654 654.53125 222.8986666666665L0 222.8986666666665C0 222.8986666666665 0 121.58109090909056 0 121.58109090909056 "
												fill="url(#SvgjsLinearGradient1137)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="butt" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-area" index="0"
												clip-path="url(#gridRectMask94q6fdfy)"
												pathTo="M 0 121.58109090909056C 12.726996527777777 121.58109090909056 23.635850694444443 121.58109090909056 36.36284722222222 121.58109090909056C 49.08984375 121.58109090909056 59.998697916666664 87.8085656565654 72.72569444444444 87.8085656565654C 85.45269097222223 87.8085656565654 96.36154513888889 87.8085656565654 109.08854166666667 87.8085656565654C 121.81553819444444 87.8085656565654 132.72439236111111 54.03604040404025 145.45138888888889 54.03604040404025C 158.17838541666666 54.03604040404025 169.08723958333334 54.03604040404025 181.81423611111111 54.03604040404025C 194.54123263888889 54.03604040404025 205.45008680555557 87.8085656565654 218.17708333333334 87.8085656565654C 230.90407986111111 87.8085656565654 241.8129340277778 87.8085656565654 254.53993055555557 87.8085656565654C 267.2669270833333 87.8085656565654 278.17578125 54.03604040404025 290.90277777777777 54.03604040404025C 303.62977430555554 54.03604040404025 314.53862847222223 54.03604040404025 327.265625 54.03604040404025C 339.99262152777777 54.03604040404025 350.90147569444446 87.8085656565654 363.62847222222223 87.8085656565654C 376.35546875 87.8085656565654 387.2643229166667 87.8085656565654 399.99131944444446 87.8085656565654C 412.71831597222223 87.8085656565654 423.6271701388889 121.58109090909056 436.3541666666667 121.58109090909056C 449.08116319444446 121.58109090909056 459.99001736111114 121.58109090909056 472.7170138888889 121.58109090909056C 485.4440104166667 121.58109090909056 496.35286458333337 87.8085656565654 509.07986111111114 87.8085656565654C 521.8068576388889 87.8085656565654 532.7157118055555 87.8085656565654 545.4427083333334 87.8085656565654C 558.1697048611111 87.8085656565654 569.0785590277778 54.03604040404025 581.8055555555555 54.03604040404025C 594.5325520833334 54.03604040404025 605.44140625 54.03604040404025 618.1684027777778 54.03604040404025C 630.8953993055555 54.03604040404025 641.8042534722223 87.8085656565654 654.53125 87.8085656565654C 654.53125 87.8085656565654 654.53125 87.8085656565654 654.53125 222.89866666666666 L 0 222.89866666666666z"
												pathFrom="M 0 2451.885333333335 L 0 2451.885333333335 L 36.36284722222222 2451.885333333335 L 72.72569444444444 2451.885333333335 L 109.08854166666667 2451.885333333335 L 145.45138888888889 2451.885333333335 L 181.81423611111111 2451.885333333335 L 218.17708333333334 2451.885333333335 L 254.53993055555557 2451.885333333335 L 290.90277777777777 2451.885333333335 L 327.265625 2451.885333333335 L 363.62847222222223 2451.885333333335 L 399.99131944444446 2451.885333333335 L 436.3541666666667 2451.885333333335 L 472.7170138888889 2451.885333333335 L 509.07986111111114 2451.885333333335 L 545.4427083333334 2451.885333333335 L 581.8055555555555 2451.885333333335 L 618.1684027777778 2451.885333333335 L 654.53125 2451.885333333335z"></path>
												<path id="SvgjsPath1142"
												d="M0 121.58109090909056C12.726996527777777 121.58109090909056 23.635850694444443 121.58109090909056 36.36284722222222 121.58109090909056C49.08984375 121.58109090909056 59.998697916666664 87.8085656565654 72.72569444444444 87.8085656565654C85.45269097222223 87.8085656565654 96.36154513888889 87.8085656565654 109.08854166666667 87.8085656565654C121.81553819444444 87.8085656565654 132.72439236111111 54.03604040404025 145.45138888888889 54.03604040404025C158.17838541666666 54.03604040404025 169.08723958333334 54.03604040404025 181.81423611111111 54.03604040404025C194.54123263888889 54.03604040404025 205.45008680555557 87.8085656565654 218.17708333333334 87.8085656565654C230.90407986111111 87.8085656565654 241.8129340277778 87.8085656565654 254.53993055555557 87.8085656565654C267.2669270833333 87.8085656565654 278.17578125 54.03604040404025 290.90277777777777 54.03604040404025C303.62977430555554 54.03604040404025 314.53862847222223 54.03604040404025 327.265625 54.03604040404025C339.99262152777777 54.03604040404025 350.90147569444446 87.8085656565654 363.62847222222223 87.8085656565654C376.35546875 87.8085656565654 387.2643229166667 87.8085656565654 399.99131944444446 87.8085656565654C412.71831597222223 87.8085656565654 423.6271701388889 121.58109090909056 436.3541666666667 121.58109090909056C449.08116319444446 121.58109090909056 459.99001736111114 121.58109090909056 472.7170138888889 121.58109090909056C485.4440104166667 121.58109090909056 496.35286458333337 87.8085656565654 509.07986111111114 87.8085656565654C521.8068576388889 87.8085656565654 532.7157118055555 87.8085656565654 545.4427083333334 87.8085656565654C558.1697048611111 87.8085656565654 569.0785590277778 54.03604040404025 581.8055555555555 54.03604040404025C594.5325520833334 54.03604040404025 605.44140625 54.03604040404025 618.1684027777778 54.03604040404025C630.8953993055555 54.03604040404025 641.8042534722223 87.8085656565654 654.53125 87.8085656565654C654.53125 87.8085656565654 654.53125 87.8085656565654 654.53125 87.8085656565654 "
												fill="none" fill-opacity="1" stroke="#4fc9da"
												stroke-opacity="1" stroke-linecap="butt" stroke-width="3"
												stroke-dasharray="0" class="apexcharts-area" index="0"
												clip-path="url(#gridRectMask94q6fdfy)"
												pathTo="M 0 121.58109090909056C 12.726996527777777 121.58109090909056 23.635850694444443 121.58109090909056 36.36284722222222 121.58109090909056C 49.08984375 121.58109090909056 59.998697916666664 87.8085656565654 72.72569444444444 87.8085656565654C 85.45269097222223 87.8085656565654 96.36154513888889 87.8085656565654 109.08854166666667 87.8085656565654C 121.81553819444444 87.8085656565654 132.72439236111111 54.03604040404025 145.45138888888889 54.03604040404025C 158.17838541666666 54.03604040404025 169.08723958333334 54.03604040404025 181.81423611111111 54.03604040404025C 194.54123263888889 54.03604040404025 205.45008680555557 87.8085656565654 218.17708333333334 87.8085656565654C 230.90407986111111 87.8085656565654 241.8129340277778 87.8085656565654 254.53993055555557 87.8085656565654C 267.2669270833333 87.8085656565654 278.17578125 54.03604040404025 290.90277777777777 54.03604040404025C 303.62977430555554 54.03604040404025 314.53862847222223 54.03604040404025 327.265625 54.03604040404025C 339.99262152777777 54.03604040404025 350.90147569444446 87.8085656565654 363.62847222222223 87.8085656565654C 376.35546875 87.8085656565654 387.2643229166667 87.8085656565654 399.99131944444446 87.8085656565654C 412.71831597222223 87.8085656565654 423.6271701388889 121.58109090909056 436.3541666666667 121.58109090909056C 449.08116319444446 121.58109090909056 459.99001736111114 121.58109090909056 472.7170138888889 121.58109090909056C 485.4440104166667 121.58109090909056 496.35286458333337 87.8085656565654 509.07986111111114 87.8085656565654C 521.8068576388889 87.8085656565654 532.7157118055555 87.8085656565654 545.4427083333334 87.8085656565654C 558.1697048611111 87.8085656565654 569.0785590277778 54.03604040404025 581.8055555555555 54.03604040404025C 594.5325520833334 54.03604040404025 605.44140625 54.03604040404025 618.1684027777778 54.03604040404025C 630.8953993055555 54.03604040404025 641.8042534722223 87.8085656565654 654.53125 87.8085656565654"
												pathFrom="M 0 2451.885333333335 L 0 2451.885333333335 L 36.36284722222222 2451.885333333335 L 72.72569444444444 2451.885333333335 L 109.08854166666667 2451.885333333335 L 145.45138888888889 2451.885333333335 L 181.81423611111111 2451.885333333335 L 218.17708333333334 2451.885333333335 L 254.53993055555557 2451.885333333335 L 290.90277777777777 2451.885333333335 L 327.265625 2451.885333333335 L 363.62847222222223 2451.885333333335 L 399.99131944444446 2451.885333333335 L 436.3541666666667 2451.885333333335 L 472.7170138888889 2451.885333333335 L 509.07986111111114 2451.885333333335 L 545.4427083333334 2451.885333333335 L 581.8055555555555 2451.885333333335 L 618.1684027777778 2451.885333333335 L 654.53125 2451.885333333335"
												fill-rule="evenodd"></path>
												<g id="SvgjsG1135"
												class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown"
												data:realIndex="0">
												<g class="apexcharts-series-markers">
												<path id="SvgjsPath1245"
												d="M 0, 0 
	           m -0, 0 
	           a 0,0 0 1,0 0,0 
	           a 0,0 0 1,0 -0,0"
												fill="#4fc9da" fill-opacity="1" stroke="#4fc9da"
												stroke-opacity="0.9" stroke-linecap="butt" stroke-width="3"
												stroke-dasharray="0" cx="0" cy="0" shape="circle"
												class="apexcharts-marker wxvmg2j7qf no-pointer-events"
												default-marker-size="0"></path></g></g></g>
												<g id="SvgjsG1136" class="apexcharts-datalabels"
												data:realIndex="0"></g></g>
												<line id="SvgjsLine1157" x1="0" y1="0" x2="0"
												y2="222.89866666666666" stroke="#4fc9da" stroke-dasharray="3"
												stroke-linecap="butt" class="apexcharts-xcrosshairs" x="0"
												y="0" width="1" height="222.89866666666666" fill="#b1b9c4"
												filter="none" fill-opacity="0.9" stroke-width="1"></line>
												<line id="SvgjsLine1158" x1="0" y1="0" x2="654.53125" y2="0"
												stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1"
												stroke-linecap="butt" class="apexcharts-ycrosshairs"></line>
												<line id="SvgjsLine1159" x1="0" y1="0" x2="654.53125" y2="0"
												stroke-dasharray="0" stroke-width="0" stroke-linecap="butt"
												class="apexcharts-ycrosshairs-hidden"></line>
												<g id="SvgjsG1160" class="apexcharts-xaxis"
												transform="translate(0, 0)">
												<g id="SvgjsG1161" class="apexcharts-xaxis-texts-g"
												transform="translate(0, -10)">
												<text id="SvgjsText1163" font-family="inherit" x="0"
												y="244.89866666666666" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1164"></tspan>
												<title></title></text>
												<text id="SvgjsText1166" font-family="inherit"
												x="36.362847222222214" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1167"></tspan>
												<title></title></text>
												<text id="SvgjsText1169" font-family="inherit"
												x="72.72569444444443" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1170"></tspan>
												<title></title></text>
												<text id="SvgjsText1172" font-family="inherit"
												x="109.08854166666666" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;"
												transform="rotate(0 110.08854675292969 239.56533813476562)">
												<tspan id="SvgjsTspan1173">Apr 04</tspan>
												<title>Apr 04</title></text>
												<text id="SvgjsText1175" font-family="inherit"
												x="145.45138888888889" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1176"></tspan>
												<title></title></text>
												<text id="SvgjsText1178" font-family="inherit"
												x="181.81423611111111" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1179"></tspan>
												<title></title></text>
												<text id="SvgjsText1181" font-family="inherit"
												x="218.17708333333334" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;"
												transform="rotate(0 219.17709350585938 239.56533813476562)">
												<tspan id="SvgjsTspan1182">Apr 07</tspan>
												<title>Apr 07</title></text>
												<text id="SvgjsText1184" font-family="inherit"
												x="254.53993055555557" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1185"></tspan>
												<title></title></text>
												<text id="SvgjsText1187" font-family="inherit"
												x="290.9027777777778" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1188"></tspan>
												<title></title></text>
												<text id="SvgjsText1190" font-family="inherit"
												x="327.26562500000006" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;"
												transform="rotate(0 328.26564598083496 239.56533813476562)">
												<tspan id="SvgjsTspan1191">Apr 10</tspan>
												<title>Apr 10</title></text>
												<text id="SvgjsText1193" font-family="inherit"
												x="363.6284722222223" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1194"></tspan>
												<title></title></text>
												<text id="SvgjsText1196" font-family="inherit"
												x="399.9913194444445" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1197"></tspan>
												<title></title></text>
												<text id="SvgjsText1199" font-family="inherit"
												x="436.35416666666674" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;"
												transform="rotate(0 437.35418701171875 239.56533813476562)">
												<tspan id="SvgjsTspan1200">Apr 13</tspan>
												<title>Apr 13</title></text>
												<text id="SvgjsText1202" font-family="inherit"
												x="472.71701388888897" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1203"></tspan>
												<title></title></text>
												<text id="SvgjsText1205" font-family="inherit"
												x="509.0798611111112" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1206"></tspan>
												<title></title></text>
												<text id="SvgjsText1208" font-family="inherit"
												x="545.4427083333334" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;"
												transform="rotate(0 546.4427299499512 239.56533813476562)">
												<tspan id="SvgjsTspan1209">Apr 18</tspan>
												<title>Apr 18</title></text>
												<text id="SvgjsText1211" font-family="inherit"
												x="581.8055555555555" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1212"></tspan>
												<title></title></text>
												<text id="SvgjsText1214" font-family="inherit"
												x="618.1684027777777" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1215"></tspan>
												<title></title></text>
												<text id="SvgjsText1217" font-family="inherit"
												x="654.5312499999999" y="244.89866666666666"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;" transform="rotate(0 1 -1)">
												<tspan id="SvgjsTspan1218"></tspan>
												<title></title></text></g></g>
												<g id="SvgjsG1242"
												class="apexcharts-yaxis-annotations apexcharts-hidden-element-shown"></g>
												<g id="SvgjsG1243"
												class="apexcharts-xaxis-annotations apexcharts-hidden-element-shown"></g>
												<g id="SvgjsG1244"
												class="apexcharts-point-annotations apexcharts-hidden-element-shown"></g>
												<rect id="SvgjsRect1246" width="0" height="0" x="0" y="0"
												rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fefefe"
												class="apexcharts-zoom-rect"></rect>
												<rect id="SvgjsRect1247" width="0" height="0" x="0" y="0"
												rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fefefe"
												class="apexcharts-selection-rect"></rect></g></svg>
										<div class="apexcharts-tooltip apexcharts-theme-light">
											<div class="apexcharts-tooltip-title"
												style="font-family: inherit; font-size: 12px;"></div>
											<div class="apexcharts-tooltip-series-group" style="order: 1;">
												<span class="apexcharts-tooltip-marker"
													style="background-color: rgb(79, 201, 218);"></span>
												<div class="apexcharts-tooltip-text"
													style="font-family: inherit; font-size: 12px;">
													<div class="apexcharts-tooltip-y-group">
														<span class="apexcharts-tooltip-text-y-label"></span><span
															class="apexcharts-tooltip-text-y-value"></span>
													</div>
													<div class="apexcharts-tooltip-goals-group">
														<span class="apexcharts-tooltip-text-goals-label"></span><span
															class="apexcharts-tooltip-text-goals-value"></span>
													</div>
													<div class="apexcharts-tooltip-z-group">
														<span class="apexcharts-tooltip-text-z-label"></span><span
															class="apexcharts-tooltip-text-z-value"></span>
													</div>
												</div>
											</div>
										</div>
										<div
											class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light">
											<div class="apexcharts-xaxistooltip-text"
												style="font-family: inherit; font-size: 12px;"></div>
										</div>
										<div
											class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
											<div class="apexcharts-yaxistooltip-text"></div>
										</div>
									</div>
								</div>
								<!--end::Chart-->
							</div>
							<!--end::Card body-->
						</div>
						<!--end::Chart widget 4-->
					</div>
					<!--end::Col-->
				</div>
				<!--end::Row-->
	
	
	
				<!--begin::Row-->
				<div class="row gy-5 g-xl-10">
					<!--begin::Col-->
					<div class="col-xl-4 mb-xl-10">
	
						<!--begin::List widget 5-->
						<div class="card card-flush h-xl-100">
							<!--begin::Header-->
							<div class="card-header pt-7">
								<!--begin::Title-->
								<h3 class="card-title align-items-start flex-column">
									<span class="card-label fw-bold text-gray-900">Product
										Delivery</span> <span class="text-gray-500 mt-1 fw-semibold fs-6">1M
										Products Shipped so far</span>
								</h3>
								<!--end::Title-->
	
								<!--begin::Toolbar-->
								<div class="card-toolbar">
									<a href="/good/apps/ecommerce/sales/details.html"
										class="btn btn-sm btn-light">Order Details</a>
								</div>
								<!--end::Toolbar-->
							</div>
							<!--end::Header-->
	
							<!--begin::Body-->
							<div class="card-body">
								<!--begin::Scroll-->
								<div class="hover-scroll-overlay-y pe-6 me-n6"
									style="height: 415px">
									<!--begin::Item-->
									<div
										class="border border-dashed border-gray-300 rounded px-7 py-3 mb-6">
										<!--begin::Info-->
										<div class="d-flex flex-stack mb-3">
											<!--begin::Wrapper-->
											<div class="me-3">
												<!--begin::Icon-->
												<img src="/good/assets/media/stock/ecommerce/210.png"
													class="w-50px ms-n1 me-1" alt="">
												<!--end::Icon-->
	
												<!--begin::Title-->
												<a href="/good/apps/ecommerce/catalog/edit-product.html"
													class="text-gray-800 text-hover-primary fw-bold">Elephant
													1802</a>
												<!--end::Title-->
											</div>
											<!--end::Wrapper-->
	
											<!--begin::Action-->
											<div class="m-0">
												<!--begin::Menu-->
												<button
													class="btn btn-icon btn-color-gray-500 btn-active-color-primary justify-content-end"
													data-kt-menu-trigger="click"
													data-kt-menu-placement="bottom-end"
													data-kt-menu-overflow="true">
	
													<i class="ki-duotone ki-dots-square fs-1"><span
														class="path1"></span><span class="path2"></span><span
														class="path3"></span><span class="path4"></span></i>
												</button>
	
												<!--begin::Menu 2-->
												<div
													class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-semibold w-200px"
													data-kt-menu="true">
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<div
															class="menu-content fs-6 text-gray-900 fw-bold px-3 py-4">Quick
															Actions</div>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu separator-->
													<div class="separator mb-3 opacity-75"></div>
													<!--end::Menu separator-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Ticket </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Customer </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3" data-kt-menu-trigger="hover"
														data-kt-menu-placement="right-start">
														<!--begin::Menu item-->
														<a href="#" class="menu-link px-3"> <span
															class="menu-title">New Group</span> <span
															class="menu-arrow"></span>
														</a>
														<!--end::Menu item-->
	
														<!--begin::Menu sub-->
														<div class="menu-sub menu-sub-dropdown w-175px py-4">
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Admin Group </a>
															</div>
															<!--end::Menu item-->
	
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Staff Group </a>
															</div>
															<!--end::Menu item-->
	
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Member Group </a>
															</div>
															<!--end::Menu item-->
														</div>
														<!--end::Menu sub-->
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Contact </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu separator-->
													<div class="separator mt-3 opacity-75"></div>
													<!--end::Menu separator-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<div class="menu-content px-3 py-3">
															<a class="btn btn-primary  btn-sm px-4" href="#">
																Generate Reports </a>
														</div>
													</div>
													<!--end::Menu item-->
												</div>
												<!--end::Menu 2-->
	
												<!--end::Menu-->
											</div>
											<!--end::Action-->
										</div>
										<!--end::Info-->
	
										<!--begin::Customer-->
										<div class="d-flex flex-stack">
											<!--begin::Name-->
											<span class="text-gray-500 fw-bold">To: <a
												href="/good/apps/ecommerce/sales/details.html"
												class="text-gray-800 text-hover-primary fw-bold"> Jason
													Bourne </a>
											</span>
											<!--end::Name-->
	
											<!--begin::Label-->
											<span class="badge badge-light-success">Delivered</span>
											<!--end::Label-->
										</div>
										<!--end::Customer-->
									</div>
									<!--end::Item-->
									<!--begin::Item-->
									<div
										class="border border-dashed border-gray-300 rounded px-7 py-3 mb-6">
										<!--begin::Info-->
										<div class="d-flex flex-stack mb-3">
											<!--begin::Wrapper-->
											<div class="me-3">
												<!--begin::Icon-->
												<img src="/good/assets/media/stock/ecommerce/209.png"
													class="w-50px ms-n1 me-1" alt="">
												<!--end::Icon-->
	
												<!--begin::Title-->
												<a href="/good/apps/ecommerce/catalog/edit-product.html"
													class="text-gray-800 text-hover-primary fw-bold">RiseUP</a>
												<!--end::Title-->
											</div>
											<!--end::Wrapper-->
	
											<!--begin::Action-->
											<div class="m-0">
												<!--begin::Menu-->
												<button
													class="btn btn-icon btn-color-gray-500 btn-active-color-primary justify-content-end"
													data-kt-menu-trigger="click"
													data-kt-menu-placement="bottom-end"
													data-kt-menu-overflow="true">
	
													<i class="ki-duotone ki-dots-square fs-1"><span
														class="path1"></span><span class="path2"></span><span
														class="path3"></span><span class="path4"></span></i>
												</button>
	
												<!--begin::Menu 2-->
												<div
													class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-semibold w-200px"
													data-kt-menu="true">
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<div
															class="menu-content fs-6 text-gray-900 fw-bold px-3 py-4">Quick
															Actions</div>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu separator-->
													<div class="separator mb-3 opacity-75"></div>
													<!--end::Menu separator-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Ticket </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Customer </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3" data-kt-menu-trigger="hover"
														data-kt-menu-placement="right-start">
														<!--begin::Menu item-->
														<a href="#" class="menu-link px-3"> <span
															class="menu-title">New Group</span> <span
															class="menu-arrow"></span>
														</a>
														<!--end::Menu item-->
	
														<!--begin::Menu sub-->
														<div class="menu-sub menu-sub-dropdown w-175px py-4">
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Admin Group </a>
															</div>
															<!--end::Menu item-->
	
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Staff Group </a>
															</div>
															<!--end::Menu item-->
	
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Member Group </a>
															</div>
															<!--end::Menu item-->
														</div>
														<!--end::Menu sub-->
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Contact </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu separator-->
													<div class="separator mt-3 opacity-75"></div>
													<!--end::Menu separator-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<div class="menu-content px-3 py-3">
															<a class="btn btn-primary  btn-sm px-4" href="#">
																Generate Reports </a>
														</div>
													</div>
													<!--end::Menu item-->
												</div>
												<!--end::Menu 2-->
	
												<!--end::Menu-->
											</div>
											<!--end::Action-->
										</div>
										<!--end::Info-->
	
										<!--begin::Customer-->
										<div class="d-flex flex-stack">
											<!--begin::Name-->
											<span class="text-gray-500 fw-bold">To: <a
												href="/good/apps/ecommerce/sales/details.html"
												class="text-gray-800 text-hover-primary fw-bold"> Marie
													Durant </a>
											</span>
											<!--end::Name-->
	
											<!--begin::Label-->
											<span class="badge badge-light-primary">Shipping</span>
											<!--end::Label-->
										</div>
										<!--end::Customer-->
									</div>
									<!--end::Item-->
									<!--begin::Item-->
									<div
										class="border border-dashed border-gray-300 rounded px-7 py-3 mb-6">
										<!--begin::Info-->
										<div class="d-flex flex-stack mb-3">
											<!--begin::Wrapper-->
											<div class="me-3">
												<!--begin::Icon-->
												<img src="/good/assets/media/stock/ecommerce/214.png"
													class="w-50px ms-n1 me-1" alt="">
												<!--end::Icon-->
	
												<!--begin::Title-->
												<a href="/good/apps/ecommerce/catalog/edit-product.html"
													class="text-gray-800 text-hover-primary fw-bold">Yellow
													Stone</a>
												<!--end::Title-->
											</div>
											<!--end::Wrapper-->
	
											<!--begin::Action-->
											<div class="m-0">
												<!--begin::Menu-->
												<button
													class="btn btn-icon btn-color-gray-500 btn-active-color-primary justify-content-end"
													data-kt-menu-trigger="click"
													data-kt-menu-placement="bottom-end"
													data-kt-menu-overflow="true">
	
													<i class="ki-duotone ki-dots-square fs-1"><span
														class="path1"></span><span class="path2"></span><span
														class="path3"></span><span class="path4"></span></i>
												</button>
	
												<!--begin::Menu 2-->
												<div
													class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-semibold w-200px"
													data-kt-menu="true">
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<div
															class="menu-content fs-6 text-gray-900 fw-bold px-3 py-4">Quick
															Actions</div>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu separator-->
													<div class="separator mb-3 opacity-75"></div>
													<!--end::Menu separator-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Ticket </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Customer </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3" data-kt-menu-trigger="hover"
														data-kt-menu-placement="right-start">
														<!--begin::Menu item-->
														<a href="#" class="menu-link px-3"> <span
															class="menu-title">New Group</span> <span
															class="menu-arrow"></span>
														</a>
														<!--end::Menu item-->
	
														<!--begin::Menu sub-->
														<div class="menu-sub menu-sub-dropdown w-175px py-4">
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Admin Group </a>
															</div>
															<!--end::Menu item-->
	
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Staff Group </a>
															</div>
															<!--end::Menu item-->
	
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Member Group </a>
															</div>
															<!--end::Menu item-->
														</div>
														<!--end::Menu sub-->
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Contact </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu separator-->
													<div class="separator mt-3 opacity-75"></div>
													<!--end::Menu separator-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<div class="menu-content px-3 py-3">
															<a class="btn btn-primary  btn-sm px-4" href="#">
																Generate Reports </a>
														</div>
													</div>
													<!--end::Menu item-->
												</div>
												<!--end::Menu 2-->
	
												<!--end::Menu-->
											</div>
											<!--end::Action-->
										</div>
										<!--end::Info-->
	
										<!--begin::Customer-->
										<div class="d-flex flex-stack">
											<!--begin::Name-->
											<span class="text-gray-500 fw-bold">To: <a
												href="/good/apps/ecommerce/sales/details.html"
												class="text-gray-800 text-hover-primary fw-bold"> Dan
													Wilson </a>
											</span>
											<!--end::Name-->
	
											<!--begin::Label-->
											<span class="badge badge-light-danger">Confirmed</span>
											<!--end::Label-->
										</div>
										<!--end::Customer-->
									</div>
									<!--end::Item-->
									<!--begin::Item-->
									<div
										class="border border-dashed border-gray-300 rounded px-7 py-3 mb-6">
										<!--begin::Info-->
										<div class="d-flex flex-stack mb-3">
											<!--begin::Wrapper-->
											<div class="me-3">
												<!--begin::Icon-->
												<img src="/good/assets/media/stock/ecommerce/211.png"
													class="w-50px ms-n1 me-1" alt="">
												<!--end::Icon-->
	
												<!--begin::Title-->
												<a href="/good/apps/ecommerce/catalog/edit-product.html"
													class="text-gray-800 text-hover-primary fw-bold">Elephant
													1802</a>
												<!--end::Title-->
											</div>
											<!--end::Wrapper-->
	
											<!--begin::Action-->
											<div class="m-0">
												<!--begin::Menu-->
												<button
													class="btn btn-icon btn-color-gray-500 btn-active-color-primary justify-content-end"
													data-kt-menu-trigger="click"
													data-kt-menu-placement="bottom-end"
													data-kt-menu-overflow="true">
	
													<i class="ki-duotone ki-dots-square fs-1"><span
														class="path1"></span><span class="path2"></span><span
														class="path3"></span><span class="path4"></span></i>
												</button>
	
												<!--begin::Menu 2-->
												<div
													class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-semibold w-200px"
													data-kt-menu="true">
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<div
															class="menu-content fs-6 text-gray-900 fw-bold px-3 py-4">Quick
															Actions</div>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu separator-->
													<div class="separator mb-3 opacity-75"></div>
													<!--end::Menu separator-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Ticket </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Customer </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3" data-kt-menu-trigger="hover"
														data-kt-menu-placement="right-start">
														<!--begin::Menu item-->
														<a href="#" class="menu-link px-3"> <span
															class="menu-title">New Group</span> <span
															class="menu-arrow"></span>
														</a>
														<!--end::Menu item-->
	
														<!--begin::Menu sub-->
														<div class="menu-sub menu-sub-dropdown w-175px py-4">
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Admin Group </a>
															</div>
															<!--end::Menu item-->
	
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Staff Group </a>
															</div>
															<!--end::Menu item-->
	
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Member Group </a>
															</div>
															<!--end::Menu item-->
														</div>
														<!--end::Menu sub-->
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Contact </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu separator-->
													<div class="separator mt-3 opacity-75"></div>
													<!--end::Menu separator-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<div class="menu-content px-3 py-3">
															<a class="btn btn-primary  btn-sm px-4" href="#">
																Generate Reports </a>
														</div>
													</div>
													<!--end::Menu item-->
												</div>
												<!--end::Menu 2-->
	
												<!--end::Menu-->
											</div>
											<!--end::Action-->
										</div>
										<!--end::Info-->
	
										<!--begin::Customer-->
										<div class="d-flex flex-stack">
											<!--begin::Name-->
											<span class="text-gray-500 fw-bold">To: <a
												href="/good/apps/ecommerce/sales/details.html"
												class="text-gray-800 text-hover-primary fw-bold"> Lebron
													Wayde </a>
											</span>
											<!--end::Name-->
	
											<!--begin::Label-->
											<span class="badge badge-light-success">Delivered</span>
											<!--end::Label-->
										</div>
										<!--end::Customer-->
									</div>
									<!--end::Item-->
									<!--begin::Item-->
									<div
										class="border border-dashed border-gray-300 rounded px-7 py-3 mb-6">
										<!--begin::Info-->
										<div class="d-flex flex-stack mb-3">
											<!--begin::Wrapper-->
											<div class="me-3">
												<!--begin::Icon-->
												<img src="/good/assets/media/stock/ecommerce/215.png"
													class="w-50px ms-n1 me-1" alt="">
												<!--end::Icon-->
	
												<!--begin::Title-->
												<a href="/good/apps/ecommerce/catalog/edit-product.html"
													class="text-gray-800 text-hover-primary fw-bold">RiseUP</a>
												<!--end::Title-->
											</div>
											<!--end::Wrapper-->
	
											<!--begin::Action-->
											<div class="m-0">
												<!--begin::Menu-->
												<button
													class="btn btn-icon btn-color-gray-500 btn-active-color-primary justify-content-end"
													data-kt-menu-trigger="click"
													data-kt-menu-placement="bottom-end"
													data-kt-menu-overflow="true">
	
													<i class="ki-duotone ki-dots-square fs-1"><span
														class="path1"></span><span class="path2"></span><span
														class="path3"></span><span class="path4"></span></i>
												</button>
	
												<!--begin::Menu 2-->
												<div
													class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-semibold w-200px"
													data-kt-menu="true">
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<div
															class="menu-content fs-6 text-gray-900 fw-bold px-3 py-4">Quick
															Actions</div>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu separator-->
													<div class="separator mb-3 opacity-75"></div>
													<!--end::Menu separator-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Ticket </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Customer </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3" data-kt-menu-trigger="hover"
														data-kt-menu-placement="right-start">
														<!--begin::Menu item-->
														<a href="#" class="menu-link px-3"> <span
															class="menu-title">New Group</span> <span
															class="menu-arrow"></span>
														</a>
														<!--end::Menu item-->
	
														<!--begin::Menu sub-->
														<div class="menu-sub menu-sub-dropdown w-175px py-4">
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Admin Group </a>
															</div>
															<!--end::Menu item-->
	
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Staff Group </a>
															</div>
															<!--end::Menu item-->
	
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Member Group </a>
															</div>
															<!--end::Menu item-->
														</div>
														<!--end::Menu sub-->
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Contact </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu separator-->
													<div class="separator mt-3 opacity-75"></div>
													<!--end::Menu separator-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<div class="menu-content px-3 py-3">
															<a class="btn btn-primary  btn-sm px-4" href="#">
																Generate Reports </a>
														</div>
													</div>
													<!--end::Menu item-->
												</div>
												<!--end::Menu 2-->
	
												<!--end::Menu-->
											</div>
											<!--end::Action-->
										</div>
										<!--end::Info-->
	
										<!--begin::Customer-->
										<div class="d-flex flex-stack">
											<!--begin::Name-->
											<span class="text-gray-500 fw-bold">To: <a
												href="/good/apps/ecommerce/sales/details.html"
												class="text-gray-800 text-hover-primary fw-bold"> Ana
													Simmons </a>
											</span>
											<!--end::Name-->
	
											<!--begin::Label-->
											<span class="badge badge-light-primary">Shipping</span>
											<!--end::Label-->
										</div>
										<!--end::Customer-->
									</div>
									<!--end::Item-->
									<!--begin::Item-->
									<div
										class="border border-dashed border-gray-300 rounded px-7 py-3 ">
										<!--begin::Info-->
										<div class="d-flex flex-stack mb-3">
											<!--begin::Wrapper-->
											<div class="me-3">
												<!--begin::Icon-->
												<img src="/good/assets/media/stock/ecommerce/192.png"
													class="w-50px ms-n1 me-1" alt="">
												<!--end::Icon-->
	
												<!--begin::Title-->
												<a href="/good/apps/ecommerce/catalog/edit-product.html"
													class="text-gray-800 text-hover-primary fw-bold">Yellow
													Stone</a>
												<!--end::Title-->
											</div>
											<!--end::Wrapper-->
	
											<!--begin::Action-->
											<div class="m-0">
												<!--begin::Menu-->
												<button
													class="btn btn-icon btn-color-gray-500 btn-active-color-primary justify-content-end"
													data-kt-menu-trigger="click"
													data-kt-menu-placement="bottom-end"
													data-kt-menu-overflow="true">
	
													<i class="ki-duotone ki-dots-square fs-1"><span
														class="path1"></span><span class="path2"></span><span
														class="path3"></span><span class="path4"></span></i>
												</button>
	
												<!--begin::Menu 2-->
												<div
													class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-semibold w-200px"
													data-kt-menu="true">
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<div
															class="menu-content fs-6 text-gray-900 fw-bold px-3 py-4">Quick
															Actions</div>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu separator-->
													<div class="separator mb-3 opacity-75"></div>
													<!--end::Menu separator-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Ticket </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Customer </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3" data-kt-menu-trigger="hover"
														data-kt-menu-placement="right-start">
														<!--begin::Menu item-->
														<a href="#" class="menu-link px-3"> <span
															class="menu-title">New Group</span> <span
															class="menu-arrow"></span>
														</a>
														<!--end::Menu item-->
	
														<!--begin::Menu sub-->
														<div class="menu-sub menu-sub-dropdown w-175px py-4">
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Admin Group </a>
															</div>
															<!--end::Menu item-->
	
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Staff Group </a>
															</div>
															<!--end::Menu item-->
	
															<!--begin::Menu item-->
															<div class="menu-item px-3">
																<a href="#" class="menu-link px-3"> Member Group </a>
															</div>
															<!--end::Menu item-->
														</div>
														<!--end::Menu sub-->
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<a href="#" class="menu-link px-3"> New Contact </a>
													</div>
													<!--end::Menu item-->
	
													<!--begin::Menu separator-->
													<div class="separator mt-3 opacity-75"></div>
													<!--end::Menu separator-->
	
													<!--begin::Menu item-->
													<div class="menu-item px-3">
														<div class="menu-content px-3 py-3">
															<a class="btn btn-primary  btn-sm px-4" href="#">
																Generate Reports </a>
														</div>
													</div>
													<!--end::Menu item-->
												</div>
												<!--end::Menu 2-->
	
												<!--end::Menu-->
											</div>
											<!--end::Action-->
										</div>
										<!--end::Info-->
	
										<!--begin::Customer-->
										<div class="d-flex flex-stack">
											<!--begin::Name-->
											<span class="text-gray-500 fw-bold">To: <a
												href="/good/apps/ecommerce/sales/details.html"
												class="text-gray-800 text-hover-primary fw-bold"> Kevin
													Leonard </a>
											</span>
											<!--end::Name-->
	
											<!--begin::Label-->
											<span class="badge badge-light-danger">Confirmed</span>
											<!--end::Label-->
										</div>
										<!--end::Customer-->
									</div>
									<!--end::Item-->
								</div>
								<!--end::Scroll-->
							</div>
							<!--end::Body-->
						</div>
						<!--end::List widget 5-->
					</div>
					<!--end::Col-->
	
					<!--begin::Col-->
					<div class="col-xl-8 mb-xl-10">
	
						<!--begin::Table Widget 5-->
						<div class="card card-flush h-xl-100">
							<!--begin::Card header-->
							<div class="card-header pt-7">
								<!--begin::Title-->
								<h3 class="card-title align-items-start flex-column">
									<span class="card-label fw-bold text-gray-900">Stock
										Report</span> <span class="text-gray-500 mt-1 fw-semibold fs-6">Total
										2,356 Items in the Stock</span>
								</h3>
								<!--end::Title-->
	
								<!--begin::Actions-->
								<div class="card-toolbar">
									<!--begin::Filters-->
									<div class="d-flex flex-stack flex-wrap gap-4">
										<!--begin::Destination-->
										<div class="d-flex align-items-center fw-bold">
											<!--begin::Label-->
											<div class="text-muted fs-7 me-2">Cateogry</div>
											<!--end::Label-->
	
											<!--begin::Select-->
											<select
												class="form-select form-select-transparent text-gray-900 fs-7 lh-1 fw-bold py-0 ps-3 w-auto select2-hidden-accessible"
												data-control="select2" data-hide-search="true"
												data-dropdown-css-class="w-150px"
												data-placeholder="Select an option"
												data-select2-id="select2-data-16-7dah" tabindex="-1"
												aria-hidden="true" data-kt-initialized="1">
												<option></option>
												<option value="Show All" selected=""
													data-select2-id="select2-data-18-aysg">Show All</option>
												<option value="a">Category A</option>
												<option value="b">Category B</option>
											</select><span
												class="select2 select2-container select2-container--bootstrap5"
												dir="ltr" data-select2-id="select2-data-17-cw94"
												style="width: 100%;"><span class="selection"><span
													class="select2-selection select2-selection--single form-select form-select-transparent text-gray-900 fs-7 lh-1 fw-bold py-0 ps-3 w-auto"
													role="combobox" aria-haspopup="true" aria-expanded="false"
													tabindex="0" aria-disabled="false"
													aria-labelledby="select2-yfay-container"
													aria-controls="select2-yfay-container"><span
														class="select2-selection__rendered"
														id="select2-yfay-container" role="textbox"
														aria-readonly="true" title="Show All">Show All</span><span
														class="select2-selection__arrow" role="presentation"><b
															role="presentation"></b></span></span></span><span class="dropdown-wrapper"
												aria-hidden="true"></span></span>
											<!--end::Select-->
										</div>
										<!--end::Destination-->
	
										<!--begin::Status-->
										<div class="d-flex align-items-center fw-bold">
											<!--begin::Label-->
											<div class="text-muted fs-7 me-2">Status</div>
											<!--end::Label-->
	
											<!--begin::Select-->
											<select
												class="form-select form-select-transparent text-gray-900 fs-7 lh-1 fw-bold py-0 ps-3 w-auto select2-hidden-accessible"
												data-control="select2" data-hide-search="true"
												data-dropdown-css-class="w-150px"
												data-placeholder="Select an option"
												data-kt-table-widget-5="filter_status"
												data-select2-id="select2-data-19-ud50" tabindex="-1"
												aria-hidden="true" data-kt-initialized="1">
												<option></option>
												<option value="Show All" selected=""
													data-select2-id="select2-data-21-nb75">Show All</option>
												<option value="In Stock">In Stock</option>
												<option value="Out of Stock">Out of Stock</option>
												<option value="Low Stock">Low Stock</option>
											</select><span
												class="select2 select2-container select2-container--bootstrap5"
												dir="ltr" data-select2-id="select2-data-20-57i8"
												style="width: 100%;"><span class="selection"><span
													class="select2-selection select2-selection--single form-select form-select-transparent text-gray-900 fs-7 lh-1 fw-bold py-0 ps-3 w-auto"
													role="combobox" aria-haspopup="true" aria-expanded="false"
													tabindex="0" aria-disabled="false"
													aria-labelledby="select2-c04q-container"
													aria-controls="select2-c04q-container"><span
														class="select2-selection__rendered"
														id="select2-c04q-container" role="textbox"
														aria-readonly="true" title="Show All">Show All</span><span
														class="select2-selection__arrow" role="presentation"><b
															role="presentation"></b></span></span></span><span class="dropdown-wrapper"
												aria-hidden="true"></span></span>
											<!--end::Select-->
										</div>
										<!--end::Status-->
	
										<!--begin::Search-->
										<a href="/good/apps/ecommerce/catalog/products.html"
											class="btn btn-light btn-sm">View Stock</a>
										<!--end::Search-->
									</div>
									<!--begin::Filters-->
								</div>
								<!--end::Actions-->
							</div>
							<!--end::Card header-->
	
							<!--begin::Card body-->
							<div class="card-body">
								<!--begin::Table-->
								<div id="kt_table_widget_5_table_wrapper"
									class="dt-container dt-bootstrap5 dt-empty-footer">
									<div id="" class="table-responsive">
										<table
											class="table align-middle table-row-dashed fs-6 gy-3 dataTable"
											id="kt_table_widget_5_table" style="width: 100%;">
											<colgroup>
												<col data-dt-column="0" style="width: 206.969px;">
												<col data-dt-column="1" style="width: 137.979px;">
												<col data-dt-column="2" style="width: 206.969px;">
												<col data-dt-column="3" style="width: 137.979px;">
												<col data-dt-column="4" style="width: 164.823px;">
												<col data-dt-column="5" style="width: 103.5px;">
											</colgroup>
											<!--begin::Table head-->
											<thead>
												<!--begin::Table row-->
												<tr
													class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0"
													role="row">
													<th class="min-w-150px dt-orderable-asc dt-orderable-desc"
														data-dt-column="0" rowspan="1" colspan="1"
														aria-label="Item: Activate to sort" tabindex="0"><span
														class="dt-column-title" role="button">Item</span><span
														class="dt-column-order"></span></th>
													<th class="text-end pe-3 min-w-100px dt-orderable-none"
														data-dt-column="1" rowspan="1" colspan="1"
														aria-label="Product ID"><span class="dt-column-title">Product
															ID</span><span class="dt-column-order"></span></th>
													<th
														class="text-end pe-3 min-w-150px dt-orderable-asc dt-orderable-desc"
														data-dt-column="2" rowspan="1" colspan="1"
														aria-label="Date Added: Activate to sort" tabindex="0"><span
														class="dt-column-title" role="button">Date Added</span><span
														class="dt-column-order"></span></th>
													<th
														class="text-end pe-3 min-w-100px dt-type-numeric dt-orderable-asc dt-orderable-desc"
														data-dt-column="3" rowspan="1" colspan="1"
														aria-label="Price: Activate to sort" tabindex="0"><span
														class="dt-column-title" role="button">Price</span><span
														class="dt-column-order"></span></th>
													<th
														class="text-end pe-3 min-w-100px dt-orderable-asc dt-orderable-desc"
														data-dt-column="4" rowspan="1" colspan="1"
														aria-label="Status: Activate to sort" tabindex="0"><span
														class="dt-column-title" role="button">Status</span><span
														class="dt-column-order"></span></th>
													<th
														class="text-end pe-0 min-w-75px dt-type-numeric dt-orderable-asc dt-orderable-desc"
														data-dt-column="5" rowspan="1" colspan="1"
														aria-label="Qty: Activate to sort" tabindex="0"><span
														class="dt-column-title" role="button">Qty</span><span
														class="dt-column-order"></span></th>
												</tr>
												<!--end::Table row-->
											</thead>
											<!--end::Table head-->
	
											<!--begin::Table body-->
											<tbody class="fw-bold text-gray-600">
												<tr>
													<!--begin::Item-->
													<td><a
														href="/good/apps/ecommerce/catalog/edit-product.html"
														class="text-gray-900 text-hover-primary">Macbook Air M1</a></td>
													<!--end::Item-->
	
													<!--begin::Product ID-->
													<td class="text-end">#XGY-356</td>
													<!--end::Product ID-->
	
													<!--begin::Date added-->
													<td class="text-end" data-order="Invalid date">02 Apr,
														2024</td>
													<!--end::Date added-->
	
													<!--begin::Price-->
													<td class="text-end dt-type-numeric">$1,230</td>
													<!--end::Price-->
	
													<!--begin::Status-->
													<td class="text-end"><span
														class="badge py-3 px-4 fs-7 badge-light-primary">In
															Stock</span></td>
													<!--end::Status-->
	
													<!--begin::Qty-->
													<td class="text-end dt-type-numeric" data-order="58"><span
														class="text-gray-900 fw-bold">58 PCS</span></td>
													<!--end::Qty-->
												</tr>
												<tr>
													<!--begin::Item-->
													<td><a
														href="/good/apps/ecommerce/catalog/edit-product.html"
														class="text-gray-900 text-hover-primary">Surface Laptop
															4</a></td>
													<!--end::Item-->
	
													<!--begin::Product ID-->
													<td class="text-end">#YHD-047</td>
													<!--end::Product ID-->
	
													<!--begin::Date added-->
													<td class="text-end" data-order="Invalid date">01 Apr,
														2024</td>
													<!--end::Date added-->
	
													<!--begin::Price-->
													<td class="text-end dt-type-numeric">$1,060</td>
													<!--end::Price-->
	
													<!--begin::Status-->
													<td class="text-end"><span
														class="badge py-3 px-4 fs-7 badge-light-danger">Out
															of Stock</span></td>
													<!--end::Status-->
	
													<!--begin::Qty-->
													<td class="text-end dt-type-numeric" data-order="0"><span
														class="text-gray-900 fw-bold">0 PCS</span></td>
													<!--end::Qty-->
												</tr>
												<tr>
													<!--begin::Item-->
													<td><a
														href="/good/apps/ecommerce/catalog/edit-product.html"
														class="text-gray-900 text-hover-primary">Logitech MX
															250</a></td>
													<!--end::Item-->
	
													<!--begin::Product ID-->
													<td class="text-end">#SRR-678</td>
													<!--end::Product ID-->
	
													<!--begin::Date added-->
													<td class="text-end" data-order="Invalid date">24 Mar,
														2024</td>
													<!--end::Date added-->
	
													<!--begin::Price-->
													<td class="text-end dt-type-numeric">$64</td>
													<!--end::Price-->
	
													<!--begin::Status-->
													<td class="text-end"><span
														class="badge py-3 px-4 fs-7 badge-light-primary">In
															Stock</span></td>
													<!--end::Status-->
	
													<!--begin::Qty-->
													<td class="text-end dt-type-numeric" data-order="290">
														<span class="text-gray-900 fw-bold">290 PCS</span>
													</td>
													<!--end::Qty-->
												</tr>
												<tr>
													<!--begin::Item-->
													<td><a
														href="/good/apps/ecommerce/catalog/edit-product.html"
														class="text-gray-900 text-hover-primary">AudioEngine
															HD3</a></td>
													<!--end::Item-->
	
													<!--begin::Product ID-->
													<td class="text-end">#PXF-578</td>
													<!--end::Product ID-->
	
													<!--begin::Date added-->
													<td class="text-end" data-order="Invalid date">24 Mar,
														2024</td>
													<!--end::Date added-->
	
													<!--begin::Price-->
													<td class="text-end dt-type-numeric">$1,060</td>
													<!--end::Price-->
	
													<!--begin::Status-->
													<td class="text-end"><span
														class="badge py-3 px-4 fs-7 badge-light-danger">Out
															of Stock</span></td>
													<!--end::Status-->
	
													<!--begin::Qty-->
													<td class="text-end dt-type-numeric" data-order="46"><span
														class="text-gray-900 fw-bold">46 PCS</span></td>
													<!--end::Qty-->
												</tr>
												<tr>
													<!--begin::Item-->
													<td><a
														href="/good/apps/ecommerce/catalog/edit-product.html"
														class="text-gray-900 text-hover-primary">HP Hyper LTR</a></td>
													<!--end::Item-->
	
													<!--begin::Product ID-->
													<td class="text-end">#PXF-778</td>
													<!--end::Product ID-->
	
													<!--begin::Date added-->
													<td class="text-end" data-order="Invalid date">16 Jan,
														2024</td>
													<!--end::Date added-->
	
													<!--begin::Price-->
													<td class="text-end dt-type-numeric">$4500</td>
													<!--end::Price-->
	
													<!--begin::Status-->
													<td class="text-end"><span
														class="badge py-3 px-4 fs-7 badge-light-primary">In
															Stock</span></td>
													<!--end::Status-->
	
													<!--begin::Qty-->
													<td class="text-end dt-type-numeric" data-order="78"><span
														class="text-gray-900 fw-bold">78 PCS</span></td>
													<!--end::Qty-->
												</tr>
												<tr>
													<!--begin::Item-->
													<td><a
														href="/good/apps/ecommerce/catalog/edit-product.html"
														class="text-gray-900 text-hover-primary">Dell 32
															UltraSharp</a></td>
													<!--end::Item-->
	
													<!--begin::Product ID-->
													<td class="text-end">#XGY-356</td>
													<!--end::Product ID-->
	
													<!--begin::Date added-->
													<td class="text-end" data-order="Invalid date">22 Dec,
														2024</td>
													<!--end::Date added-->
	
													<!--begin::Price-->
													<td class="text-end dt-type-numeric">$1,060</td>
													<!--end::Price-->
	
													<!--begin::Status-->
													<td class="text-end"><span
														class="badge py-3 px-4 fs-7 badge-light-warning">Low
															Stock</span></td>
													<!--end::Status-->
	
													<!--begin::Qty-->
													<td class="text-end dt-type-numeric" data-order="8"><span
														class="text-gray-900 fw-bold">8 PCS</span></td>
													<!--end::Qty-->
												</tr>
												<tr>
													<!--begin::Item-->
													<td><a
														href="/good/apps/ecommerce/catalog/edit-product.html"
														class="text-gray-900 text-hover-primary">Google Pixel 6
															Pro</a></td>
													<!--end::Item-->
	
													<!--begin::Product ID-->
													<td class="text-end">#XVR-425</td>
													<!--end::Product ID-->
	
													<!--begin::Date added-->
													<td class="text-end" data-order="Invalid date">27 Dec,
														2024</td>
													<!--end::Date added-->
	
													<!--begin::Price-->
													<td class="text-end dt-type-numeric">$1,060</td>
													<!--end::Price-->
	
													<!--begin::Status-->
													<td class="text-end"><span
														class="badge py-3 px-4 fs-7 badge-light-primary">In
															Stock</span></td>
													<!--end::Status-->
	
													<!--begin::Qty-->
													<td class="text-end dt-type-numeric" data-order="124">
														<span class="text-gray-900 fw-bold">124 PCS</span>
													</td>
													<!--end::Qty-->
												</tr>
											</tbody>
											<!--end::Table body-->
											<tfoot></tfoot>
										</table>
									</div>
									<div id="" class="row">
										<div id=""
											class="col-sm-12 col-md-5 d-flex align-items-center justify-content-center justify-content-md-start dt-toolbar"></div>
										<div id=""
											class="col-sm-12 col-md-7 d-flex align-items-center justify-content-center justify-content-md-end"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	
	
				<div class="row gy-5 g-xl-10">
	
					<!-- OO 위젯 카드 시작 -->
					<div class="col-xl-4 h-xl-100">
						<div class="card card-flush h-md-50 mb-5 mb-xl-10">
							<div class="card-header pt-7">
								<div class="card-title">
									<h2>그루베어</h2>
								</div>
							</div>
							<div class="card-body pt-0">
								<!-- 여기에 추가 하면 됨 -->
							</div>
						</div>
					</div>
					<!-- OO 위젯 카드 끝 -->
	
					<!-- OO 위젯 카드 시작 -->
					<div class="col-xl-4 h-xl-100">
						<div class="card card-flush h-md-50 mb-5 mb-xl-10">
							<div class="card-header pt-7">
								<div class="card-title">
									<h2>결제 위치!!!!!!!!!!</h2>
								</div>
							</div>
							<div class="card-body pt-0">
								<!-- 여기에 추가 하면 됨 -->
							</div>
						</div>
					</div>
					<!-- OO 위젯 카드 끝 -->
	
					<!-- OO 위젯 카드 시작 -->
					<div class="col-xl-4 h-xl-100">
						<div class="card card-flush h-md-50 mb-5 mb-xl-10">
							<div class="card-header pt-7">
								<div class="card-title">
									<h2>그루베어</h2>
								</div>
							</div>
							<div class="card-body pt-0">
								<!-- 여기에 추가 하면 됨 -->
							</div>
						</div>
					</div>
					<!-- OO 위젯 카드 끝 -->
	
				</div>
	
	
	
				<div class="row gy-5 g-xl-10">
	
					<!-- OO 위젯 카드 시작 -->
					<div class="col-xl-6 h-xl-100">
						<div class="card card-flush h-md-50 mb-5 mb-xl-10">
							<div class="card-header pt-7">
								<div class="card-title">
									<h2>게시판</h2>
								</div>
							</div>
							<div class="card-body pt-0">
								<div class="d-flex flex-column gap-10">
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr class="fw-bold fs-6 text-gray-800">
													<th>계약일자</th>
													<th>기업명</th>
													<th>사업자번호</th>
													<th>기업자대표명</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Tiger Nixon</td>
													<td>System Architect</td>
													<td>Edinburgh</td>
													<td>$320,800</td>
												</tr>
												<tr>
													<td>Garrett Winters</td>
													<td>Accountant</td>
													<td>Tokyo</td>
													<td>$170,750</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- OO 위젯 카드 끝 -->
	
					<!-- OO 위젯 카드 시작 -->
					<div class="col-xl-6 h-xl-100">
						<div class="card card-flush h-md-50 mb-5 mb-xl-10">
							<div class="card-header pt-7">
								<div class="card-title">
									<h2>게시판</h2>
								</div>
							</div>
							<div class="card-body pt-0">
								<div class="d-flex flex-column gap-10">
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr class="fw-bold fs-6 text-gray-800">
													<th>계약일자</th>
													<th>기업명</th>
													<th>사업자번호</th>
													<th>기업자대표명</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Tiger Nixon</td>
													<td>System Architect</td>
													<td>Edinburgh</td>
													<td>$320,800</td>
												</tr>
												<tr>
													<td>Garrett Winters</td>
													<td>Accountant</td>
													<td>Tokyo</td>
													<td>$170,750</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- OO 위젯 카드 끝 -->
	
				</div>
	
	
	
				<!-- 이 안부터 row넣기 끝 -->

			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(function() {

	});
</script>