<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div style="margin-bottom: 25px;">
	<div style="margin-top: -32px;">
		<div class="separator my-10"></div>
	</div>
	<div style="margin-left: 30px; margin-top: -100px;">
		<h3>인사·정보 관리</h3>
		<h6>부서관리 - 팀 상세정보</h6>
	</div>
</div>
<div id="kt_app_content_container" class="app-container container-fluid">
	<div class="card mb-6">
		<div class="card-body pt-9 pb-0">
			<div class="d-flex flex-wrap flex-sm-nowrap mb-6 align-middle">
						<span data-kt-element="bullet" class="bullet bullet-vertical align-items-center min-h-150px mh-100 me-4 bg-info">
						</span>
				<div class="me-7 mb-4">
					<div class="symbol symbol-160px symbol-lg-160px symbol-fixed position-relative" style="overflow: hidden;">
						<img src="/upload/nodeptimg/jpg" class="img-fluid rounded" style="object-fit: cover;"/>
					</div>
				</div>
				<div class="flex-grow-1">
					<div class="d-flex justify-content-between align-items-start flex-wrap mb-2">
						<div class="d-flex flex-column py-3">
							<div class="d-flex align-items-center mb-2">
								<div class="text-gray-800 text-hover-primary fs-2 fw-bold me-1"><h2>${teamVO.teamNm }</h2></div>
								<i class="ki-duotone ki-verify fs-1 text-primary pb-2">
									<span class="path1"></span>
									<span class="path2"></span>
								</i>
							</div>
							<div class="flex-wrap fw-semibold fs-6 mb-4 pe-2">
								<a href="#" class="d-flex align-items-center text-gray-500 text-hover-primary me-5 mb-2 py-1">
								<i class="ki-duotone ki-address-book fs-4 me-1">
									<span class="path1"></span>
									<span class="path2"></span>
									<span class="path3"></span>
								</i>소속 부서 - ${teamVO.deptNm }</a>
								<a href="#" class="d-flex align-items-center text-gray-500 text-hover-primary me-5 mb-2 py-1">
								<i class="ki-duotone ki-geolocation fs-4 me-1">
									<span class="path1"></span>
									<span class="path2"></span>
								</i></a>
								<a href="#" class="d-flex align-items-center text-gray-500 text-hover-primary mb-2 py-1">
								<i class="ki-duotone ki-sms fs-4 me-1">
									<span class="path1"></span>
									<span class="path2"></span>
								</i>생성일 - ${teamVO.teamCrtDt }</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex flex-wrap flex-stack mb-6">
		<h3 class="text-gray-800 fw-bold my-2">팀원 현황
		<span class="fs-6 text-gray-500 fw-semibold ms-1">(${teamVO.empCnt })</span></h3>
	</div>
	<div class="row g-6 mb-6 g-xl-9 mb-xl-9">
		<c:choose>
			<c:when test="${empty empList }">
				<div class="d-flex flex-column flex-center mt-10">
				    <img src="/resources/file/image/cloudEmpty.png" class="mw-300px">
				    <div class="fs-1 fw-bolder text-dark">등록된 팀원이 없습니다.</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${empList }" var="emp">
				<div class="col-md-6 col-xxl-4">
					<div class="card">
						<div class="card-body d-flex flex-center flex-column py-9 px-5">
							<div class="symbol symbol-65px symbol-circle mb-5">
								<img src="/upload/${emp.imgFileUrl }" alt="image" />
							</div>
							<a href="#" class="fs-4 text-gray-800 text-hover-primary fw-bold mb-0">${emp.empNm }</a>
							<div class="fw-semibold text-gray-500 mb-6">${emp.empEmlAddr }</div>
							<div class="d-flex flex-center flex-wrap mb-5">
								<div class="border border-dashed rounded min-w-90px py-3 px-4 mx-2 mb-3">
									<div class="fs-6 fw-bold text-gray-700">직급</div>
									<div class="fw-semibold text-gray-500">${emp.jbgdNm }</div>
								</div>
								<div class="border border-dashed rounded min-w-90px py-3 px-4 mx-2 mb-3">
									<div class="fs-6 fw-bold text-gray-700">프로젝트</div>
									<div class="fw-semibold text-gray-500">진행중인 프로젝트</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	
	
	
		<div class="d-flex justify-content-end pb-10">
			<div class="align-items-center">
				<input type="button" id="delBtn" class="btn btn-danger" value="삭제">
				<a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#kt_modal_modify_team">수정</a>
				<input type="button" id="listBtn" class="btn btn-light-info" value="목록">
			</div> 
		</div>
	</div>
</div>
<div class="modal fade" id="kt_modal_modify_team" tabindex="-1" aria-labelledby="modalEditDeptLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content modal-rounded">
            <div class="modal-header py-7 d-flex justify-content-between">
                <h5 class="modal-title" id="modalEditDeptLabel">팀명 수정하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="text" id="deptNameInput" class="form-control" placeholder="팀명을 입력해주세요" value="${teamVO.teamNm }" />
                <input type="hidden" id="deptCodeInput" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="saveDeptBtn">저장</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function () {
	
	var listBtn = $("#listBtn");
	
	
	listBtn.on('click', function(event) {
	    event.preventDefault(); // 기본 링크 클릭 동작 방지
	    console.log("클릭됨");
	    location.href = "/information/alldept.do"; // URL을 직접 할당
	});
});
</script>
