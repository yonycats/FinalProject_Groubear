<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<c:set value="등록" var="stts"/>
<c:if test="${status eq 'u' }">
	<c:set value="수정" var="stts"/>
</c:if>

<div style="margin-bottom: 50px;">
	<div style="margin-top: -32px;">
		<div class="separator border-2 my-10"></div>
	</div>
	<div style="margin-left: 30px; margin-top: -100px;">
		<h3>프로젝트 ${stts }</h3> 
		<h6>프로젝트</h6>
	</div>
</div>

<section class="tab-content">
<form id="projectForm" action="/company/projectInsert.do" method="post">
	<c:if test="${status eq 'u' }">
		<input type="hidden" name="proNo" value="${projectVO.proNo }"/>
		<input type="hidden" name="proNo" value="${projectTaskVO.proNo}"/>
	</c:if>
		<div id="kt_app_content" class="app-container container-fluid">
			<div class="d-flex flex-column gap-7 gap-lg-10">
				<!-- 프로젝트 상태 등록 시작 (수정시) -->
				<c:if test="${status eq 'u' }">
					<div class="card card-flush py-4">
						<div class="card-header">
							<div class="card-title">
								<h2>진행상태</h2>
							</div>
							<div class="card-toolbar">
								<c:if test="${projectVO.proSttsCd == 'PRO001' }"><div class="rounded-circle bg-primary w-15px h-15px" id="kt_ecommerce_add_product_status"></div></c:if>
								<c:if test="${projectVO.proSttsCd == 'PRO002' }"><div class="rounded-circle bg-warning w-15px h-15px" id="kt_ecommerce_add_product_status"></div></c:if>
								<c:if test="${projectVO.proSttsCd == 'PRO003' }"><div class="rounded-circle bg-success w-15px h-15px" id="kt_ecommerce_add_product_status"></div></c:if>
							</div>
						</div>
						<div class="card-body pt-0">
						    <select class="form-select mb-2" data-control="select2" data-hide-search="true" data-placeholder="Select an option" id="kt_ecommerce_add_product_status_select" name="proSttsCd">
						        <option value="PRO001" ${projectVO.proSttsCd == 'PRO001' ? 'selected' : ''}>대기</option>
						        <option value="PRO002" ${projectVO.proSttsCd == 'PRO002' ? 'selected' : ''}>진행</option>
						        <option value="PRO003" ${projectVO.proSttsCd == 'PRO003' ? 'selected' : ''}>완료</option>
						    </select>
						</div>
					</div>
				</c:if>
				<!-- 프로젝트 상태 등록 종료 -->
				<!-- 프로젝트 등록 시작 -->
				<div class="card card-flush py-4">
					<div class="card-header">
						<div class="card-title">
							<h2>프로젝트 ${stts }</h2>
						</div>
					</div>
					<!-- 프로젝트 내용 입력 시작 -->
					<div class="card-body pt-0">
						<!-- 프로젝트명 등록 시작 -->
						<div class="mb-10 fv-row">
							<label class="required form-label">프로젝트명</label>
							<input type="text" id="proNm" name="proNm" class="form-control mb-2" placeholder="프로젝트명을 입력하세요" value="${projectVO.proNm }" />
						</div>
						<!-- 프로젝트명 등록 종료 -->
						<!-- 프로젝트 설명 등록 시작 -->
						<div class="mb-10 fv-row">
							<label class="required form-label">프로젝트 내용</label>
								<input type="text" id="proCn" name="proCn" class="form-control mb-2" placeholder="프로젝트 설명을 입력하세요" value="${projectVO.proCn }" />
						</div>
						<!-- 프로젝트 설명 등록 종료 -->
						<!-- 프로젝트 참여일 등록 시작 -->
						<div class="row g-9 mb-8">
							<div class="col-md-6 fv-row">
								<label class="required fs-6 fw-semibold mb-2">시작일</label>
								<div class="position-relative d-flex align-items-center">
									<i class="ki-duotone ki-calendar-8 fs-2 position-absolute mx-4">
										<span class="path1"></span>
										<span class="path2"></span>
										<span class="path3"></span>
										<span class="path4"></span>
										<span class="path5"></span>
										<span class="path6"></span>
									</i>
									<input class="form-control form-control-solid ps-12 flatpickr-input active" placeholder="시작일을 등록하세요" type="datetime-local" id="proStartDt" name="proStartDt" value="${projectVO.proStartDt }" />
								</div>
							</div>
							<div class="col-md-6 fv-row">
								<label class="required fs-6 fw-semibold mb-2">마감일</label>
								<div class="position-relative d-flex align-items-center">
									<i class="ki-duotone ki-calendar-8 fs-2 position-absolute mx-4">
										<span class="path1"></span>
										<span class="path2"></span>
										<span class="path3"></span>
										<span class="path4"></span>
										<span class="path5"></span>
										<span class="path6"></span>
									</i>
									<input class="form-control form-control-solid ps-12" placeholder="마감일을 등록하세요" type="datetime-local"  id="proEndDt" name="proEndDt" value="${projectVO.proEndDt }" />
								</div>
							</div>
						</div>
						<!-- 프로젝트 참여일 등록 종료 -->
					</div>
					<!-- 프로젝트 내용 입력 종료 -->
				</div>
				<!-- 프로젝트 등록 종료 -->
				<!-- 프로젝트 참여자 등록 시작 -->
				<div class="card card-flush py-4">
					<div class="card-header">
						<div class="card-title">
							<h2>참여자 ${stts }</h2>
						</div>
					</div>
					<!-- 참여자 등록 시작 -->
					<div class="card-body pt-0">
						<div class="" data-kt-ecommerce-catalog-add-product="auto-options">
							<label class="required form-label">프로젝트 참여자를 등록해주세요</label>
							<div id="kt_ecommerce_add_product_options">
								<div class="form-group">
									<div id="repeater-list" data-repeater-list="kt_ecommerce_add_product_options" class="d-flex flex-column gap-3">
										<div data-repeater-item="" class="form-group d-flex flex-wrap align-items-center gap-5">
											<%-- <input type="text" class="form-control mw-100 w-200px" placeholder="${role }명" name="participantList[1].empId" value="${employee.empId}" /> --%>
											<input type="text" class="form-control mw-100 w-200px" placeholder="참여쟈명" id="empId" name="empId" value="${projectTaskVO.empId}"/>
											<%-- <input type="text" class="form-control mw-100 w-200px" placeholder="${role }명" id="empId" name="empId" value="${employee.empId}"/> --%>
											<!-- 주소록 완성되면 이 방법을 수정할 것 -->
											<!-- <div class="w-100 w-md-200px">
												<select class="form-select" name="product_option" data-placeholder="Select a variation" data-kt-ecommerce-catalog-add-product="product_option">
													<option>참가자 부서</option>
													<option value="">내용 입력 필요</option>
												</select>
											</div>
											<input type="text" class="form-control mw-100 w-200px" name="product_option_value" placeholder="참가자명" /> -->
											<!-- <button type="button" data-repeater-delete="" class="btn btn-sm btn-icon btn-light-danger">
												<i class="ki-duotone ki-cross fs-1">
													<span class="path1"></span>
													<span class="path2"></span>
												</i>
											</button> -->
										</div>
									</div>
								</div>
								<div class="form-group mt-5">
									<button type="button" id="repeater-create" data-repeater-create="" class="btn btn-sm btn-light-primary">
									<i class="ki-duotone ki-plus fs-2"></i>참여자 추가</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 참여자 등록 시작 -->
				</div>
				<!-- 프로젝트 참여자 등록 시작 -->
				<!-- 버튼 시작 -->
				<div class="d-flex justify-content-end pt-7">
					<input type="button" value="${stts }" id="addBtn" class="btn btn-sm fw-bold btn-primary me-2">
					<c:if test="${status eq 'u' }">
						<input type="button" value="취소" id="cancelBtn" class="btn btn-sm btn-light fw-bold btn-active-light-primary me-2"> 
					</c:if>
					<c:if test="${status ne 'u' }">
						<input type="button" value="목록" id="listBtn" class="btn btn-sm btn-light fw-bold btn-active-light-primary me-2"> 
					</c:if>
				</div>
				<!-- 버튼 종료 -->
			</div>
		</div>
		<sec:csrfInput/>
	</form>
</section>
<div id="kt_app_footer" class="app-footer">
	<div class="app-container container-fluid d-flex flex-column flex-md-row flex-center flex-md-stack py-3"></div>
</div>
<script type="text/javascript">
$(function () {
	var listBtn = $("#listBtn");		// 목록 버튼
	var addBtn = $("#addBtn");			// 추가 버튼
	var cancelBtn = $("#cancelBtn");	// 취소 버튼
	var projectForm = $("#projectForm");
	
	// 목록 버튼
	listBtn.on("click", function () {
	  Swal.fire({
	    title: '작성을 취소하시겠습니까?',
	    icon: 'warning',
	    showCancelButton: true,
	    confirmButtonColor: '#4FC9DA',
	    cancelButtonColor: '#F06445',
	    confirmButtonText: '예',
	    cancelButtonText: '아니요',
	    reverseButtons: false,
	
	  }).then((result) => {
	    if (result.isConfirmed) {
	      location.href = "/company/project.do";
	    }
	  });
	});

	// 취소 버튼
	cancelBtn.on('click', function () {
	  Swal.fire({
	    title: '편집을 취소하시겠습니까?',
	    icon: 'warning',
	    showCancelButton: true,
	    confirmButtonColor: '#4FC9DA',
	    cancelButtonColor: '#F06445',
	    confirmButtonText: '예',
	    cancelButtonText: '아니요',
	    reverseButtons: false,
	
	  }).then((result) => {
	    if (result.isConfirmed) {
	      location.href = "/company/canbanList.do?proNo=${projectVO.proNo}";
	    }
	  })
	});
	
 	// 시작일 유효성 검사
	$("#proStartDt").on("change", function() {
		var proStartDt = $(this).val();
		var currentDt = new Date();
		var newStartDt = new Date(proStartDt);
	
		if (newStartDt < currentDt) {
			Swal.fire({
				title: '시작일은 현재일보다 과거일 수 없습니다.',
				icon: 'warning',
				confirmButtonColor: '#4FC9DA',
				confirmButtonText: '확인',
				reverseButtons: false,
				});
				$(this).val('');
			}
		});
	
	// 마감일 유효성 검사
	$("#proEndDt").on("change", function() {
		var proEndDt = $(this).val();
		var proStartDt = $("#proStartDt").val();
	
		if (proStartDt && new Date(proEndDt) < new Date(proStartDt)) {
			Swal.fire({
				title: '마감일은 시작일보다 빠를 수 없습니다.',
				icon: 'warning',
				confirmButtonColor: '#4FC9DA',
				confirmButtonText: '확인',
				reverseButtons: false,
		});
			$(this).val('');
		}
	});

	
	// 추가 버튼
	addBtn.on("click", function () {
	  var proNm = $("#proNm").val();
	  var proCn = $("#proCn").val();
	  var proStartDt = $("#proStartDt").val();
	  var proEndDt = $("#proEndDt").val();
	  var empId = $("#empId").val();
	
	  if (proNm == null || proNm == "" ||
	    proCn == null || proCn == "" ||
	    proStartDt == null || proStartDt == "" ||
	    proEndDt == null || proEndDt == "" ||
	    empId == null || empId == ""
	  ) {
	    Swal.fire({
	      icon: 'warning',
	      title: '필수 입력이 비어있습니다.',
	      text: '필수 입력 내용을 채워주세요.',
	      confirmButtonColor: '#4FC9DA',
	    });
	    return false;
	  }
	
	  if ($(this).val() == "수정") {
	    projectForm.attr("action", "/company/projectUpdate.do");
	  }
	
	  projectForm.submit();
	});
	
	
	// 참가자 항목 추가
	$("#repeater-create").on("click", function () {
	  var createEmp = `
	         <div class="form-group d-flex flex-wrap align-items-center gap-5 repeater-item">
	             <input type="text" class="form-control mw-100 w-200px" placeholder="참여자명" id="empId" name="empId" value="${employee.empId}"/>
	             <button type="button" class="btn btn-sm btn-icon btn-light-danger repeater-delete">
	                 <i class="ki-duotone ki-cross fs-1">
	                     <span class="path1"></span>
	                     <span class="path2"></span>
	                 </i>
	             </button>
	         </div>`;
	
	  $("#repeater-list").append(createEmp);
	});
	
	// 참가자 항목 삭제
	$("#repeater-list").on("click", ".repeater-delete", function () {
	  $(this).closest('.repeater-item').remove();
	});
});
</script>