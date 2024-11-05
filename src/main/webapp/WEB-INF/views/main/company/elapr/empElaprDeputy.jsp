<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div style="margin-bottom: 50px;">
	<div style="margin-top: -32px;">
		<div class="separator border-2 my-10"></div>
	</div>
	<div style="margin-left: 30px; margin-top: -100px;">
		<h3>대결자 라인</h3>
		<h6>전자결재</h6>
	</div>
</div>
<div class="container">
	<!-- 사이드바 -->
	<div class="row">
		<div class="col-lg-1" style="width:250px">
			<div class="app-sidebar-menu hover-scroll-y my-5 my-lg-5 mx-3" id="kt_app_sidebar_menu_wrapper" data-kt-scroll="true" data-kt-scroll-height="auto" data-kt-scroll-dependencies="#kt_app_sidebar_toolbar, #kt_app_sidebar_footer" data-kt-scroll-offset="0">
				<div class="menu menu-column menu-sub-indention menu-active-bg fw-semibold" id="#kt_sidebar_menu" data-kt-menu="true">
					<a href="/employee/elaprMain.do" class="btn btn-outline-light"><h2>전자결재</h2></a>
					<a href="/employee/elaprForm.do" class="btn btn-primary mt-2">새 결재 진행하기</a>
					<div data-kt-menu-trigger="click" class="menu-item menu-accordion">
						<span class="menu-link">
							<span class="menu-title">결재하기</span>
							<span class="menu-arrow"></span>
						</span>
						<div class="menu-sub menu-sub-accordion">
							<div class="menu-item">
								<a class="menu-link" href="/employee/empElaprWating.do">
									<span class="menu-bullet">
										<span class="bullet bullet-dot"></span>
									</span>
									<span class="menu-title">결재 대기 문서</span>
								</a>
							</div>
						</div>
					</div>
					<div data-kt-menu-trigger="click" class="menu-item menu-accordion">
						<span class="menu-link">
							<span class="menu-title">개인 문서함</span>
							<span class="menu-arrow"></span>
						</span>
						<div class="menu-sub menu-sub-accordion">
							<div class="menu-item">
								<a class="menu-link" href="/employee/empElaprDraft.do">
									<span class="menu-bullet">
										<span class="bullet bullet-dot"></span>
									</span>
									<span class="menu-title">기안 문서함</span>
								</a>
							</div>
							<div class="menu-item">
								<a class="menu-link" href="/employee/empElaprRernc.do">
									<span class="menu-bullet">
										<span class="bullet bullet-dot"></span>
									</span>
									<span class="menu-title">참조/열람 문서함</span>
								</a>
							</div>
							<div class="menu-item">
								<a class="menu-link" href="/employee/empElaprComplete.do">
									<span class="menu-bullet">
										<span class="bullet bullet-dot"></span>
									</span>
									<span class="menu-title">결재 완료 문서함</span>
								</a>
							</div>
						</div>
					</div>
					<div data-kt-menu-trigger="click" class="menu-item menu-accordion">
						<span class="menu-link">
							<span class="menu-title">결재라인</span>
							<span class="menu-arrow"></span>
						</span>
						<div class="menu-sub menu-sub-accordion">
							<div class="menu-item">
								<a class="menu-link" href="/employee/empElaprApln.do">
									<span class="menu-bullet">
										<span class="bullet bullet-dot"></span>
									</span>
									<span class="menu-title">결재라인 관리</span>
								</a>
							</div>
						</div>
					</div>
					<div data-kt-menu-trigger="click" class="menu-item menu-accordion">
						<span class="menu-link">
							<span class="menu-title">대결자</span>
							<span class="menu-arrow"></span>
						</span>
						<div class="menu-sub menu-sub-accordion">
							<div class="menu-item">
								<a class="menu-link" href="/employee/empElaprDeputy.do">
									<span class="menu-bullet">
										<span class="bullet bullet-dot"></span>
									</span>
									<span class="menu-title">대결자 관리</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 결재 라인 List -->
		<div class="col-lg-9">
		<div class="card card-flush">
			<div class="row">
					<div class="card-header align-items-center py-5 gap-2 gap-md-5">
						<h3>결재라인</h3>
						<a href="#" class="btn btn-primary">결재 라인 등록</a>
					</div>
				</div>
			<div class="card-body">
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
							<th class="w-10px pe-2">
								<div class="form-check form-check-sm form-check-custom form-check-solid me-3">
									<input class="form-check-input" type="checkbox" data-kt-check="true" data-kt-check-target="#kt_ecommerce_sales_table .form-check-input" value="1" />
								</div>
							</th>
							<th class="min-w-200px">No</th>
							<th class="min-w-100px">결재순서</th>
							<th class="min-w-70px">직책</th>
							<th class="min-w-100px">결재자</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty elaprList }">
								<tr>
									<td colspan="5" >결재 라인이 존재하지 않습니다.</td>
								</tr>
							</c:when>
							<%-- <c:otherwise>
								<c:forEach items="${elaprList }" var="elaprVO">
									<tr>
										<td style="width: 6%">
											<input type="checkbox">
										</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:forEach>
							</c:otherwise> --%>
						</c:choose>
					</tbody>
				</table>
			</div>
			</div>
		</div>
		</div>
	</div>
