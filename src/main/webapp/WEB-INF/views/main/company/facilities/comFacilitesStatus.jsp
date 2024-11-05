<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="app-main flex-column flex-row-fluid" id="kt_app_main">
	<div class="d-flex flex-column flex-column-fluid">
		<div id="kt_app_content" class="app-content flex-column-fluid">
			<div id="kt_app_content_container" class="app-container container-fluid">
				<div class="card mb-5 mb-xxl-8">
					<div class="card-body pt-0 pb-0">
						<!--begin::Navs-->
						<ul class="nav nav-stretch nav-line-tabs nav-line-tabs-2x border-transparent fs-5 fw-bold">
							<li class="nav-item mt-2">
								<c:if test="${not empty fcltCtgrList }">
									<c:forEach items="${fcltCtgrList }" var="ctgrList">
										<a class="nav-link text-active-primary ms-0 me-10 py-5 " onclick="clickCtgr('${ctgrList.fcltCtgrCd}')">
											${ctgrList.fcltCtgrNm }
										</a>
									</c:forEach>
									
								</c:if>	
						</ul>
						<!--begin::Navs-->
					</div>
				</div>
					
					<div class="d-flex flex-column flex-lg-row">
						<!--begin::Sidebar-->
						<div class="flex-column flex-lg-row-auto w-100 w-lg-300px w-xl-400px mb-10 mb-lg-0">
							<!--begin::Contacts-->
							<div class="card card-flush">
								<!--end::Card header-->
								<!--begin::Card body-->
								<div class="card-body pt-5" id="kt_chat_contacts_body">
									<!--begin::List-->
									<div class="scroll-y me-n5 pe-5 h-200px h-lg-auto" data-kt-scroll="true" data-kt-scroll-activate="{default: false, lg: true}" data-kt-scroll-max-height="auto" data-kt-scroll-dependencies="#kt_header, #kt_app_header, #kt_toolbar, #kt_app_toolbar, #kt_footer, #kt_app_footer, #kt_chat_contacts_header" data-kt-scroll-wrappers="#kt_content, #kt_app_content, #kt_chat_contacts_body" data-kt-scroll-offset="5px">
										
										<!--begin::User-->
										<div class="d-flex flex-stack py-4">
											<!--begin::Details-->
											<div class="d-flex align-items-center">
											
												<!--begin::Details-->
												<div class="ms-5">
													<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">회의실 1</a>
													<div class="fw-semibold text-muted">3F 회의실 1</div>
												</div>
												<!--end::Details-->
											</div>
											<!--end::Details-->
											<!--begin::Lat seen-->
											<div class="d-flex flex-column align-items-end ms-2">
												<span class="text-muted fs-7 mb-1"></span>
											</div>
											<!--end::Lat seen-->
										</div>
										<!--end::User-->
										<!--begin::Separator-->
										<div class="separator separator-dashed d-none"></div>
										<!--end::Separator-->
										
										<!--begin::User-->
										<div class="d-flex flex-stack py-4">
											<!--begin::Details-->
											<div class="d-flex align-items-center">
											
												<!--begin::Details-->
												<div class="ms-5">
													<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">회의실 2</a>
													<div class="fw-semibold text-muted">3F 회의실 2</div>
												</div>
												<!--end::Details-->
											</div>
											<!--end::Details-->
											<!--begin::Lat seen-->
											<div class="d-flex flex-column align-items-end ms-2">
												<span class="text-muted fs-7 mb-1"></span>
											</div>
											<!--end::Lat seen-->
										</div>
										<!--end::User-->
										<!--begin::Separator-->
										<div class="separator separator-dashed d-none"></div>
										<!--end::Separator-->
										
										<!--begin::User-->
										<div class="d-flex flex-stack py-4">
											<!--begin::Details-->
											<div class="d-flex align-items-center">
											
												<!--begin::Details-->
												<div class="ms-5">
													<a href="#" class="fs-5 fw-bold text-gray-900 text-hover-primary mb-2">회의실 3</a>
													<div class="fw-semibold text-muted">3F 회의실 3</div>
												</div>
												<!--end::Details-->
											</div>
											<!--end::Details-->
											<!--begin::Lat seen-->
											<div class="d-flex flex-column align-items-end ms-2">
												<span class="text-muted fs-7 mb-1"></span>
											</div>
											<!--end::Lat seen-->
										</div>
										<!--end::User-->
										<!--begin::Separator-->
										<div class="separator separator-dashed d-none"></div>
										<!--end::Separator-->
										
										
									</div>
									<!--end::List-->
								</div>
								<!--end::Card body-->
							</div>
							<!--end::Contacts-->
						</div>
						<!--end::Sidebar-->
						
						
						
						
						<!--begin::Content-->
						<div class="flex-lg-row-fluid ms-lg-7 ms-xl-10">
							<!--begin::Messenger-->
							<div class="card" id="kt_chat_messenger">
								<!--begin::Card header-->
								
								<!--end::Card header-->
								<!--begin::Card body-->
								<div class="card-body" id="kt_chat_messenger_body">
									<h4>여기 평면도 들어갈 예정</h4>
								</div>
								<!--end::Card body-->
							</div>
							<!--end::Messenger-->
						</div>
						<!--end::Content-->
					</div>
					<!--end::Layout-->
				</div>
			</div>
		</div>
	</div>
