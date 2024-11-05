<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</style>


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
				
				<div class="row gx-5 gx-xl-10 mb-xl-10">

					<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-3 mb-10">
					
						<!-- Q&A 위젯 시작 -->
						<div class="card card-flush h-md-50 mb-5 mb-xl-10">
						
	 				    <c:set value="" var="qstnCountAll"/>
	 				    <c:set value="" var="qstnCountService"/>
	 				    <c:set value="" var="qstnCountPrice"/>
	 				    <c:set value="" var="qstnCountOther"/>
	 				     
	 				    <c:set value="${qstnListCount }" var="qstnListCount"/>
	 				    <c:forEach items="${qstnListCount }" var="qstnCount">
	 				    		<c:if test="${not empty qstnCount.cmntyQstnAllcount }">
	 				    			<c:set value="${qstnCount }" var="qstnCountAll"/>
	 				    		</c:if>
	 				    		<c:if test="${qstnCount.comDtlCd eq 'QSTNKND001' }">
	 				    			<c:set value="${qstnCount }" var="qstnCountService"/>
	 				    		</c:if>
	 				    		<c:if test="${qstnCount.comDtlCd eq 'QSTNKND002' }">
	 				    			<c:set value="${qstnCount }" var="qstnCountPrice"/>
	 				    		</c:if> 
	 				    		<c:if test="${qstnCount.comDtlCd eq 'QSTNKND003' }">
	 				    			<c:set value="${qstnCount }" var="qstnCountOther"/>
	 				    		</c:if>
	 				    </c:forEach>
					
							<div class="card-header pt-9 ps-12">
								<div class="card-title d-flex flex-column">
									<div class="d-flex align-items-center">
										<span class="fs-4 fw-semibold text-gray-500 me-3 align-self-start">
											<i class="ki-duotone ki-question-2 fs-2x mt-1">
											 <span class="path1"></span>  
											 <span class="path2"></span>
											 <span class="path3"></span>
											</i>
										</span>
										<span class="fs-2x fw-bold text-gray-900 me-2 lh-1 ls-n2">
											<a href="/groubear/cmntyQstnList.do">Q&A 답변 대기</a>
										</span>
										<a href="/groubear/cmntyQstnList.do?cmntyQstnSttsYn=N" class="badge badge-light-danger fs-base ms-3 fs-3">
											${qstnCountAll.cmntyQstnSttsAllN } / ${qstnCountAll.cmntyQstnAllcount}
										</a>
									</div> 
								</div>  
							</div> 

							<div class="card-body pt-2 pb-4 d-flex align-items-center">
								<div class="d-flex flex-column content-justify-center w-100 ms-2"> 
								
									<div class="d-flex fs-3 fw-semibold align-items-center ms-5">
										<div class="bullet w-15px h-7px rounded-2 bg-danger me-3"></div>
										<div class="text-gray-700 flex-grow-1 ms-2">
											<a href="/groubear/cmntyQstnList.do?cmntyType=QSTNKND001">서비스이용</a>
										</div>
										<div class="fw-bolder text-gray-700 fs-2 me-4">
											<span>
												<a href="/groubear/cmntyQstnList.do?cmntyType=QSTNKND001">
													${qstnCountService.cmntyQstnSttsNCount } 
												</a>	
												/ ${qstnCountService.cmntyQstnSttsNCount + qstnCountService.cmntyQstnSttsYCount}</span>
											<c:if test="${qstnCountService.cmntyQstnSttsNCount > 0}">
												<span class="ms-2">
													<i class="ki-duotone ki-information-5 text-danger fs-1">
													 <span class="path1"></span>
													 <span class="path2"></span>
													 <span class="path3"></span>
													</i>
												</span>		
											</c:if>
											<c:if test="${qstnCountService.cmntyQstnSttsNCount == 0}">
												<span class="ms-10">
												</span>		
											</c:if>
										</div>
									</div>

									<div class="d-flex fs-3 fw-semibold align-items-center my-3 ms-5">
										<div class="bullet w-15px h-7px rounded-2 bg-primary me-3"></div>
										<div class="text-gray-700 flex-grow-1 ms-2">
											<a href="/groubear/cmntyQstnList.do?cmntyType=QSTNKND002">가격</a>
										</div>
										<div class="fw-bolder text-gray-700 fs-2 me-4">
											<span>
												<a href="/groubear/cmntyQstnList.do?cmntyType=QSTNKND002">
													${qstnCountPrice.cmntyQstnSttsNCount } 
												</a>	
												 / ${qstnCountPrice.cmntyQstnSttsNCount + qstnCountPrice.cmntyQstnSttsYCount}
											</span>
											<c:if test="${qstnCountPrice.cmntyQstnSttsNCount > 0}">
												<span class="ms-2">
													<i class="ki-duotone ki-information-5 text-danger fs-1">
													 <span class="path1"></span>
													 <span class="path2"></span>
													 <span class="path3"></span>
													</i>
												</span>		
											</c:if>
											<c:if test="${qstnCountPrice.cmntyQstnSttsNCount == 0}">
												<span class="ms-10">
												</span>		
											</c:if>
										</div>
									</div> 

									<div class="d-flex fs-3 fw-semibold align-items-center ms-5">
										<div class="bullet w-15px h-7px rounded-2 bg-success me-3"></div>  
										<div class="text-gray-700 flex-grow-1 ms-2">
											<a href="/groubear/cmntyQstnList.do?cmntyType=QSTNKND003">기타</a>
										</div>
										<div class="fw-bolder text-gray-700 fs-2 me-4">
											<span>
												<a href="/groubear/cmntyQstnList.do?cmntyType=QSTNKND003">
													${qstnCountOther.cmntyQstnSttsNCount } 
												</a>	
												/ ${qstnCountOther.cmntyQstnSttsNCount + qstnCountOther.cmntyQstnSttsYCount}
											</span>
											<c:if test="${qstnCountOther.cmntyQstnSttsNCount > 0}">
												<span class="ms-2">
													<i class="ki-duotone ki-information-5 text-danger fs-1">
													 <span class="path1"></span>
													 <span class="path2"></span>
													 <span class="path3"></span>
													</i>
												</span>		
											</c:if>
											<c:if test="${qstnCountOther.cmntyQstnSttsNCount == 0}">
												<span class="ms-10">
												</span>		
											</c:if>
										</div>
									</div>
									
								</div>
							</div>
						
						</div>
						
						 
						<div class="card card-flush h-md-50 mb-xl-10">
							<div class="card-header pt-5">
								<div class="card-title d-flex flex-column">
									<div class="d-flex align-items-center">
										<span class="fs-2hx fw-bold text-gray-900 me-2 lh-1 ls-n2">1,836</span>
										<span class="badge badge-light-danger fs-base"> <i
											class="ki-duotone ki-arrow-down fs-5 text-danger ms-n1"><span
												class="path1"></span><span class="path2"></span></i> 2.2%
										</span>
									</div>
									<span class="text-gray-500 pt-1 fw-semibold fs-6">Orders
										This Month</span>
								</div>
							</div>

							<div class="card-body d-flex align-items-end pt-0">
								<div class="d-flex align-items-center flex-column mt-3 w-100">
									<div class="d-flex justify-content-between w-100 mt-auto mb-2">
										<span class="fw-bolder fs-6 text-gray-900">1,048 to
											Goal</span> <span class="fw-bold fs-6 text-gray-500">62%</span>
									</div>
									<div class="h-8px mx-3 w-100 bg-light-success rounded">
										<div class="bg-success rounded h-8px" role="progressbar"
											style="width: 62%;" aria-valuenow="50" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

						

					<!--begin::Col-->
					<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-3 mb-10">
						<!--begin::Card widget 6-->
						<div class="card card-flush  h-md-50 mb-5 mb-xl-10">
							<!--begin::Header-->
							<div class="card-header pt-5">
								<!--begin::Title-->
								<div class="card-title d-flex flex-column">
									<!--begin::Info-->
									<div class="d-flex align-items-center">
										<!--begin::Currency-->
										<span
											class="fs-4 fw-semibold text-gray-500 me-1 align-self-start">$</span>
										<!--end::Currency-->

										<!--begin::Amount-->
										<span class="fs-2hx fw-bold text-gray-900 me-2 lh-1 ls-n2">2,420</span>
										<!--end::Amount-->

										<!--begin::Badge-->
										<span class="badge badge-light-success fs-base"> <i
											class="ki-duotone ki-arrow-up fs-5 text-success ms-n1"><span
												class="path1"></span><span class="path2"></span></i> 2.6%
										</span>
										<!--end::Badge-->
									</div>
									<!--end::Info-->

									<!--begin::Subtitle-->
									<span class="text-gray-500 pt-1 fw-semibold fs-6">Average
										Daily Sales</span>
									<!--end::Subtitle-->
								</div>
								<!--end::Title-->
							</div>
							<!--end::Header-->

							<!--begin::Card body-->
							<div class="card-body d-flex align-items-end px-0 pb-0">
								<!--begin::Chart-->
								<div id="" class="w-100" style="height: 80px; min-height: 80px;">
									<div id="apexchartszcdkpn5m"
										class="apexcharts-canvas apexchartszcdkpn5m apexcharts-theme-"
										style="width: 360px; height: 80px;">
										<svg id="SvgjsSvg1248" width="360" height="80"
											xmlns="http://www.w3.org/2000/svg" version="1.1"
											xmlns:xlink="http://www.w3.org/1999/xlink"
											xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg"
											xmlns:data="ApexChartsNS" transform="translate(0, 0)">
											<foreignObject x="0" y="0" width="360" height="80">
											<div class="apexcharts-legend"
												xmlns="http://www.w3.org/1999/xhtml"
												style="max-height: 40px;"></div></foreignObject>
											<g id="SvgjsG1254" class="apexcharts-datalabels-group"
												transform="translate(0, 0) scale(1)"></g>
											<g id="SvgjsG1255" class="apexcharts-datalabels-group"
												transform="translate(0, 0) scale(1)"></g>
											<g id="SvgjsG1295" class="apexcharts-yaxis" rel="0"
												transform="translate(-18, 0)"></g>
											<g id="SvgjsG1250"
												class="apexcharts-inner apexcharts-graphical"
												transform="translate(41.166666666666664, 4.5)">
											<defs id="SvgjsDefs1249">
											<clipPath id="gridRectMaskzcdkpn5m">
											<rect id="SvgjsRect1252" width="353.00000000000006"
												height="84" x="-37.666666666666664" y="-6.5" rx="0" ry="0"
												opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fff"></rect></clipPath>
											<clipPath id="forecastMaskzcdkpn5m"></clipPath>
											<clipPath id="nonForecastMaskzcdkpn5m"></clipPath>
											<clipPath id="gridRectMarkerMaskzcdkpn5m">
											<rect id="SvgjsRect1253" width="281.6666666666667"
												height="75" x="-2" y="-2" rx="0" ry="0" opacity="1"
												stroke-width="0" stroke="none" stroke-dasharray="0"
												fill="#fff"></rect></clipPath></defs>
											<g id="SvgjsG1275" class="apexcharts-grid">
											<g id="SvgjsG1276" class="apexcharts-gridlines-horizontal"
												style="display: none;">
											<line id="SvgjsLine1279" x1="-31.166666666666664" y1="0"
												x2="308.83333333333337" y2="0" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1280" x1="-31.166666666666664" y1="71"
												x2="308.83333333333337" y2="71" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line></g>
											<g id="SvgjsG1277" class="apexcharts-gridlines-vertical"
												style="display: none;"></g>
											<line id="SvgjsLine1282" x1="0" y1="71"
												x2="277.6666666666667" y2="71" stroke="transparent"
												stroke-dasharray="0" stroke-linecap="butt"></line>
											<line id="SvgjsLine1281" x1="0" y1="1" x2="0" y2="71"
												stroke="transparent" stroke-dasharray="0"
												stroke-linecap="butt"></line></g>
											<g id="SvgjsG1278" class="apexcharts-grid-borders"
												style="display: none;"></g>
											<g id="SvgjsG1256"
												class="apexcharts-bar-series apexcharts-plot-series">
											<g id="SvgjsG1257" class="apexcharts-series" rel="1"
												seriesName="Sales" data:realIndex="0">
											<path id="SvgjsPath1262"
												d="M-8.22638888888889 60.501000000000005L-8.22638888888889 54.876C-8.22638888888889 51.876 -5.22638888888889 48.876 -2.2263888888888896 48.876L2.2263888888888888 48.876C5.22638888888889 48.876 8.22638888888889 51.876 8.22638888888889 54.876L8.22638888888889 60.501000000000005C8.22638888888889 63.501000000000005 5.22638888888889 66.501 2.2263888888888896 66.501L-2.2263888888888888 66.501C-5.22638888888889 66.501 -8.22638888888889 63.501000000000005 -8.22638888888889 60.501000000000005C-8.22638888888889 60.501000000000005 -8.22638888888889 60.501000000000005 -8.22638888888889 60.501000000000005 "
												fill="rgba(79,201,218,0.85)" fill-opacity="1"
												stroke="transparent" stroke-opacity="1"
												stroke-linecap="round" stroke-width="9" stroke-dasharray="0"
												class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskzcdkpn5m)"
												pathTo="M -8.22638888888889 60.501000000000005 L -8.22638888888889 54.876 C -8.22638888888889 51.876 -5.22638888888889 48.876 -2.2263888888888896 48.876 L 2.2263888888888888 48.876 C 5.22638888888889 48.876 8.22638888888889 51.876 8.22638888888889 54.876 L 8.22638888888889 60.501000000000005 C 8.22638888888889 63.501000000000005 5.22638888888889 66.501 2.2263888888888896 66.501 L -2.2263888888888888 66.501 C -5.22638888888889 66.501 -8.22638888888889 63.501000000000005 -8.22638888888889 60.501000000000005 Z "
												pathFrom="M -8.22638888888889 66.501 L -8.22638888888889 66.501 L 8.22638888888889 66.501 L 8.22638888888889 66.501 L 8.22638888888889 66.501 L 8.22638888888889 66.501 L 8.22638888888889 66.501 L -8.22638888888889 66.501 Z"
												cy="44.375" cx="8.22638888888889" j="0" val="30"
												barHeight="26.625" barWidth="25.45277777777778"></path>
											<path id="SvgjsPath1264"
												d="M38.05138888888889 60.501000000000005L38.05138888888889 28.251000000000005C38.05138888888889 25.251000000000005 41.05138888888889 22.251000000000005 44.05138888888889 22.251000000000005L48.50416666666666 22.251000000000005C51.50416666666666 22.251000000000005 54.50416666666666 25.251000000000005 54.50416666666666 28.251000000000005L54.50416666666666 60.501000000000005C54.50416666666666 63.501000000000005 51.50416666666666 66.501 48.50416666666666 66.501L44.05138888888889 66.501C41.05138888888889 66.501 38.05138888888889 63.501000000000005 38.05138888888889 60.501000000000005C38.05138888888889 60.501000000000005 38.05138888888889 60.501000000000005 38.05138888888889 60.501000000000005 "
												fill="rgba(79,201,218,0.85)" fill-opacity="1"
												stroke="transparent" stroke-opacity="1"
												stroke-linecap="round" stroke-width="9" stroke-dasharray="0"
												class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskzcdkpn5m)"
												pathTo="M 38.05138888888889 60.501000000000005 L 38.05138888888889 28.251 C 38.05138888888889 25.251 41.05138888888889 22.251 44.05138888888889 22.251 L 48.50416666666666 22.251 C 51.50416666666666 22.251 54.50416666666666 25.251 54.50416666666666 28.251 L 54.50416666666666 60.501000000000005 C 54.50416666666666 63.501000000000005 51.50416666666666 66.501 48.50416666666666 66.501 L 44.05138888888889 66.501 C 41.05138888888889 66.501 38.05138888888889 63.501000000000005 38.05138888888889 60.501000000000005 Z "
												pathFrom="M 38.05138888888889 66.501 L 38.05138888888889 66.501 L 54.50416666666666 66.501 L 54.50416666666666 66.501 L 54.50416666666666 66.501 L 54.50416666666666 66.501 L 54.50416666666666 66.501 L 38.05138888888889 66.501 Z"
												cy="17.75" cx="54.50416666666666" j="1" val="60"
												barHeight="53.25" barWidth="25.45277777777778"></path>
											<path id="SvgjsPath1266"
												d="M84.32916666666667 60.501000000000005L84.32916666666667 34.46350000000001C84.32916666666667 31.46350000000001 87.32916666666667 28.46350000000001 90.32916666666667 28.46350000000001L94.78194444444445 28.46350000000001C97.78194444444445 28.46350000000001 100.78194444444445 31.46350000000001 100.78194444444445 34.46350000000001L100.78194444444445 60.501000000000005C100.78194444444445 63.501000000000005 97.78194444444445 66.501 94.78194444444445 66.501L90.32916666666667 66.501C87.32916666666667 66.501 84.32916666666667 63.501000000000005 84.32916666666667 60.501000000000005C84.32916666666667 60.501000000000005 84.32916666666667 60.501000000000005 84.32916666666667 60.501000000000005 "
												fill="rgba(79,201,218,0.85)" fill-opacity="1"
												stroke="transparent" stroke-opacity="1"
												stroke-linecap="round" stroke-width="9" stroke-dasharray="0"
												class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskzcdkpn5m)"
												pathTo="M 84.32916666666667 60.501000000000005 L 84.32916666666667 34.46350000000001 C 84.32916666666667 31.46350000000001 87.32916666666667 28.463500000000007 90.32916666666667 28.463500000000007 L 94.78194444444445 28.463500000000007 C 97.78194444444445 28.463500000000007 100.78194444444445 31.46350000000001 100.78194444444445 34.46350000000001 L 100.78194444444445 60.501000000000005 C 100.78194444444445 63.501000000000005 97.78194444444445 66.501 94.78194444444445 66.501 L 90.32916666666667 66.501 C 87.32916666666667 66.501 84.32916666666667 63.501000000000005 84.32916666666667 60.501000000000005 Z "
												pathFrom="M 84.32916666666667 66.501 L 84.32916666666667 66.501 L 100.78194444444445 66.501 L 100.78194444444445 66.501 L 100.78194444444445 66.501 L 100.78194444444445 66.501 L 100.78194444444445 66.501 L 84.32916666666667 66.501 Z"
												cy="23.962500000000006" cx="100.78194444444445" j="2"
												val="53" barHeight="47.037499999999994"
												barWidth="25.45277777777778"></path>
											<path id="SvgjsPath1268"
												d="M130.60694444444445 60.501000000000005L130.60694444444445 41.5635C130.60694444444445 38.5635 133.60694444444445 35.5635 136.60694444444445 35.5635L141.05972222222223 35.5635C144.05972222222223 35.5635 147.05972222222223 38.5635 147.05972222222223 41.5635L147.05972222222223 60.501000000000005C147.05972222222223 63.501000000000005 144.05972222222223 66.501 141.05972222222223 66.501L136.60694444444445 66.501C133.60694444444445 66.501 130.60694444444445 63.501000000000005 130.60694444444445 60.501000000000005C130.60694444444445 60.501000000000005 130.60694444444445 60.501000000000005 130.60694444444445 60.501000000000005 "
												fill="rgba(79,201,218,0.85)" fill-opacity="1"
												stroke="transparent" stroke-opacity="1"
												stroke-linecap="round" stroke-width="9" stroke-dasharray="0"
												class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskzcdkpn5m)"
												pathTo="M 130.60694444444445 60.501000000000005 L 130.60694444444445 41.5635 C 130.60694444444445 38.5635 133.60694444444445 35.5635 136.60694444444445 35.5635 L 141.05972222222223 35.5635 C 144.05972222222223 35.5635 147.05972222222223 38.5635 147.05972222222223 41.5635 L 147.05972222222223 60.501000000000005 C 147.05972222222223 63.501000000000005 144.05972222222223 66.501 141.05972222222223 66.501 L 136.60694444444445 66.501 C 133.60694444444445 66.501 130.60694444444445 63.501000000000005 130.60694444444445 60.501000000000005 Z "
												pathFrom="M 130.60694444444445 66.501 L 130.60694444444445 66.501 L 147.05972222222223 66.501 L 147.05972222222223 66.501 L 147.05972222222223 66.501 L 147.05972222222223 66.501 L 147.05972222222223 66.501 L 130.60694444444445 66.501 Z"
												cy="31.0625" cx="147.05972222222223" j="3" val="45"
												barHeight="39.9375" barWidth="25.45277777777778"></path>
											<path id="SvgjsPath1270"
												d="M176.88472222222222 60.501000000000005L176.88472222222222 28.251000000000005C176.88472222222222 25.251000000000005 179.88472222222222 22.251000000000005 182.88472222222222 22.251000000000005L187.3375 22.251000000000005C190.3375 22.251000000000005 193.3375 25.251000000000005 193.3375 28.251000000000005L193.3375 60.501000000000005C193.3375 63.501000000000005 190.3375 66.501 187.3375 66.501L182.88472222222222 66.501C179.88472222222222 66.501 176.88472222222222 63.501000000000005 176.88472222222222 60.501000000000005C176.88472222222222 60.501000000000005 176.88472222222222 60.501000000000005 176.88472222222222 60.501000000000005 "
												fill="rgba(79,201,218,0.85)" fill-opacity="1"
												stroke="transparent" stroke-opacity="1"
												stroke-linecap="round" stroke-width="9" stroke-dasharray="0"
												class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskzcdkpn5m)"
												pathTo="M 176.88472222222222 60.501000000000005 L 176.88472222222222 28.251 C 176.88472222222222 25.251 179.88472222222222 22.251 182.88472222222222 22.251 L 187.3375 22.251 C 190.3375 22.251 193.3375 25.251 193.3375 28.251 L 193.3375 60.501000000000005 C 193.3375 63.501000000000005 190.3375 66.501 187.3375 66.501 L 182.88472222222222 66.501 C 179.88472222222222 66.501 176.88472222222222 63.501000000000005 176.88472222222222 60.501000000000005 Z "
												pathFrom="M 176.88472222222222 66.501 L 176.88472222222222 66.501 L 193.3375 66.501 L 193.3375 66.501 L 193.3375 66.501 L 193.3375 66.501 L 193.3375 66.501 L 176.88472222222222 66.501 Z"
												cy="17.75" cx="193.3375" j="4" val="60" barHeight="53.25"
												barWidth="25.45277777777778"></path>
											<path id="SvgjsPath1272"
												d="M223.16250000000002 60.501000000000005L223.16250000000002 14.938500000000005C223.16250000000002 11.938500000000005 226.16250000000002 8.938500000000005 229.16250000000002 8.938500000000005L233.6152777777778 8.938500000000005C236.6152777777778 8.938500000000005 239.6152777777778 11.938500000000005 239.6152777777778 14.938500000000005L239.6152777777778 60.501000000000005C239.6152777777778 63.501000000000005 236.6152777777778 66.501 233.6152777777778 66.501L229.16250000000002 66.501C226.16250000000002 66.501 223.16250000000002 63.501000000000005 223.16250000000002 60.501000000000005C223.16250000000002 60.501000000000005 223.16250000000002 60.501000000000005 223.16250000000002 60.501000000000005 "
												fill="rgba(79,201,218,0.85)" fill-opacity="1"
												stroke="transparent" stroke-opacity="1"
												stroke-linecap="round" stroke-width="9" stroke-dasharray="0"
												class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskzcdkpn5m)"
												pathTo="M 223.16250000000002 60.501000000000005 L 223.16250000000002 14.938500000000001 C 223.16250000000002 11.938500000000001 226.16250000000002 8.938500000000001 229.16250000000002 8.938500000000001 L 233.6152777777778 8.938500000000001 C 236.6152777777778 8.938500000000001 239.6152777777778 11.938500000000001 239.6152777777778 14.938500000000001 L 239.6152777777778 60.501000000000005 C 239.6152777777778 63.501000000000005 236.6152777777778 66.501 233.6152777777778 66.501 L 229.16250000000002 66.501 C 226.16250000000002 66.501 223.16250000000002 63.501000000000005 223.16250000000002 60.501000000000005 Z "
												pathFrom="M 223.16250000000002 66.501 L 223.16250000000002 66.501 L 239.6152777777778 66.501 L 239.6152777777778 66.501 L 239.6152777777778 66.501 L 239.6152777777778 66.501 L 239.6152777777778 66.501 L 223.16250000000002 66.501 Z"
												cy="4.4375" cx="239.6152777777778" j="5" val="75"
												barHeight="66.5625" barWidth="25.45277777777778"></path>
											<path id="SvgjsPath1274"
												d="M269.4402777777778 60.501000000000005L269.4402777777778 34.46350000000001C269.4402777777778 31.46350000000001 272.4402777777778 28.46350000000001 275.4402777777778 28.46350000000001L279.8930555555556 28.46350000000001C282.8930555555556 28.46350000000001 285.8930555555556 31.46350000000001 285.8930555555556 34.46350000000001L285.8930555555556 60.501000000000005C285.8930555555556 63.501000000000005 282.8930555555556 66.501 279.8930555555556 66.501L275.4402777777778 66.501C272.4402777777778 66.501 269.4402777777778 63.501000000000005 269.4402777777778 60.501000000000005C269.4402777777778 60.501000000000005 269.4402777777778 60.501000000000005 269.4402777777778 60.501000000000005 "
												fill="rgba(79,201,218,0.85)" fill-opacity="1"
												stroke="transparent" stroke-opacity="1"
												stroke-linecap="round" stroke-width="9" stroke-dasharray="0"
												class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskzcdkpn5m)"
												pathTo="M 269.4402777777778 60.501000000000005 L 269.4402777777778 34.46350000000001 C 269.4402777777778 31.46350000000001 272.4402777777778 28.463500000000007 275.4402777777778 28.463500000000007 L 279.8930555555556 28.463500000000007 C 282.8930555555556 28.463500000000007 285.8930555555556 31.46350000000001 285.8930555555556 34.46350000000001 L 285.8930555555556 60.501000000000005 C 285.8930555555556 63.501000000000005 282.8930555555556 66.501 279.8930555555556 66.501 L 275.4402777777778 66.501 C 272.4402777777778 66.501 269.4402777777778 63.501000000000005 269.4402777777778 60.501000000000005 Z "
												pathFrom="M 269.4402777777778 66.501 L 269.4402777777778 66.501 L 285.8930555555556 66.501 L 285.8930555555556 66.501 L 285.8930555555556 66.501 L 285.8930555555556 66.501 L 285.8930555555556 66.501 L 269.4402777777778 66.501 Z"
												cy="23.962500000000006" cx="285.8930555555556" j="6"
												val="53" barHeight="47.037499999999994"
												barWidth="25.45277777777778"></path>
											<g id="SvgjsG1259" class="apexcharts-bar-goals-markers">
											<g id="SvgjsG1261" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskzcdkpn5m)"></g>
											<g id="SvgjsG1263" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskzcdkpn5m)"></g>
											<g id="SvgjsG1265" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskzcdkpn5m)"></g>
											<g id="SvgjsG1267" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskzcdkpn5m)"></g>
											<g id="SvgjsG1269" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskzcdkpn5m)"></g>
											<g id="SvgjsG1271" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskzcdkpn5m)"></g>
											<g id="SvgjsG1273" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskzcdkpn5m)"></g></g>
											<g id="SvgjsG1260"
												class="apexcharts-bar-shadows apexcharts-hidden-element-shown"></g></g>
											<g id="SvgjsG1258"
												class="apexcharts-datalabels apexcharts-hidden-element-shown"
												data:realIndex="0"></g></g>
											<line id="SvgjsLine1283" x1="-31.166666666666664" y1="0"
												x2="308.83333333333337" y2="0" stroke="#b6b6b6"
												stroke-dasharray="0" stroke-width="1" stroke-linecap="butt"
												class="apexcharts-ycrosshairs"></line>
											<line id="SvgjsLine1284" x1="-31.166666666666664" y1="0"
												x2="308.83333333333337" y2="0" stroke-dasharray="0"
												stroke-width="0" stroke-linecap="butt"
												class="apexcharts-ycrosshairs-hidden"></line>
											<g id="SvgjsG1285" class="apexcharts-xaxis"
												transform="translate(0, 0)">
											<g id="SvgjsG1286" class="apexcharts-xaxis-texts-g"
												transform="translate(0, -4)"></g></g>
											<g id="SvgjsG1296"
												class="apexcharts-yaxis-annotations apexcharts-hidden-element-shown"></g>
											<g id="SvgjsG1297"
												class="apexcharts-xaxis-annotations apexcharts-hidden-element-shown"></g>
											<g id="SvgjsG1298"
												class="apexcharts-point-annotations apexcharts-hidden-element-shown"></g></g></svg>
										<div class="apexcharts-tooltip apexcharts-theme-light">
											<div class="apexcharts-tooltip-title"
												style="font-family: inherit; font-size: 12px;"></div>
											<div class="apexcharts-tooltip-series-group"
												style="order: 1;">
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
											class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
											<div class="apexcharts-yaxistooltip-text"></div>
										</div>
									</div>
								</div>
								<!--end::Chart-->
							</div>
							<!--end::Card body-->
						</div>
						<!--end::Card widget 6-->


						<!--begin::Card widget 7-->
						<div class="card card-flush h-md-50 mb-xl-10">
							<!--begin::Header-->
							<div class="card-header pt-5">
								<!--begin::Title-->
								<div class="card-title d-flex flex-column">
									<!--begin::Amount-->
									<span class="fs-2hx fw-bold text-gray-900 me-2 lh-1 ls-n2">6.3k</span>
									<!--end::Amount-->

									<!--begin::Subtitle-->
									<span class="text-gray-500 pt-1 fw-semibold fs-6">New
										Customers This Month</span>
									<!--end::Subtitle-->
								</div>
								<!--end::Title-->
							</div>
							<!--end::Header-->

							<!--begin::Card body-->
							<div
								class="card-body d-flex flex-column justify-content-end pe-0">
								<!--begin::Title-->
								<span class="fs-6 fw-bolder text-gray-800 d-block mb-2">Today’s
									Heroes</span>
								<!--end::Title-->

								<!--begin::Users group-->
								<div class="symbol-group symbol-hover flex-nowrap">
									<div class="symbol symbol-35px symbol-circle"
										data-bs-toggle="tooltip" data-bs-original-title="Alan Warden"
										data-kt-initialized="1">
										<span
											class="symbol-label bg-warning text-inverse-warning fw-bold">A</span>
									</div>
									<div class="symbol symbol-35px symbol-circle"
										data-bs-toggle="tooltip" aria-label="Michael Eberon"
										data-bs-original-title="Michael Eberon"
										data-kt-initialized="1">
									</div>
									<div class="symbol symbol-35px symbol-circle"
										data-bs-toggle="tooltip"
										data-bs-original-title="Susan Redwood" data-kt-initialized="1">
										<span
											class="symbol-label bg-primary text-inverse-primary fw-bold">S</span>
									</div>
									<div class="symbol symbol-35px symbol-circle"
										data-bs-toggle="tooltip" aria-label="Melody Macy"
										data-bs-original-title="Melody Macy" data-kt-initialized="1">
									</div>
									<div class="symbol symbol-35px symbol-circle"
										data-bs-toggle="tooltip"
										data-bs-original-title="Perry Matthew" data-kt-initialized="1">
										<span
											class="symbol-label bg-danger text-inverse-danger fw-bold">P</span>
									</div>
									<div class="symbol symbol-35px symbol-circle"
										data-bs-toggle="tooltip" aria-label="Barry Walter"
										data-bs-original-title="Barry Walter" data-kt-initialized="1">
									</div>
									<a href="#" class="symbol symbol-35px symbol-circle"
										data-bs-toggle="modal" data-bs-target="#kt_modal_view_users">
										<span class="symbol-label bg-light text-gray-400 fs-8 fw-bold">+42</span>
									</a>
								</div>
								<!--end::Users group-->
							</div>
							<!--end::Card body-->
						</div>
						<!--end::Card widget 7-->
					</div>
					<!--end::Col-->

					<!--begin::Col-->
					<div class="col-lg-12 col-xl-12 col-xxl-6 mb-5 mb-xl-0">
						
						<div class="card card-flush h-xl-100">
							<div class="card-header pt-7">
								<h3 class="card-title">
									<span>
										<i class="ki-duotone ki-information-4 fs-2tx me-3">
											 <span class="path1"></span>
											 <span class="path2"></span>
											 <span class="path3"></span>
										</i>
									</span>
									<span class="card-label fw-bold text-gray-900 fs-2x">공지사항</span>
								</h3>  

								<div class="card-toolbar">
									<div class="d-flex flex-stack flex-wrap gap-4">
										<button class="btn btn-light btn-lg btn-light-primary" onclick="location.href='/groubear/cmntyNoticeList.do'">더보기</button>
									</div>
								</div>
							</div>

							<div class="card-body">
								<!--begin::Table-->
								<div id="kt_table_widget_5_table_wrapper"
									class="dt-container dt-bootstrap5 dt-empty-footer">
									<div id="" class="table-responsive">
										<table
											class="table align-middle table-row-dashed fs-6 gy-3 dataTable"
											id="kt_table_widget_5_table" style="width: 100%;">
											<colgroup>
												<col style="width: 7%;">
												<col style="width: 30%;">
												<col style="width: 10%;">
												<col style="width: 18%;"> 
												<col style="width: 10%;">
											</colgroup>
											<thead>
												<tr class="text-gray-500 fw-bold fs-7 text-uppercase gs-0 text-center">
													<th class="text-center h4">번호</th> 
													<th class="text-start h4">제목</th> 
													<th class="text-center h4">등록자</th>
													<th class="text-center h4">등록일시</th>  
													<th class="text-center h4">조회수</th>  
												</tr>
											</thead> 

											<tbody class="fw-bold text-gray-600">  
																			
												<c:choose>
													<c:when test="${empty cmntyNoticeList }">
														<tr>
															<td colspan="6" class="text-center pt-5">조회하신 게시글이 존재하지 않습니다.</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach items="${cmntyNoticeList }" var="cmntyNoticeVO">
															<c:choose>
																<c:when test="${cmntyNoticeVO.cmntyNoticeYn eq 'Y' }">
																	<tr style="height: 3.5em;">
																		<td class="text-center">${cmntyNoticeVO.cmntyNo }</td> 
																		<td>
																			<div>
																				<div class="text-start txt_line">
																						<a href="/groubear/cmntyNoticeDetail.do?cmntyNo=${cmntyNoticeVO.cmntyNo }">
																							<font class="fw-bold" style="color: red">[공지] </font>
																							<font class="fw-bold text-gray-800">${cmntyNoticeVO.cmntyTtl }</font>
																						</a> 
																				</div>  
																			</div> 
																		</td> 
																		<td>  
																			<div class="text-center">${cmntyNoticeVO.empId }</div>
																		</td>
																		<td>
																			<div class="text-center">
																			    <c:out value="${fn:substring(cmntyNoticeVO.cmntyRegDt, 0, 10)}" />
																			</div>
																		</td>  
																		<td class="text-end text-center">${cmntyNoticeVO.cmntyInqCnt }</td>
																	</tr>
																</c:when>
																<c:otherwise> 
																	<tr style="height: 3.5em;">
																		<td class="text-center">${cmntyNoticeVO.cmntyNo }</td> 
																		<td>
																			<div>
																				<div class="text-start">
																						<a href="/groubear/cmntyNoticeDetail.do?cmntyNo=${cmntyNoticeVO.cmntyNo }">
																							<font class="text-gray-800">${cmntyNoticeVO.cmntyTtl }</font>
																						</a> 
																				</div>  
																			</div> 
																		</td> 
																		<td>  
																			<div class="text-center">${cmntyNoticeVO.empId }</div>
																		</td>
																		<td>
																			<div class="text-center">
																			    <c:out value="${fn:substring(cmntyNoticeVO.cmntyRegDt, 0, 10)}" />
																			</div>
																		</td>  
																		<td class="text-end text-center">${cmntyNoticeVO.cmntyInqCnt }</td>
																	</tr>
																</c:otherwise>
															</c:choose>
														</c:forEach>  
													</c:otherwise>
												</c:choose>
													
											</tbody>
										</table>
									</div>
								</div>
							
								<div class="d-flex justify-content-center">
									<button class="btn btn-secondary p-0 ki-duotone ki-dots-vertical text-dark" onclick="location.href='/groubear/cmntyNoticeList.do'">
										<i class="fw-bold fs-1 p-0">
											 <span class="path1"></span>
											 <span class="path2"></span> 
											 <span class="path3"></span>
										</i>
									</button>
								</div>
							</div>
						</div>
					
					</div>
					<!--end::Col-->
				</div>
				<!--end::Row-->

				<div class="row g-5 g-xxl-10">
					<!--begin::Col-->
					<div class="col-xl-4 mb-xl-5 mb-xxl-10">
						<!--begin::Chart widget 9-->
						<div class="card card-flush h-xl-100">
							<!--begin::Header-->
							<div class="card-header pt-5">
								<!--begin::Title-->
								<div class="card-title d-flex flex-column">
									<!--begin::Info-->
									<div class="d-flex align-items-center">
										<!--begin::Currency-->
										<span
											class="fs-4 fw-semibold text-gray-500 me-1 align-self-start">$</span>
										<!--end::Currency-->

										<!--begin::Amount-->
										<span class="fs-2hx fw-bold text-gray-900 me-2 lh-1">47,07</span>
										<!--end::Amount-->

										<!--begin::Badge-->
										<span
											class="badge badge-success fs-6 lh-1 py-1 px-2 d-flex flex-center"
											style="height: 22px"> <i
											class="ki-duotone ki-black-up fs-7 text-white ms-n1"></i>
											2.2%
										</span>
										<!--end::Badge-->
									</div>
									<!--end::Info-->

									<!--begin::Subtitle-->
									<span
										class="d-flex align-items-center text-gray-500 pt-1 fw-semibold fs-6">
										Avg order Value <span class="ms-1" data-bs-toggle="tooltip"
										data-bs-placement="right" title=""
										data-bs-original-title="Recent Stats" data-kt-initialized="1">
											<i class="ki-duotone ki-information fs-2 text-primary"><span
												class="path1"></span><span class="path2"></span><span
												class="path3"></span></i>
									</span>
									</span>
									<!--end::Subtitle-->
								</div>
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

							<!--begin::Body-->
							<div class="card-body d-flex align-items-end pb-6 ps-4 pe-6">
								<!--begin::Chart-->
								<div id="" class="w-100 min-h-auto"
									style="height: 250px; min-height: 265px;">
									<div id="apexcharts2cmtcw82l"
										class="apexcharts-canvas apexcharts2cmtcw82l apexcharts-theme-"
										style="width: 459px; height: 250px;">
										<svg id="SvgjsSvg1298" width="459" height="250"
											xmlns="http://www.w3.org/2000/svg" version="1.1"
											xmlns:xlink="http://www.w3.org/1999/xlink"
											xmlns:svgjs="http://svgjs.dev"
											class="apexcharts-svg apexcharts-zoomable hovering-zoom"
											xmlns:data="ApexChartsNS" transform="translate(0, 0)">
											<foreignObject x="0" y="0" width="459" height="250">
											<div class="apexcharts-legend"
												xmlns="http://www.w3.org/1999/xhtml"
												style="max-height: 125px;"></div></foreignObject>
											<g id="SvgjsG1305" class="apexcharts-datalabels-group"
												transform="translate(0, 0) scale(1)"></g>
											<g id="SvgjsG1306" class="apexcharts-datalabels-group"
												transform="translate(0, 0) scale(1)"></g>
											<rect id="SvgjsRect1335" width="0" height="0" x="0" y="0"
												rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fefefe"></rect>
											<g id="SvgjsG1362" class="apexcharts-yaxis" rel="0"
												transform="translate(11.739583969116211, 0)">
											<g id="SvgjsG1363" class="apexcharts-yaxis-texts-g">
											<text id="SvgjsText1365" font-family="inherit" x="20" y="34"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#b5b0a1"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1366">32</tspan>
											<title>32</title></text>
											<text id="SvgjsText1368" font-family="inherit" x="20"
												y="52.2348" text-anchor="end" dominant-baseline="auto"
												font-size="12px" font-weight="400" fill="#b5b0a1"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1369">30</tspan>
											<title>30</title></text>
											<text id="SvgjsText1371" font-family="inherit" x="20"
												y="70.4696" text-anchor="end" dominant-baseline="auto"
												font-size="12px" font-weight="400" fill="#b5b0a1"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1372">28</tspan>
											<title>28</title></text>
											<text id="SvgjsText1374" font-family="inherit" x="20"
												y="88.70439999999999" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#b5b0a1"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1375">26</tspan>
											<title>26</title></text>
											<text id="SvgjsText1377" font-family="inherit" x="20"
												y="106.9392" text-anchor="end" dominant-baseline="auto"
												font-size="12px" font-weight="400" fill="#b5b0a1"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1378">24</tspan>
											<title>24</title></text>
											<text id="SvgjsText1380" font-family="inherit" x="20"
												y="125.174" text-anchor="end" dominant-baseline="auto"
												font-size="12px" font-weight="400" fill="#b5b0a1"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1381">22</tspan>
											<title>22</title></text>
											<text id="SvgjsText1383" font-family="inherit" x="20"
												y="143.4088" text-anchor="end" dominant-baseline="auto"
												font-size="12px" font-weight="400" fill="#b5b0a1"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1384">20</tspan>
											<title>20</title></text>
											<text id="SvgjsText1386" font-family="inherit" x="20"
												y="161.64360000000002" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#b5b0a1"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1387">18</tspan>
											<title>18</title></text>
											<text id="SvgjsText1389" font-family="inherit" x="20"
												y="179.87840000000003" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#b5b0a1"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1390">16</tspan>
											<title>16</title></text>
											<text id="SvgjsText1392" font-family="inherit" x="20"
												y="198.11320000000003" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#b5b0a1"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1393">14</tspan>
											<title>14</title></text>
											<text id="SvgjsText1395" font-family="inherit" x="20"
												y="216.34800000000004" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#b5b0a1"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1396">12</tspan>
											<title>12</title></text></g></g>
											<g id="SvgjsG1300"
												class="apexcharts-inner apexcharts-graphical"
												transform="translate(41.73958396911621, 30)">
											<defs id="SvgjsDefs1299">
											<clipPath id="gridRectMask2cmtcw82l">
											<rect id="SvgjsRect1303" width="415.2604160308838"
												height="190.348" x="-4" y="-4" rx="0" ry="0" opacity="1"
												stroke-width="0" stroke="none" stroke-dasharray="0"
												fill="#fff"></rect></clipPath>
											<clipPath id="forecastMask2cmtcw82l"></clipPath>
											<clipPath id="nonForecastMask2cmtcw82l"></clipPath>
											<clipPath id="gridRectMarkerMask2cmtcw82l">
											<rect id="SvgjsRect1304" width="411.2604160308838"
												height="186.348" x="-2" y="-2" rx="0" ry="0" opacity="1"
												stroke-width="0" stroke="none" stroke-dasharray="0"
												fill="#fff"></rect></clipPath></defs>
											<g id="SvgjsG1318" class="apexcharts-grid">
											<g id="SvgjsG1319" class="apexcharts-gridlines-horizontal">
											<line id="SvgjsLine1323" x1="0" y1="18.2348"
												x2="407.2604160308838" y2="18.2348" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1324" x1="0" y1="36.4696"
												x2="407.2604160308838" y2="36.4696" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1325" x1="0" y1="54.7044"
												x2="407.2604160308838" y2="54.7044" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1326" x1="0" y1="72.9392"
												x2="407.2604160308838" y2="72.9392" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1327" x1="0" y1="91.174"
												x2="407.2604160308838" y2="91.174" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1328" x1="0" y1="109.40880000000001"
												x2="407.2604160308838" y2="109.40880000000001"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1329" x1="0" y1="127.64360000000002"
												x2="407.2604160308838" y2="127.64360000000002"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1330" x1="0" y1="145.87840000000003"
												x2="407.2604160308838" y2="145.87840000000003"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1331" x1="0" y1="164.11320000000003"
												x2="407.2604160308838" y2="164.11320000000003"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1332" x1="0" y1="182.34800000000004"
												x2="407.2604160308838" y2="182.34800000000004"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line></g>
											<g id="SvgjsG1320" class="apexcharts-gridlines-vertical"></g>
											<line id="SvgjsLine1334" x1="0" y1="182.348"
												x2="407.2604160308838" y2="182.348" stroke="transparent"
												stroke-dasharray="0" stroke-linecap="butt"></line>
											<line id="SvgjsLine1333" x1="0" y1="1" x2="0" y2="182.348"
												stroke="transparent" stroke-dasharray="0"
												stroke-linecap="butt"></line></g>
											<g id="SvgjsG1321" class="apexcharts-grid-borders">
											<line id="SvgjsLine1322" x1="0" y1="0" x2="407.2604160308838"
												y2="0" stroke="#eaeaea" stroke-dasharray="4"
												stroke-linecap="butt" class="apexcharts-gridline"></line></g>
											<g id="SvgjsG1307"
												class="apexcharts-area-series apexcharts-plot-series">
											<g id="SvgjsG1308" class="apexcharts-series" zIndex="0"
												seriesName="Order" data:longestSeries="true" rel="1"
												data:realIndex="0">
											<path id="SvgjsPath1311"
												d="M0 100.29139999999998C23.756857601801553 100.29139999999998 44.11987840334574 100.29139999999998 67.8767360051473 100.29139999999998C91.63359360694885 100.29139999999998 111.99661440849303 54.70439999999999 135.7534720102946 54.70439999999999C159.51032961209614 54.70439999999999 179.87335041364034 54.70439999999999 203.6302080154419 54.70439999999999C227.38706561724345 54.70439999999999 247.75008641878762 9.117399999999975 271.5069440205892 9.117399999999975C295.26380162239076 9.117399999999975 315.6268224239349 9.117399999999975 339.3836800257365 9.117399999999975C363.14053762753804 9.117399999999975 383.50355842908226 45.58699999999999 407.2604160308838 45.58699999999999C407.2604160308838 45.58699999999999 407.2604160308838 45.58699999999999 407.2604160308838 182.348L0 182.348C0 182.348 0 100.29139999999998 0 100.29139999999998 "
												fill="rgba(246,241,233,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="butt" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-area" index="0"
												clip-path="url(#gridRectMask2cmtcw82l)"
												pathTo="M 0 100.29139999999998C 23.756857601801553 100.29139999999998 44.11987840334574 100.29139999999998 67.8767360051473 100.29139999999998C 91.63359360694885 100.29139999999998 111.99661440849303 54.70439999999999 135.7534720102946 54.70439999999999C 159.51032961209614 54.70439999999999 179.87335041364034 54.70439999999999 203.6302080154419 54.70439999999999C 227.38706561724345 54.70439999999999 247.75008641878762 9.117399999999975 271.5069440205892 9.117399999999975C 295.26380162239076 9.117399999999975 315.6268224239349 9.117399999999975 339.3836800257365 9.117399999999975C 363.14053762753804 9.117399999999975 383.50355842908226 45.58699999999999 407.2604160308838 45.58699999999999C 407.2604160308838 45.58699999999999 407.2604160308838 45.58699999999999 407.2604160308838 182.348 L 0 182.348z"
												pathFrom="M 0 291.7568 L 0 291.7568 L 67.8767360051473 291.7568 L 135.7534720102946 291.7568 L 203.6302080154419 291.7568 L 271.5069440205892 291.7568 L 339.3836800257365 291.7568 L 407.2604160308838 291.7568z"></path>
											<path id="SvgjsPath1312"
												d="M0 100.29139999999998C23.756857601801553 100.29139999999998 44.11987840334574 100.29139999999998 67.8767360051473 100.29139999999998C91.63359360694885 100.29139999999998 111.99661440849303 54.70439999999999 135.7534720102946 54.70439999999999C159.51032961209614 54.70439999999999 179.87335041364034 54.70439999999999 203.6302080154419 54.70439999999999C227.38706561724345 54.70439999999999 247.75008641878762 9.117399999999975 271.5069440205892 9.117399999999975C295.26380162239076 9.117399999999975 315.6268224239349 9.117399999999975 339.3836800257365 9.117399999999975C363.14053762753804 9.117399999999975 383.50355842908226 45.58699999999999 407.2604160308838 45.58699999999999C407.2604160308838 45.58699999999999 407.2604160308838 45.58699999999999 407.2604160308838 45.58699999999999 "
												fill="none" fill-opacity="1" stroke="#f6f1e9"
												stroke-opacity="1" stroke-linecap="butt" stroke-width="4"
												stroke-dasharray="0" class="apexcharts-area" index="0"
												clip-path="url(#gridRectMask2cmtcw82l)"
												pathTo="M 0 100.29139999999998C 23.756857601801553 100.29139999999998 44.11987840334574 100.29139999999998 67.8767360051473 100.29139999999998C 91.63359360694885 100.29139999999998 111.99661440849303 54.70439999999999 135.7534720102946 54.70439999999999C 159.51032961209614 54.70439999999999 179.87335041364034 54.70439999999999 203.6302080154419 54.70439999999999C 227.38706561724345 54.70439999999999 247.75008641878762 9.117399999999975 271.5069440205892 9.117399999999975C 295.26380162239076 9.117399999999975 315.6268224239349 9.117399999999975 339.3836800257365 9.117399999999975C 363.14053762753804 9.117399999999975 383.50355842908226 45.58699999999999 407.2604160308838 45.58699999999999"
												pathFrom="M 0 291.7568 L 0 291.7568 L 67.8767360051473 291.7568 L 135.7534720102946 291.7568 L 203.6302080154419 291.7568 L 271.5069440205892 291.7568 L 339.3836800257365 291.7568 L 407.2604160308838 291.7568"
												fill-rule="evenodd"></path>
											<g id="SvgjsG1309"
												class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown"
												data:realIndex="0">
											<g class="apexcharts-series-markers">
											<path id="SvgjsPath1400"
												d="M 135.7534720102946, 0 
           m -0, 0 
           a 0,0 0 1,0 0,0 
           a 0,0 0 1,0 -0,0"
												fill="#f6f1e9" fill-opacity="1" stroke="#4fc9da"
												stroke-opacity="0.9" stroke-linecap="butt" stroke-width="3"
												stroke-dasharray="0" cx="135.7534720102946" cy="0"
												shape="circle"
												class="apexcharts-marker wr8hydt8rk no-pointer-events"
												default-marker-size="0"></path></g></g></g>
											<g id="SvgjsG1313" class="apexcharts-series" zIndex="1"
												seriesName="Revenue" data:longestSeries="true" rel="2"
												data:realIndex="1">
											<path id="SvgjsPath1316"
												d="M0 182.348C23.756857601801553 182.348 44.11987840334574 145.8784 67.8767360051473 145.8784C91.63359360694885 145.8784 111.99661440849303 145.8784 135.7534720102946 145.8784C159.51032961209614 145.8784 179.87335041364034 100.29139999999998 203.6302080154419 100.29139999999998C227.38706561724345 100.29139999999998 247.75008641878762 100.29139999999998 271.5069440205892 100.29139999999998C295.26380162239076 100.29139999999998 315.6268224239349 127.64359999999999 339.3836800257365 127.64359999999999C363.14053762753804 127.64359999999999 383.50355842908226 127.64359999999999 407.2604160308838 127.64359999999999C407.2604160308838 127.64359999999999 407.2604160308838 127.64359999999999 407.2604160308838 182.348L0 182.348C0 182.348 0 182.348 0 182.348 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="butt" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-area" index="1"
												clip-path="url(#gridRectMask2cmtcw82l)"
												pathTo="M 0 182.348C 23.756857601801553 182.348 44.11987840334574 145.8784 67.8767360051473 145.8784C 91.63359360694885 145.8784 111.99661440849303 145.8784 135.7534720102946 145.8784C 159.51032961209614 145.8784 179.87335041364034 100.29139999999998 203.6302080154419 100.29139999999998C 227.38706561724345 100.29139999999998 247.75008641878762 100.29139999999998 271.5069440205892 100.29139999999998C 295.26380162239076 100.29139999999998 315.6268224239349 127.64359999999999 339.3836800257365 127.64359999999999C 363.14053762753804 127.64359999999999 383.50355842908226 127.64359999999999 407.2604160308838 127.64359999999999C 407.2604160308838 127.64359999999999 407.2604160308838 127.64359999999999 407.2604160308838 182.348 L 0 182.348z"
												pathFrom="M 0 291.7568 L 0 291.7568 L 67.8767360051473 291.7568 L 135.7534720102946 291.7568 L 203.6302080154419 291.7568 L 271.5069440205892 291.7568 L 339.3836800257365 291.7568 L 407.2604160308838 291.7568z"></path>
											<path id="SvgjsPath1317"
												d="M0 182.348C23.756857601801553 182.348 44.11987840334574 145.8784 67.8767360051473 145.8784C91.63359360694885 145.8784 111.99661440849303 145.8784 135.7534720102946 145.8784C159.51032961209614 145.8784 179.87335041364034 100.29139999999998 203.6302080154419 100.29139999999998C227.38706561724345 100.29139999999998 247.75008641878762 100.29139999999998 271.5069440205892 100.29139999999998C295.26380162239076 100.29139999999998 315.6268224239349 127.64359999999999 339.3836800257365 127.64359999999999C363.14053762753804 127.64359999999999 383.50355842908226 127.64359999999999 407.2604160308838 127.64359999999999C407.2604160308838 127.64359999999999 407.2604160308838 127.64359999999999 407.2604160308838 127.64359999999999 "
												fill="none" fill-opacity="1" stroke="#f6f1e9"
												stroke-opacity="1" stroke-linecap="butt" stroke-width="4"
												stroke-dasharray="0" class="apexcharts-area" index="1"
												clip-path="url(#gridRectMask2cmtcw82l)"
												pathTo="M 0 182.348C 23.756857601801553 182.348 44.11987840334574 145.8784 67.8767360051473 145.8784C 91.63359360694885 145.8784 111.99661440849303 145.8784 135.7534720102946 145.8784C 159.51032961209614 145.8784 179.87335041364034 100.29139999999998 203.6302080154419 100.29139999999998C 227.38706561724345 100.29139999999998 247.75008641878762 100.29139999999998 271.5069440205892 100.29139999999998C 295.26380162239076 100.29139999999998 315.6268224239349 127.64359999999999 339.3836800257365 127.64359999999999C 363.14053762753804 127.64359999999999 383.50355842908226 127.64359999999999 407.2604160308838 127.64359999999999"
												pathFrom="M 0 291.7568 L 0 291.7568 L 67.8767360051473 291.7568 L 135.7534720102946 291.7568 L 203.6302080154419 291.7568 L 271.5069440205892 291.7568 L 339.3836800257365 291.7568 L 407.2604160308838 291.7568"
												fill-rule="evenodd"></path>
											<g id="SvgjsG1314"
												class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown"
												data:realIndex="1">
											<g class="apexcharts-series-markers">
											<path id="SvgjsPath1401"
												d="M 135.7534720102946, 0 
           m -0, 0 
           a 0,0 0 1,0 0,0 
           a 0,0 0 1,0 -0,0"
												fill="#4fc9da" fill-opacity="1" stroke="#dad3c3"
												stroke-opacity="0.9" stroke-linecap="butt" stroke-width="3"
												stroke-dasharray="0" cx="135.7534720102946" cy="0"
												shape="circle"
												class="apexcharts-marker wce3s0n1zl no-pointer-events"
												default-marker-size="0"></path></g></g></g>
											<g id="SvgjsG1310" class="apexcharts-datalabels"
												data:realIndex="0"></g>
											<g id="SvgjsG1315" class="apexcharts-datalabels"
												data:realIndex="1"></g></g>
											<line id="SvgjsLine1336" x1="135.2534720102946" y1="0"
												x2="135.2534720102946" y2="182.348" stroke="#b5b0a1"
												stroke-dasharray="3" stroke-linecap="butt"
												class="apexcharts-xcrosshairs" x="135.2534720102946" y="0"
												width="1" height="182.348" fill="#b1b9c4" filter="none"
												fill-opacity="0.9" stroke-width="1"></line>
											<line id="SvgjsLine1337" x1="0" y1="0" x2="407.2604160308838"
												y2="0" stroke="#b6b6b6" stroke-dasharray="0"
												stroke-width="1" stroke-linecap="butt"
												class="apexcharts-ycrosshairs"></line>
											<line id="SvgjsLine1338" x1="0" y1="0" x2="407.2604160308838"
												y2="0" stroke-dasharray="0" stroke-width="0"
												stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line>
											<g id="SvgjsG1339" class="apexcharts-xaxis"
												transform="translate(0, 0)">
											<g id="SvgjsG1340" class="apexcharts-xaxis-texts-g"
												transform="translate(0, -4)">
											<text id="SvgjsText1342" font-family="inherit" x="0"
												y="210.348" text-anchor="middle" dominant-baseline="auto"
												font-size="12px" font-weight="400" fill="#b5b0a1"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1343"></tspan>
											<title></title></text>
											<text id="SvgjsText1345" font-family="inherit"
												x="67.87673600514731" y="210.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#b5b0a1"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1346">06 Sep</tspan>
											<title>06 Sep</title></text>
											<text id="SvgjsText1348" font-family="inherit"
												x="135.7534720102946" y="210.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#b5b0a1"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1349">13 Sep</tspan>
											<title>13 Sep</title></text>
											<text id="SvgjsText1351" font-family="inherit"
												x="203.63020801544187" y="210.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#b5b0a1"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1352">20 Sep</tspan>
											<title>20 Sep</title></text>
											<text id="SvgjsText1354" font-family="inherit"
												x="271.5069440205891" y="210.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#b5b0a1"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1355">27 Sep</tspan>
											<title>27 Sep</title></text>
											<text id="SvgjsText1357" font-family="inherit"
												x="339.3836800257364" y="210.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#b5b0a1"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1358">30 Sep</tspan>
											<title>30 Sep</title></text>
											<text id="SvgjsText1360" font-family="inherit"
												x="407.2604160308837" y="210.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#b5b0a1"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1361"></tspan>
											<title></title></text></g></g>
											<g id="SvgjsG1397"
												class="apexcharts-yaxis-annotations apexcharts-hidden-element-shown"></g>
											<g id="SvgjsG1398"
												class="apexcharts-xaxis-annotations apexcharts-hidden-element-shown"></g>
											<g id="SvgjsG1399"
												class="apexcharts-point-annotations apexcharts-hidden-element-shown"></g>
											<rect id="SvgjsRect1402" width="0" height="0" x="0" y="0"
												rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fefefe"
												class="apexcharts-zoom-rect"></rect>
											<rect id="SvgjsRect1403" width="0" height="0" x="0" y="0"
												rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
												stroke-dasharray="0" fill="#fefefe"
												class="apexcharts-selection-rect"></rect></g></svg>
										<div class="apexcharts-tooltip apexcharts-theme-light"
											style="left: 188.493px; top: 57.7044px;">
											<div class="apexcharts-tooltip-title"
												style="font-family: inherit; font-size: 12px;">13 Sep</div>
											<div
												class="apexcharts-tooltip-series-group apexcharts-active"
												style="order: 1; display: flex;">
												<span class="apexcharts-tooltip-marker"
													style="background-color: rgb(246, 241, 233);"></span>
												<div class="apexcharts-tooltip-text"
													style="font-family: inherit; font-size: 12px;">
													<div class="apexcharts-tooltip-y-group">
														<span class="apexcharts-tooltip-text-y-label">Order:
														</span><span class="apexcharts-tooltip-text-y-value">$26
															thousands</span>
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
											<div
												class="apexcharts-tooltip-series-group apexcharts-active"
												style="order: 2; display: flex;">
												<span class="apexcharts-tooltip-marker"
													style="background-color: rgb(79, 201, 218);"></span>
												<div class="apexcharts-tooltip-text"
													style="font-family: inherit; font-size: 12px;">
													<div class="apexcharts-tooltip-y-group">
														<span class="apexcharts-tooltip-text-y-label">Revenue:
														</span><span class="apexcharts-tooltip-text-y-value">$16
															thousands</span>
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
											class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light"
											style="left: 148.134px; top: 214.348px;">
											<div class="apexcharts-xaxistooltip-text"
												style="font-family: inherit; font-size: 12px; min-width: 34.5729px;">13
												Sep</div>
										</div>
										<div
											class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
											<div class="apexcharts-yaxistooltip-text"></div>
										</div>
									</div>
								</div>
								<!--end::Chart-->
							</div>
							<!--end::Body-->
						</div>
						<!--end::Chart widget 9-->
					</div>
					<!--end::Col-->

					<!--begin::Col-->
					<div class="col-xl-8 mb-5 mb-xxl-10">

						<!--begin::Chart Widget 1-->
						<div class="card card-flush h-xl-100">
							<!--begin::Header-->
							<div class="card-header pt-5">
								<!--begin::Title-->
								<h3 class="card-title align-items-start flex-column">
									<span class="card-label fw-bold text-gray-900">Instagram
										Subscribers</span> <span class="text-gray-500 pt-2 fw-semibold fs-6">75%
										activity growth</span>
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
										<i class="ki-duotone ki-dots-square fs-1 text-gray-500 me-n1"><span
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

							<!--begin::Body-->
							<div class="card-body pt-0 px-0">
								<!--begin::Chart--> 
								<div id=""
									data-kt-negative-color="rgba(150, 142, 126, 0.2)"
									class="min-h-auto ps-4 pe-6 mb-3"
									style="height: 300px; min-height: 315px;">
									<div id="apexchartsmrwmnewv"
										class="apexcharts-canvas apexchartsmrwmnewv apexcharts-theme-"
										style="width: 984.5px; height: 300px;">
										<svg id="SvgjsSvg1006" width="984.5" height="300"
											xmlns="http://www.w3.org/2000/svg" version="1.1"
											xmlns:xlink="http://www.w3.org/1999/xlink"
											xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg"
											xmlns:data="ApexChartsNS" transform="translate(0, 0)">
											<foreignObject x="0" y="0" width="984.5" height="300">
											<div class="apexcharts-legend"
												xmlns="http://www.w3.org/1999/xhtml"
												style="max-height: 150px;"></div></foreignObject>
											<g id="SvgjsG1013" class="apexcharts-datalabels-group"
												transform="translate(0, 0) scale(1)"></g>
											<g id="SvgjsG1014" class="apexcharts-datalabels-group"
												transform="translate(0, 0) scale(1)"></g>
											<g id="SvgjsG1158" class="apexcharts-yaxis" rel="0"
												transform="translate(24.92708396911621, 0)">
											<g id="SvgjsG1159" class="apexcharts-yaxis-texts-g">
											<text id="SvgjsText1161" font-family="inherit" x="20" y="34"
												text-anchor="end" dominant-baseline="auto" font-size="12px"
												font-weight="400" fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1162">80K</tspan>
											<title>80K</title></text>
											<text id="SvgjsText1164" font-family="inherit" x="20"
												y="72.72466666666668" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1165">58K</tspan>
											<title>58K</title></text>
											<text id="SvgjsText1167" font-family="inherit" x="20"
												y="111.44933333333336" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1168">36K</tspan>
											<title>36K</title></text>
											<text id="SvgjsText1170" font-family="inherit" x="20"
												y="150.17400000000004" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1171">15K</tspan>
											<title>15K</title></text>
											<text id="SvgjsText1173" font-family="inherit" x="20"
												y="188.8986666666667" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1174">-6K</tspan>
											<title>-6K</title></text>
											<text id="SvgjsText1176" font-family="inherit" x="20"
												y="227.6233333333334" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1177">-28K</tspan>
											<title>-28K</title></text>
											<text id="SvgjsText1179" font-family="inherit" x="20"
												y="266.34800000000007" text-anchor="end"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-yaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1180">-50K</tspan>
											<title>-50K</title></text></g></g>
											<g id="SvgjsG1008"
												class="apexcharts-inner apexcharts-graphical"
												transform="translate(54.92708396911621, 30)">
											<defs id="SvgjsDefs1007">
											<clipPath id="gridRectMaskmrwmnewv">
											<rect id="SvgjsRect1011" width="903.1666660308838"
												height="236.348" x="-2" y="-2" rx="0" ry="0" opacity="1"
												stroke-width="0" stroke="none" stroke-dasharray="0"
												fill="#fff"></rect></clipPath>
											<clipPath id="forecastMaskmrwmnewv"></clipPath>
											<clipPath id="nonForecastMaskmrwmnewv"></clipPath>
											<clipPath id="gridRectMarkerMaskmrwmnewv">
											<rect id="SvgjsRect1012" width="903.1666660308838"
												height="236.348" x="-2" y="-2" rx="0" ry="0" opacity="1"
												stroke-width="0" stroke="none" stroke-dasharray="0"
												fill="#fff"></rect></clipPath></defs>
											<g id="SvgjsG1090" class="apexcharts-grid">
											<g id="SvgjsG1091" class="apexcharts-gridlines-horizontal">
											<line id="SvgjsLine1095" x1="0" y1="38.72466666666667"
												x2="899.1666660308838" y2="38.72466666666667"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1096" x1="0" y1="77.44933333333334"
												x2="899.1666660308838" y2="77.44933333333334"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1097" x1="0" y1="116.174"
												x2="899.1666660308838" y2="116.174" stroke="#eaeaea"
												stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1098" x1="0" y1="154.89866666666668"
												x2="899.1666660308838" y2="154.89866666666668"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1099" x1="0" y1="193.62333333333336"
												x2="899.1666660308838" y2="193.62333333333336"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line>
											<line id="SvgjsLine1100" x1="0" y1="232.34800000000004"
												x2="899.1666660308838" y2="232.34800000000004"
												stroke="#eaeaea" stroke-dasharray="4" stroke-linecap="butt"
												class="apexcharts-gridline"></line></g>
											<g id="SvgjsG1092" class="apexcharts-gridlines-vertical"></g>
											<line id="SvgjsLine1102" x1="0" y1="232.348"
												x2="899.1666660308838" y2="232.348" stroke="transparent"
												stroke-dasharray="0" stroke-linecap="butt"></line>
											<line id="SvgjsLine1101" x1="0" y1="1" x2="0" y2="232.348"
												stroke="transparent" stroke-dasharray="0"
												stroke-linecap="butt"></line></g>
											<g id="SvgjsG1093" class="apexcharts-grid-borders">
											<line id="SvgjsLine1094" x1="0" y1="0" x2="899.1666660308838"
												y2="0" stroke="#eaeaea" stroke-dasharray="4"
												stroke-linecap="butt" class="apexcharts-gridline"></line></g>
											<g id="SvgjsG1015"
												class="apexcharts-bar-series apexcharts-plot-series">
											<g id="SvgjsG1016" class="apexcharts-series"
												seriesName="Subscribed" rel="1" data:realIndex="0">
											<path id="SvgjsPath1020"
												d="M17.189950968237483 142.98438461538464L17.189950968237483 107.23853846153848L35.70220585710862 107.23853846153848L35.70220585710862 142.98438461538464L17.189950968237483 142.98438461538464C17.189950968237483 142.98438461538464 17.189950968237483 142.98438461538464 17.189950968237483 142.98438461538464C17.189950968237483 142.98438461538464 17.189950968237483 142.98438461538464 17.189950968237483 142.98438461538464C17.189950968237483 142.98438461538464 17.189950968237483 142.98438461538464 17.189950968237483 142.98438461538464C17.189950968237483 142.98438461538464 17.189950968237483 142.98438461538464 17.189950968237483 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 17.189950968237483 142.98438461538464 L 17.189950968237483 107.23853846153848 L 35.70220585710862 107.23853846153848 L 35.70220585710862 142.98438461538464 z"
												pathFrom="M 17.189950968237483 142.98438461538464 L 17.189950968237483 142.98438461538464 L 35.70220585710862 142.98438461538464 L 35.70220585710862 142.98438461538464 L 35.70220585710862 142.98438461538464 L 35.70220585710862 142.98438461538464 L 35.70220585710862 142.98438461538464 L 17.189950968237483 142.98438461538464 z"
												cy="107.23753846153848" cx="70.08210779358359" j="0"
												val="20" barHeight="35.74584615384616"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1022"
												d="M70.08210779358359 142.98438461538464L70.08210779358359 89.36561538461541L88.59436268245473 89.36561538461541L88.59436268245473 142.98438461538464L70.08210779358359 142.98438461538464C70.08210779358359 142.98438461538464 70.08210779358359 142.98438461538464 70.08210779358359 142.98438461538464C70.08210779358359 142.98438461538464 70.08210779358359 142.98438461538464 70.08210779358359 142.98438461538464C70.08210779358359 142.98438461538464 70.08210779358359 142.98438461538464 70.08210779358359 142.98438461538464C70.08210779358359 142.98438461538464 70.08210779358359 142.98438461538464 70.08210779358359 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 70.08210779358359 142.98438461538464 L 70.08210779358359 89.36561538461541 L 88.59436268245473 89.36561538461541 L 88.59436268245473 142.98438461538464 z"
												pathFrom="M 70.08210779358359 142.98438461538464 L 70.08210779358359 142.98438461538464 L 88.59436268245473 142.98438461538464 L 88.59436268245473 142.98438461538464 L 88.59436268245473 142.98438461538464 L 88.59436268245473 142.98438461538464 L 88.59436268245473 142.98438461538464 L 70.08210779358359 142.98438461538464 z"
												cy="89.3646153846154" cx="122.9742646189297" j="1" val="30"
												barHeight="53.61876923076924" barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1024"
												d="M122.9742646189297 142.98438461538464L122.9742646189297 107.23853846153848L141.48651950780084 107.23853846153848L141.48651950780084 142.98438461538464L122.9742646189297 142.98438461538464C122.9742646189297 142.98438461538464 122.9742646189297 142.98438461538464 122.9742646189297 142.98438461538464C122.9742646189297 142.98438461538464 122.9742646189297 142.98438461538464 122.9742646189297 142.98438461538464C122.9742646189297 142.98438461538464 122.9742646189297 142.98438461538464 122.9742646189297 142.98438461538464C122.9742646189297 142.98438461538464 122.9742646189297 142.98438461538464 122.9742646189297 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 122.9742646189297 142.98438461538464 L 122.9742646189297 107.23853846153848 L 141.48651950780084 107.23853846153848 L 141.48651950780084 142.98438461538464 z"
												pathFrom="M 122.9742646189297 142.98438461538464 L 122.9742646189297 142.98438461538464 L 141.48651950780084 142.98438461538464 L 141.48651950780084 142.98438461538464 L 141.48651950780084 142.98438461538464 L 141.48651950780084 142.98438461538464 L 141.48651950780084 142.98438461538464 L 122.9742646189297 142.98438461538464 z"
												cy="107.23753846153848" cx="175.8664214442758" j="2"
												val="20" barHeight="35.74584615384616"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1026"
												d="M175.8664214442758 142.98438461538464L175.8664214442758 71.49269230769232L194.37867633314693 71.49269230769232L194.37867633314693 142.98438461538464L175.8664214442758 142.98438461538464C175.8664214442758 142.98438461538464 175.8664214442758 142.98438461538464 175.8664214442758 142.98438461538464C175.8664214442758 142.98438461538464 175.8664214442758 142.98438461538464 175.8664214442758 142.98438461538464C175.8664214442758 142.98438461538464 175.8664214442758 142.98438461538464 175.8664214442758 142.98438461538464C175.8664214442758 142.98438461538464 175.8664214442758 142.98438461538464 175.8664214442758 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 175.8664214442758 142.98438461538464 L 175.8664214442758 71.49269230769232 L 194.37867633314693 71.49269230769232 L 194.37867633314693 142.98438461538464 z"
												pathFrom="M 175.8664214442758 142.98438461538464 L 175.8664214442758 142.98438461538464 L 194.37867633314693 142.98438461538464 L 194.37867633314693 142.98438461538464 L 194.37867633314693 142.98438461538464 L 194.37867633314693 142.98438461538464 L 194.37867633314693 142.98438461538464 L 175.8664214442758 142.98438461538464 z"
												cy="71.49169230769232" cx="228.75857826962192" j="3"
												val="40" barHeight="71.49169230769232"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1028"
												d="M228.75857826962192 142.98438461538464L228.75857826962192 35.74684615384615L247.27083315849305 35.74684615384615L247.27083315849305 142.98438461538464L228.75857826962192 142.98438461538464C228.75857826962192 142.98438461538464 228.75857826962192 142.98438461538464 228.75857826962192 142.98438461538464C228.75857826962192 142.98438461538464 228.75857826962192 142.98438461538464 228.75857826962192 142.98438461538464C228.75857826962192 142.98438461538464 228.75857826962192 142.98438461538464 228.75857826962192 142.98438461538464C228.75857826962192 142.98438461538464 228.75857826962192 142.98438461538464 228.75857826962192 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 228.75857826962192 142.98438461538464 L 228.75857826962192 35.74684615384616 L 247.27083315849305 35.74684615384616 L 247.27083315849305 142.98438461538464 z"
												pathFrom="M 228.75857826962192 142.98438461538464 L 228.75857826962192 142.98438461538464 L 247.27083315849305 142.98438461538464 L 247.27083315849305 142.98438461538464 L 247.27083315849305 142.98438461538464 L 247.27083315849305 142.98438461538464 L 247.27083315849305 142.98438461538464 L 228.75857826962192 142.98438461538464 z"
												cy="35.74584615384616" cx="281.650735094968" j="4" val="60"
												barHeight="107.23753846153848" barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1030"
												d="M281.650735094968 142.98438461538464L281.650735094968 8.937461538461548L300.16298998383917 8.937461538461548L300.16298998383917 142.98438461538464L281.650735094968 142.98438461538464C281.650735094968 142.98438461538464 281.650735094968 142.98438461538464 281.650735094968 142.98438461538464C281.650735094968 142.98438461538464 281.650735094968 142.98438461538464 281.650735094968 142.98438461538464C281.650735094968 142.98438461538464 281.650735094968 142.98438461538464 281.650735094968 142.98438461538464C281.650735094968 142.98438461538464 281.650735094968 142.98438461538464 281.650735094968 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 281.650735094968 142.98438461538464 L 281.650735094968 8.937461538461543 L 300.16298998383917 8.937461538461543 L 300.16298998383917 142.98438461538464 z"
												pathFrom="M 281.650735094968 142.98438461538464 L 281.650735094968 142.98438461538464 L 300.16298998383917 142.98438461538464 L 300.16298998383917 142.98438461538464 L 300.16298998383917 142.98438461538464 L 300.16298998383917 142.98438461538464 L 300.16298998383917 142.98438461538464 L 281.650735094968 142.98438461538464 z"
												cy="8.936461538461543" cx="334.5428919203141" j="5" val="75"
												barHeight="134.0469230769231" barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1032"
												d="M334.5428919203141 142.98438461538464L334.5428919203141 26.81038461538462L353.05514680918526 26.81038461538462L353.05514680918526 142.98438461538464L334.5428919203141 142.98438461538464C334.5428919203141 142.98438461538464 334.5428919203141 142.98438461538464 334.5428919203141 142.98438461538464C334.5428919203141 142.98438461538464 334.5428919203141 142.98438461538464 334.5428919203141 142.98438461538464C334.5428919203141 142.98438461538464 334.5428919203141 142.98438461538464 334.5428919203141 142.98438461538464C334.5428919203141 142.98438461538464 334.5428919203141 142.98438461538464 334.5428919203141 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 334.5428919203141 142.98438461538464 L 334.5428919203141 26.810384615384617 L 353.05514680918526 26.810384615384617 L 353.05514680918526 142.98438461538464 z"
												pathFrom="M 334.5428919203141 142.98438461538464 L 334.5428919203141 142.98438461538464 L 353.05514680918526 142.98438461538464 L 353.05514680918526 142.98438461538464 L 353.05514680918526 142.98438461538464 L 353.05514680918526 142.98438461538464 L 353.05514680918526 142.98438461538464 L 334.5428919203141 142.98438461538464 z"
												cy="26.809384615384616" cx="387.4350487456602" j="6"
												val="65" barHeight="116.17400000000002"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1034"
												d="M387.4350487456602 142.98438461538464L387.4350487456602 110.81312307692309L405.94730363453135 110.81312307692309L405.94730363453135 142.98438461538464L387.4350487456602 142.98438461538464C387.4350487456602 142.98438461538464 387.4350487456602 142.98438461538464 387.4350487456602 142.98438461538464C387.4350487456602 142.98438461538464 387.4350487456602 142.98438461538464 387.4350487456602 142.98438461538464C387.4350487456602 142.98438461538464 387.4350487456602 142.98438461538464 387.4350487456602 142.98438461538464C387.4350487456602 142.98438461538464 387.4350487456602 142.98438461538464 387.4350487456602 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 387.4350487456602 142.98438461538464 L 387.4350487456602 110.81312307692309 L 405.94730363453135 110.81312307692309 L 405.94730363453135 142.98438461538464 z"
												pathFrom="M 387.4350487456602 142.98438461538464 L 387.4350487456602 142.98438461538464 L 405.94730363453135 142.98438461538464 L 405.94730363453135 142.98438461538464 L 405.94730363453135 142.98438461538464 L 405.94730363453135 142.98438461538464 L 405.94730363453135 142.98438461538464 L 387.4350487456602 142.98438461538464 z"
												cy="110.81212307692309" cx="440.3272055710063" j="7"
												val="18" barHeight="32.17126153846154"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1036"
												d="M440.3272055710063 142.98438461538464L440.3272055710063 125.11146153846155L458.83946045987744 125.11146153846155L458.83946045987744 142.98438461538464L440.3272055710063 142.98438461538464C440.3272055710063 142.98438461538464 440.3272055710063 142.98438461538464 440.3272055710063 142.98438461538464C440.3272055710063 142.98438461538464 440.3272055710063 142.98438461538464 440.3272055710063 142.98438461538464C440.3272055710063 142.98438461538464 440.3272055710063 142.98438461538464 440.3272055710063 142.98438461538464C440.3272055710063 142.98438461538464 440.3272055710063 142.98438461538464 440.3272055710063 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 440.3272055710063 142.98438461538464 L 440.3272055710063 125.11146153846155 L 458.83946045987744 125.11146153846155 L 458.83946045987744 142.98438461538464 z"
												pathFrom="M 440.3272055710063 142.98438461538464 L 440.3272055710063 142.98438461538464 L 458.83946045987744 142.98438461538464 L 458.83946045987744 142.98438461538464 L 458.83946045987744 142.98438461538464 L 458.83946045987744 142.98438461538464 L 458.83946045987744 142.98438461538464 L 440.3272055710063 142.98438461538464 z"
												cy="125.11046153846155" cx="493.2193623963524" j="8"
												val="10" barHeight="17.87292307692308"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1038"
												d="M493.2193623963524 142.98438461538464L493.2193623963524 134.0479230769231L511.73161728522354 134.0479230769231L511.73161728522354 142.98438461538464L493.2193623963524 142.98438461538464C493.2193623963524 142.98438461538464 493.2193623963524 142.98438461538464 493.2193623963524 142.98438461538464C493.2193623963524 142.98438461538464 493.2193623963524 142.98438461538464 493.2193623963524 142.98438461538464C493.2193623963524 142.98438461538464 493.2193623963524 142.98438461538464 493.2193623963524 142.98438461538464C493.2193623963524 142.98438461538464 493.2193623963524 142.98438461538464 493.2193623963524 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 493.2193623963524 142.98438461538464 L 493.2193623963524 134.0479230769231 L 511.73161728522354 134.0479230769231 L 511.73161728522354 142.98438461538464 z"
												pathFrom="M 493.2193623963524 142.98438461538464 L 493.2193623963524 142.98438461538464 L 511.73161728522354 142.98438461538464 L 511.73161728522354 142.98438461538464 L 511.73161728522354 142.98438461538464 L 511.73161728522354 142.98438461538464 L 511.73161728522354 142.98438461538464 L 493.2193623963524 142.98438461538464 z"
												cy="134.0469230769231" cx="546.1115192216985" j="9" val="5"
												barHeight="8.93646153846154" barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1040"
												d="M546.1115192216985 142.98438461538464L546.1115192216985 116.17500000000003L564.6237741105696 116.17500000000003L564.6237741105696 142.98438461538464L546.1115192216985 142.98438461538464C546.1115192216985 142.98438461538464 546.1115192216985 142.98438461538464 546.1115192216985 142.98438461538464C546.1115192216985 142.98438461538464 546.1115192216985 142.98438461538464 546.1115192216985 142.98438461538464C546.1115192216985 142.98438461538464 546.1115192216985 142.98438461538464 546.1115192216985 142.98438461538464C546.1115192216985 142.98438461538464 546.1115192216985 142.98438461538464 546.1115192216985 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 546.1115192216985 142.98438461538464 L 546.1115192216985 116.17500000000003 L 564.6237741105696 116.17500000000003 L 564.6237741105696 142.98438461538464 z"
												pathFrom="M 546.1115192216985 142.98438461538464 L 546.1115192216985 142.98438461538464 L 564.6237741105696 142.98438461538464 L 564.6237741105696 142.98438461538464 L 564.6237741105696 142.98438461538464 L 564.6237741105696 142.98438461538464 L 564.6237741105696 142.98438461538464 L 546.1115192216985 142.98438461538464 z"
												cy="116.17400000000002" cx="599.0036760470446" j="10"
												val="15" barHeight="26.80938461538462"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1042"
												d="M599.0036760470446 142.98438461538464L599.0036760470446 71.49269230769232L617.5159309359157 71.49269230769232L617.5159309359157 142.98438461538464L599.0036760470446 142.98438461538464C599.0036760470446 142.98438461538464 599.0036760470446 142.98438461538464 599.0036760470446 142.98438461538464C599.0036760470446 142.98438461538464 599.0036760470446 142.98438461538464 599.0036760470446 142.98438461538464C599.0036760470446 142.98438461538464 599.0036760470446 142.98438461538464 599.0036760470446 142.98438461538464C599.0036760470446 142.98438461538464 599.0036760470446 142.98438461538464 599.0036760470446 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 599.0036760470446 142.98438461538464 L 599.0036760470446 71.49269230769232 L 617.5159309359157 71.49269230769232 L 617.5159309359157 142.98438461538464 z"
												pathFrom="M 599.0036760470446 142.98438461538464 L 599.0036760470446 142.98438461538464 L 617.5159309359157 142.98438461538464 L 617.5159309359157 142.98438461538464 L 617.5159309359157 142.98438461538464 L 617.5159309359157 142.98438461538464 L 617.5159309359157 142.98438461538464 L 599.0036760470446 142.98438461538464 z"
												cy="71.49169230769232" cx="651.8958328723907" j="11"
												val="40" barHeight="71.49169230769232"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1044"
												d="M651.8958328723907 142.98438461538464L651.8958328723907 35.74684615384615L670.4080877612618 35.74684615384615L670.4080877612618 142.98438461538464L651.8958328723907 142.98438461538464C651.8958328723907 142.98438461538464 651.8958328723907 142.98438461538464 651.8958328723907 142.98438461538464C651.8958328723907 142.98438461538464 651.8958328723907 142.98438461538464 651.8958328723907 142.98438461538464C651.8958328723907 142.98438461538464 651.8958328723907 142.98438461538464 651.8958328723907 142.98438461538464C651.8958328723907 142.98438461538464 651.8958328723907 142.98438461538464 651.8958328723907 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 651.8958328723907 142.98438461538464 L 651.8958328723907 35.74684615384616 L 670.4080877612618 35.74684615384616 L 670.4080877612618 142.98438461538464 z"
												pathFrom="M 651.8958328723907 142.98438461538464 L 651.8958328723907 142.98438461538464 L 670.4080877612618 142.98438461538464 L 670.4080877612618 142.98438461538464 L 670.4080877612618 142.98438461538464 L 670.4080877612618 142.98438461538464 L 670.4080877612618 142.98438461538464 L 651.8958328723907 142.98438461538464 z"
												cy="35.74584615384616" cx="704.7879896977367" j="12"
												val="60" barHeight="107.23753846153848"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1046"
												d="M704.7879896977367 142.98438461538464L704.7879896977367 110.81312307692309L723.3002445866078 110.81312307692309L723.3002445866078 142.98438461538464L704.7879896977367 142.98438461538464C704.7879896977367 142.98438461538464 704.7879896977367 142.98438461538464 704.7879896977367 142.98438461538464C704.7879896977367 142.98438461538464 704.7879896977367 142.98438461538464 704.7879896977367 142.98438461538464C704.7879896977367 142.98438461538464 704.7879896977367 142.98438461538464 704.7879896977367 142.98438461538464C704.7879896977367 142.98438461538464 704.7879896977367 142.98438461538464 704.7879896977367 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 704.7879896977367 142.98438461538464 L 704.7879896977367 110.81312307692309 L 723.3002445866078 110.81312307692309 L 723.3002445866078 142.98438461538464 z"
												pathFrom="M 704.7879896977367 142.98438461538464 L 704.7879896977367 142.98438461538464 L 723.3002445866078 142.98438461538464 L 723.3002445866078 142.98438461538464 L 723.3002445866078 142.98438461538464 L 723.3002445866078 142.98438461538464 L 723.3002445866078 142.98438461538464 L 704.7879896977367 142.98438461538464 z"
												cy="110.81212307692309" cx="757.6801465230828" j="13"
												val="18" barHeight="32.17126153846154"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1048"
												d="M757.6801465230828 142.98438461538464L757.6801465230828 80.42915384615387L776.1924014119539 80.42915384615387L776.1924014119539 142.98438461538464L757.6801465230828 142.98438461538464C757.6801465230828 142.98438461538464 757.6801465230828 142.98438461538464 757.6801465230828 142.98438461538464C757.6801465230828 142.98438461538464 757.6801465230828 142.98438461538464 757.6801465230828 142.98438461538464C757.6801465230828 142.98438461538464 757.6801465230828 142.98438461538464 757.6801465230828 142.98438461538464C757.6801465230828 142.98438461538464 757.6801465230828 142.98438461538464 757.6801465230828 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 757.6801465230828 142.98438461538464 L 757.6801465230828 80.42915384615387 L 776.1924014119539 80.42915384615387 L 776.1924014119539 142.98438461538464 z"
												pathFrom="M 757.6801465230828 142.98438461538464 L 757.6801465230828 142.98438461538464 L 776.1924014119539 142.98438461538464 L 776.1924014119539 142.98438461538464 L 776.1924014119539 142.98438461538464 L 776.1924014119539 142.98438461538464 L 776.1924014119539 142.98438461538464 L 757.6801465230828 142.98438461538464 z"
												cy="80.42815384615386" cx="810.5723033484289" j="14"
												val="35" barHeight="62.555230769230775"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1050"
												d="M810.5723033484289 142.98438461538464L810.5723033484289 44.68330769230769L829.0845582373 44.68330769230769L829.0845582373 142.98438461538464L810.5723033484289 142.98438461538464C810.5723033484289 142.98438461538464 810.5723033484289 142.98438461538464 810.5723033484289 142.98438461538464C810.5723033484289 142.98438461538464 810.5723033484289 142.98438461538464 810.5723033484289 142.98438461538464C810.5723033484289 142.98438461538464 810.5723033484289 142.98438461538464 810.5723033484289 142.98438461538464C810.5723033484289 142.98438461538464 810.5723033484289 142.98438461538464 810.5723033484289 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 810.5723033484289 142.98438461538464 L 810.5723033484289 44.6833076923077 L 829.0845582373 44.6833076923077 L 829.0845582373 142.98438461538464 z"
												pathFrom="M 810.5723033484289 142.98438461538464 L 810.5723033484289 142.98438461538464 L 829.0845582373 142.98438461538464 L 829.0845582373 142.98438461538464 L 829.0845582373 142.98438461538464 L 829.0845582373 142.98438461538464 L 829.0845582373 142.98438461538464 L 810.5723033484289 142.98438461538464 z"
												cy="44.6823076923077" cx="863.464460173775" j="15" val="55"
												barHeight="98.30107692307693" barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1052"
												d="M863.464460173775 142.98438461538464L863.464460173775 107.23853846153848L881.9767150626461 107.23853846153848L881.9767150626461 142.98438461538464L863.464460173775 142.98438461538464C863.464460173775 142.98438461538464 863.464460173775 142.98438461538464 863.464460173775 142.98438461538464C863.464460173775 142.98438461538464 863.464460173775 142.98438461538464 863.464460173775 142.98438461538464C863.464460173775 142.98438461538464 863.464460173775 142.98438461538464 863.464460173775 142.98438461538464C863.464460173775 142.98438461538464 863.464460173775 142.98438461538464 863.464460173775 142.98438461538464 "
												fill="rgba(79,201,218,1)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="0"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 863.464460173775 142.98438461538464 L 863.464460173775 107.23853846153848 L 881.9767150626461 107.23853846153848 L 881.9767150626461 142.98438461538464 z"
												pathFrom="M 863.464460173775 142.98438461538464 L 863.464460173775 142.98438461538464 L 881.9767150626461 142.98438461538464 L 881.9767150626461 142.98438461538464 L 881.9767150626461 142.98438461538464 L 881.9767150626461 142.98438461538464 L 881.9767150626461 142.98438461538464 L 863.464460173775 142.98438461538464 z"
												cy="107.23753846153848" cx="916.3566169991211" j="16"
												val="20" barHeight="35.74584615384616"
												barWidth="18.512254888871137"></path>
											<g id="SvgjsG1018" class="apexcharts-bar-goals-markers">
											<g id="SvgjsG1019" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1021" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1023" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1025" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1027" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1029" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1031" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1033" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1035" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1037" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1039" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1041" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1043" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1045" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1047" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1049" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1051" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g></g></g>
											<g id="SvgjsG1053" class="apexcharts-series"
												seriesName="Unsubscribed" rel="2" data:realIndex="1">
											<path id="SvgjsPath1057"
												d="M17.189950968237483 142.98538461538465L17.189950968237483 178.7312307692308L35.70220585710862 178.7312307692308L35.70220585710862 142.98538461538465L17.189950968237483 142.98538461538465C17.189950968237483 142.98538461538465 17.189950968237483 142.98538461538465 17.189950968237483 142.98538461538465C17.189950968237483 142.98538461538465 17.189950968237483 142.98538461538465 17.189950968237483 142.98538461538465C17.189950968237483 142.98538461538465 17.189950968237483 142.98538461538465 17.189950968237483 142.98538461538465C17.189950968237483 142.98538461538465 17.189950968237483 142.98538461538465 17.189950968237483 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 17.189950968237483 142.98538461538465 L 17.189950968237483 178.7312307692308 L 35.70220585710862 178.7312307692308 L 35.70220585710862 142.98538461538465 z"
												pathFrom="M 17.189950968237483 142.98538461538465 L 17.189950968237483 142.98538461538465 L 35.70220585710862 142.98538461538465 L 35.70220585710862 142.98538461538465 L 35.70220585710862 142.98538461538465 L 35.70220585710862 142.98538461538465 L 35.70220585710862 142.98538461538465 L 17.189950968237483 142.98538461538465 z"
												cy="178.7302307692308" cx="70.08210779358359" j="0"
												val="-20" barHeight="-35.74584615384616"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1059"
												d="M70.08210779358359 142.98538461538465L70.08210779358359 169.79476923076928L88.59436268245473 169.79476923076928L88.59436268245473 142.98538461538465L70.08210779358359 142.98538461538465C70.08210779358359 142.98538461538465 70.08210779358359 142.98538461538465 70.08210779358359 142.98538461538465C70.08210779358359 142.98538461538465 70.08210779358359 142.98538461538465 70.08210779358359 142.98538461538465C70.08210779358359 142.98538461538465 70.08210779358359 142.98538461538465 70.08210779358359 142.98538461538465C70.08210779358359 142.98538461538465 70.08210779358359 142.98538461538465 70.08210779358359 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 70.08210779358359 142.98538461538465 L 70.08210779358359 169.79476923076928 L 88.59436268245473 169.79476923076928 L 88.59436268245473 142.98538461538465 z"
												pathFrom="M 70.08210779358359 142.98538461538465 L 70.08210779358359 142.98538461538465 L 88.59436268245473 142.98538461538465 L 88.59436268245473 142.98538461538465 L 88.59436268245473 142.98538461538465 L 88.59436268245473 142.98538461538465 L 88.59436268245473 142.98538461538465 L 70.08210779358359 142.98538461538465 z"
												cy="169.79376923076927" cx="122.9742646189297" j="1"
												val="-15" barHeight="-26.80938461538462"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1061"
												d="M122.9742646189297 142.98538461538465L122.9742646189297 151.9218461538462L141.48651950780084 151.9218461538462L141.48651950780084 142.98538461538465L122.9742646189297 142.98538461538465C122.9742646189297 142.98538461538465 122.9742646189297 142.98538461538465 122.9742646189297 142.98538461538465C122.9742646189297 142.98538461538465 122.9742646189297 142.98538461538465 122.9742646189297 142.98538461538465C122.9742646189297 142.98538461538465 122.9742646189297 142.98538461538465 122.9742646189297 142.98538461538465C122.9742646189297 142.98538461538465 122.9742646189297 142.98538461538465 122.9742646189297 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 122.9742646189297 142.98538461538465 L 122.9742646189297 151.9218461538462 L 141.48651950780084 151.9218461538462 L 141.48651950780084 142.98538461538465 z"
												pathFrom="M 122.9742646189297 142.98538461538465 L 122.9742646189297 142.98538461538465 L 141.48651950780084 142.98538461538465 L 141.48651950780084 142.98538461538465 L 141.48651950780084 142.98538461538465 L 141.48651950780084 142.98538461538465 L 141.48651950780084 142.98538461538465 L 122.9742646189297 142.98538461538465 z"
												cy="151.92084615384618" cx="175.8664214442758" j="2"
												val="-5" barHeight="-8.93646153846154"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1063"
												d="M175.8664214442758 142.98538461538465L175.8664214442758 178.7312307692308L194.37867633314693 178.7312307692308L194.37867633314693 142.98538461538465L175.8664214442758 142.98538461538465C175.8664214442758 142.98538461538465 175.8664214442758 142.98538461538465 175.8664214442758 142.98538461538465C175.8664214442758 142.98538461538465 175.8664214442758 142.98538461538465 175.8664214442758 142.98538461538465C175.8664214442758 142.98538461538465 175.8664214442758 142.98538461538465 175.8664214442758 142.98538461538465C175.8664214442758 142.98538461538465 175.8664214442758 142.98538461538465 175.8664214442758 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 175.8664214442758 142.98538461538465 L 175.8664214442758 178.7312307692308 L 194.37867633314693 178.7312307692308 L 194.37867633314693 142.98538461538465 z"
												pathFrom="M 175.8664214442758 142.98538461538465 L 175.8664214442758 142.98538461538465 L 194.37867633314693 142.98538461538465 L 194.37867633314693 142.98538461538465 L 194.37867633314693 142.98538461538465 L 194.37867633314693 142.98538461538465 L 194.37867633314693 142.98538461538465 L 175.8664214442758 142.98538461538465 z"
												cy="178.7302307692308" cx="228.75857826962192" j="3"
												val="-20" barHeight="-35.74584615384616"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1065"
												d="M228.75857826962192 142.98538461538465L228.75857826962192 196.60415384615388L247.27083315849305 196.60415384615388L247.27083315849305 142.98538461538465L228.75857826962192 142.98538461538465C228.75857826962192 142.98538461538465 228.75857826962192 142.98538461538465 228.75857826962192 142.98538461538465C228.75857826962192 142.98538461538465 228.75857826962192 142.98538461538465 228.75857826962192 142.98538461538465C228.75857826962192 142.98538461538465 228.75857826962192 142.98538461538465 228.75857826962192 142.98538461538465C228.75857826962192 142.98538461538465 228.75857826962192 142.98538461538465 228.75857826962192 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 228.75857826962192 142.98538461538465 L 228.75857826962192 196.60415384615388 L 247.27083315849305 196.60415384615388 L 247.27083315849305 142.98538461538465 z"
												pathFrom="M 228.75857826962192 142.98538461538465 L 228.75857826962192 142.98538461538465 L 247.27083315849305 142.98538461538465 L 247.27083315849305 142.98538461538465 L 247.27083315849305 142.98538461538465 L 247.27083315849305 142.98538461538465 L 247.27083315849305 142.98538461538465 L 228.75857826962192 142.98538461538465 z"
												cy="196.60315384615387" cx="281.650735094968" j="4"
												val="-30" barHeight="-53.61876923076924"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1067"
												d="M281.650735094968 142.98538461538465L281.650735094968 169.79476923076928L300.16298998383917 169.79476923076928L300.16298998383917 142.98538461538465L281.650735094968 142.98538461538465C281.650735094968 142.98538461538465 281.650735094968 142.98538461538465 281.650735094968 142.98538461538465C281.650735094968 142.98538461538465 281.650735094968 142.98538461538465 281.650735094968 142.98538461538465C281.650735094968 142.98538461538465 281.650735094968 142.98538461538465 281.650735094968 142.98538461538465C281.650735094968 142.98538461538465 281.650735094968 142.98538461538465 281.650735094968 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 281.650735094968 142.98538461538465 L 281.650735094968 169.79476923076928 L 300.16298998383917 169.79476923076928 L 300.16298998383917 142.98538461538465 z"
												pathFrom="M 281.650735094968 142.98538461538465 L 281.650735094968 142.98538461538465 L 300.16298998383917 142.98538461538465 L 300.16298998383917 142.98538461538465 L 300.16298998383917 142.98538461538465 L 300.16298998383917 142.98538461538465 L 300.16298998383917 142.98538461538465 L 281.650735094968 142.98538461538465 z"
												cy="169.79376923076927" cx="334.5428919203141" j="5"
												val="-15" barHeight="-26.80938461538462"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1069"
												d="M334.5428919203141 142.98538461538465L334.5428919203141 160.85830769230773L353.05514680918526 160.85830769230773L353.05514680918526 142.98538461538465L334.5428919203141 142.98538461538465C334.5428919203141 142.98538461538465 334.5428919203141 142.98538461538465 334.5428919203141 142.98538461538465C334.5428919203141 142.98538461538465 334.5428919203141 142.98538461538465 334.5428919203141 142.98538461538465C334.5428919203141 142.98538461538465 334.5428919203141 142.98538461538465 334.5428919203141 142.98538461538465C334.5428919203141 142.98538461538465 334.5428919203141 142.98538461538465 334.5428919203141 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 334.5428919203141 142.98538461538465 L 334.5428919203141 160.85830769230773 L 353.05514680918526 160.85830769230773 L 353.05514680918526 142.98538461538465 z"
												pathFrom="M 334.5428919203141 142.98538461538465 L 334.5428919203141 142.98538461538465 L 353.05514680918526 142.98538461538465 L 353.05514680918526 142.98538461538465 L 353.05514680918526 142.98538461538465 L 353.05514680918526 142.98538461538465 L 353.05514680918526 142.98538461538465 L 334.5428919203141 142.98538461538465 z"
												cy="160.85730769230773" cx="387.4350487456602" j="6"
												val="-10" barHeight="-17.87292307692308"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1071"
												d="M387.4350487456602 142.98538461538465L387.4350487456602 157.2837230769231L405.94730363453135 157.2837230769231L405.94730363453135 142.98538461538465L387.4350487456602 142.98538461538465C387.4350487456602 142.98538461538465 387.4350487456602 142.98538461538465 387.4350487456602 142.98538461538465C387.4350487456602 142.98538461538465 387.4350487456602 142.98538461538465 387.4350487456602 142.98538461538465C387.4350487456602 142.98538461538465 387.4350487456602 142.98538461538465 387.4350487456602 142.98538461538465C387.4350487456602 142.98538461538465 387.4350487456602 142.98538461538465 387.4350487456602 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 387.4350487456602 142.98538461538465 L 387.4350487456602 157.2837230769231 L 405.94730363453135 157.2837230769231 L 405.94730363453135 142.98538461538465 z"
												pathFrom="M 387.4350487456602 142.98538461538465 L 387.4350487456602 142.98538461538465 L 405.94730363453135 142.98538461538465 L 405.94730363453135 142.98538461538465 L 405.94730363453135 142.98538461538465 L 405.94730363453135 142.98538461538465 L 405.94730363453135 142.98538461538465 L 387.4350487456602 142.98538461538465 z"
												cy="157.2827230769231" cx="440.3272055710063" j="7" val="-8"
												barHeight="-14.298338461538464"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1073"
												d="M440.3272055710063 142.98538461538465L440.3272055710063 151.9218461538462L458.83946045987744 151.9218461538462L458.83946045987744 142.98538461538465L440.3272055710063 142.98538461538465C440.3272055710063 142.98538461538465 440.3272055710063 142.98538461538465 440.3272055710063 142.98538461538465C440.3272055710063 142.98538461538465 440.3272055710063 142.98538461538465 440.3272055710063 142.98538461538465C440.3272055710063 142.98538461538465 440.3272055710063 142.98538461538465 440.3272055710063 142.98538461538465C440.3272055710063 142.98538461538465 440.3272055710063 142.98538461538465 440.3272055710063 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 440.3272055710063 142.98538461538465 L 440.3272055710063 151.9218461538462 L 458.83946045987744 151.9218461538462 L 458.83946045987744 142.98538461538465 z"
												pathFrom="M 440.3272055710063 142.98538461538465 L 440.3272055710063 142.98538461538465 L 458.83946045987744 142.98538461538465 L 458.83946045987744 142.98538461538465 L 458.83946045987744 142.98538461538465 L 458.83946045987744 142.98538461538465 L 458.83946045987744 142.98538461538465 L 440.3272055710063 142.98538461538465 z"
												cy="151.92084615384618" cx="493.2193623963524" j="8"
												val="-5" barHeight="-8.93646153846154"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1075"
												d="M493.2193623963524 142.98538461538465L493.2193623963524 151.9218461538462L511.73161728522354 151.9218461538462L511.73161728522354 142.98538461538465L493.2193623963524 142.98538461538465C493.2193623963524 142.98538461538465 493.2193623963524 142.98538461538465 493.2193623963524 142.98538461538465C493.2193623963524 142.98538461538465 493.2193623963524 142.98538461538465 493.2193623963524 142.98538461538465C493.2193623963524 142.98538461538465 493.2193623963524 142.98538461538465 493.2193623963524 142.98538461538465C493.2193623963524 142.98538461538465 493.2193623963524 142.98538461538465 493.2193623963524 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 493.2193623963524 142.98538461538465 L 493.2193623963524 151.9218461538462 L 511.73161728522354 151.9218461538462 L 511.73161728522354 142.98538461538465 z"
												pathFrom="M 493.2193623963524 142.98538461538465 L 493.2193623963524 142.98538461538465 L 511.73161728522354 142.98538461538465 L 511.73161728522354 142.98538461538465 L 511.73161728522354 142.98538461538465 L 511.73161728522354 142.98538461538465 L 511.73161728522354 142.98538461538465 L 493.2193623963524 142.98538461538465 z"
												cy="151.92084615384618" cx="546.1115192216985" j="9"
												val="-5" barHeight="-8.93646153846154"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1077"
												d="M546.1115192216985 142.98538461538465L546.1115192216985 160.85830769230773L564.6237741105696 160.85830769230773L564.6237741105696 142.98538461538465L546.1115192216985 142.98538461538465C546.1115192216985 142.98538461538465 546.1115192216985 142.98538461538465 546.1115192216985 142.98538461538465C546.1115192216985 142.98538461538465 546.1115192216985 142.98538461538465 546.1115192216985 142.98538461538465C546.1115192216985 142.98538461538465 546.1115192216985 142.98538461538465 546.1115192216985 142.98538461538465C546.1115192216985 142.98538461538465 546.1115192216985 142.98538461538465 546.1115192216985 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 546.1115192216985 142.98538461538465 L 546.1115192216985 160.85830769230773 L 564.6237741105696 160.85830769230773 L 564.6237741105696 142.98538461538465 z"
												pathFrom="M 546.1115192216985 142.98538461538465 L 546.1115192216985 142.98538461538465 L 564.6237741105696 142.98538461538465 L 564.6237741105696 142.98538461538465 L 564.6237741105696 142.98538461538465 L 564.6237741105696 142.98538461538465 L 564.6237741105696 142.98538461538465 L 546.1115192216985 142.98538461538465 z"
												cy="160.85730769230773" cx="599.0036760470446" j="10"
												val="-10" barHeight="-17.87292307692308"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1079"
												d="M599.0036760470446 142.98538461538465L599.0036760470446 187.66769230769233L617.5159309359157 187.66769230769233L617.5159309359157 142.98538461538465L599.0036760470446 142.98538461538465C599.0036760470446 142.98538461538465 599.0036760470446 142.98538461538465 599.0036760470446 142.98538461538465C599.0036760470446 142.98538461538465 599.0036760470446 142.98538461538465 599.0036760470446 142.98538461538465C599.0036760470446 142.98538461538465 599.0036760470446 142.98538461538465 599.0036760470446 142.98538461538465C599.0036760470446 142.98538461538465 599.0036760470446 142.98538461538465 599.0036760470446 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 599.0036760470446 142.98538461538465 L 599.0036760470446 187.66769230769233 L 617.5159309359157 187.66769230769233 L 617.5159309359157 142.98538461538465 z"
												pathFrom="M 599.0036760470446 142.98538461538465 L 599.0036760470446 142.98538461538465 L 617.5159309359157 142.98538461538465 L 617.5159309359157 142.98538461538465 L 617.5159309359157 142.98538461538465 L 617.5159309359157 142.98538461538465 L 617.5159309359157 142.98538461538465 L 599.0036760470446 142.98538461538465 z"
												cy="187.66669230769233" cx="651.8958328723907" j="11"
												val="-25" barHeight="-44.682307692307695"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1081"
												d="M651.8958328723907 142.98538461538465L651.8958328723907 169.79476923076928L670.4080877612618 169.79476923076928L670.4080877612618 142.98538461538465L651.8958328723907 142.98538461538465C651.8958328723907 142.98538461538465 651.8958328723907 142.98538461538465 651.8958328723907 142.98538461538465C651.8958328723907 142.98538461538465 651.8958328723907 142.98538461538465 651.8958328723907 142.98538461538465C651.8958328723907 142.98538461538465 651.8958328723907 142.98538461538465 651.8958328723907 142.98538461538465C651.8958328723907 142.98538461538465 651.8958328723907 142.98538461538465 651.8958328723907 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 651.8958328723907 142.98538461538465 L 651.8958328723907 169.79476923076928 L 670.4080877612618 169.79476923076928 L 670.4080877612618 142.98538461538465 z"
												pathFrom="M 651.8958328723907 142.98538461538465 L 651.8958328723907 142.98538461538465 L 670.4080877612618 142.98538461538465 L 670.4080877612618 142.98538461538465 L 670.4080877612618 142.98538461538465 L 670.4080877612618 142.98538461538465 L 670.4080877612618 142.98538461538465 L 651.8958328723907 142.98538461538465 z"
												cy="169.79376923076927" cx="704.7879896977367" j="12"
												val="-15" barHeight="-26.80938461538462"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1083"
												d="M704.7879896977367 142.98538461538465L704.7879896977367 151.9218461538462L723.3002445866078 151.9218461538462L723.3002445866078 142.98538461538465L704.7879896977367 142.98538461538465C704.7879896977367 142.98538461538465 704.7879896977367 142.98538461538465 704.7879896977367 142.98538461538465C704.7879896977367 142.98538461538465 704.7879896977367 142.98538461538465 704.7879896977367 142.98538461538465C704.7879896977367 142.98538461538465 704.7879896977367 142.98538461538465 704.7879896977367 142.98538461538465C704.7879896977367 142.98538461538465 704.7879896977367 142.98538461538465 704.7879896977367 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 704.7879896977367 142.98538461538465 L 704.7879896977367 151.9218461538462 L 723.3002445866078 151.9218461538462 L 723.3002445866078 142.98538461538465 z"
												pathFrom="M 704.7879896977367 142.98538461538465 L 704.7879896977367 142.98538461538465 L 723.3002445866078 142.98538461538465 L 723.3002445866078 142.98538461538465 L 723.3002445866078 142.98538461538465 L 723.3002445866078 142.98538461538465 L 723.3002445866078 142.98538461538465 L 704.7879896977367 142.98538461538465 z"
												cy="151.92084615384618" cx="757.6801465230828" j="13"
												val="-5" barHeight="-8.93646153846154"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1085"
												d="M757.6801465230828 142.98538461538465L757.6801465230828 160.85830769230773L776.1924014119539 160.85830769230773L776.1924014119539 142.98538461538465L757.6801465230828 142.98538461538465C757.6801465230828 142.98538461538465 757.6801465230828 142.98538461538465 757.6801465230828 142.98538461538465C757.6801465230828 142.98538461538465 757.6801465230828 142.98538461538465 757.6801465230828 142.98538461538465C757.6801465230828 142.98538461538465 757.6801465230828 142.98538461538465 757.6801465230828 142.98538461538465C757.6801465230828 142.98538461538465 757.6801465230828 142.98538461538465 757.6801465230828 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 757.6801465230828 142.98538461538465 L 757.6801465230828 160.85830769230773 L 776.1924014119539 160.85830769230773 L 776.1924014119539 142.98538461538465 z"
												pathFrom="M 757.6801465230828 142.98538461538465 L 757.6801465230828 142.98538461538465 L 776.1924014119539 142.98538461538465 L 776.1924014119539 142.98538461538465 L 776.1924014119539 142.98538461538465 L 776.1924014119539 142.98538461538465 L 776.1924014119539 142.98538461538465 L 757.6801465230828 142.98538461538465 z"
												cy="160.85730769230773" cx="810.5723033484289" j="14"
												val="-10" barHeight="-17.87292307692308"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1087"
												d="M810.5723033484289 142.98538461538465L810.5723033484289 151.9218461538462L829.0845582373 151.9218461538462L829.0845582373 142.98538461538465L810.5723033484289 142.98538461538465C810.5723033484289 142.98538461538465 810.5723033484289 142.98538461538465 810.5723033484289 142.98538461538465C810.5723033484289 142.98538461538465 810.5723033484289 142.98538461538465 810.5723033484289 142.98538461538465C810.5723033484289 142.98538461538465 810.5723033484289 142.98538461538465 810.5723033484289 142.98538461538465C810.5723033484289 142.98538461538465 810.5723033484289 142.98538461538465 810.5723033484289 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 810.5723033484289 142.98538461538465 L 810.5723033484289 151.9218461538462 L 829.0845582373 151.9218461538462 L 829.0845582373 142.98538461538465 z"
												pathFrom="M 810.5723033484289 142.98538461538465 L 810.5723033484289 142.98538461538465 L 829.0845582373 142.98538461538465 L 829.0845582373 142.98538461538465 L 829.0845582373 142.98538461538465 L 829.0845582373 142.98538461538465 L 829.0845582373 142.98538461538465 L 810.5723033484289 142.98538461538465 z"
												cy="151.92084615384618" cx="863.464460173775" j="15"
												val="-5" barHeight="-8.93646153846154"
												barWidth="18.512254888871137"></path>
											<path id="SvgjsPath1089"
												d="M863.464460173775 142.98538461538465L863.464460173775 169.79476923076928L881.9767150626461 169.79476923076928L881.9767150626461 142.98538461538465L863.464460173775 142.98538461538465C863.464460173775 142.98538461538465 863.464460173775 142.98538461538465 863.464460173775 142.98538461538465C863.464460173775 142.98538461538465 863.464460173775 142.98538461538465 863.464460173775 142.98538461538465C863.464460173775 142.98538461538465 863.464460173775 142.98538461538465 863.464460173775 142.98538461538465C863.464460173775 142.98538461538465 863.464460173775 142.98538461538465 863.464460173775 142.98538461538465 "
												fill="rgba(150, 142, 126, 0.2)" fill-opacity="1"
												stroke-opacity="1" stroke-linecap="round" stroke-width="0"
												stroke-dasharray="0" class="apexcharts-bar-area" index="1"
												clip-path="url(#gridRectMaskmrwmnewv)"
												pathTo="M 863.464460173775 142.98538461538465 L 863.464460173775 169.79476923076928 L 881.9767150626461 169.79476923076928 L 881.9767150626461 142.98538461538465 z"
												pathFrom="M 863.464460173775 142.98538461538465 L 863.464460173775 142.98538461538465 L 881.9767150626461 142.98538461538465 L 881.9767150626461 142.98538461538465 L 881.9767150626461 142.98538461538465 L 881.9767150626461 142.98538461538465 L 881.9767150626461 142.98538461538465 L 863.464460173775 142.98538461538465 z"
												cy="169.79376923076927" cx="916.3566169991211" j="16"
												val="-15" barHeight="-26.80938461538462"
												barWidth="18.512254888871137"></path>
											<g id="SvgjsG1055" class="apexcharts-bar-goals-markers">
											<g id="SvgjsG1056" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1058" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1060" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1062" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1064" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1066" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1068" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1070" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1072" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1074" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1076" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1078" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1080" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1082" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1084" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1086" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g>
											<g id="SvgjsG1088" className="apexcharts-bar-goals-groups"
												class="apexcharts-hidden-element-shown"
												clip-path="url(#gridRectMarkerMaskmrwmnewv)"></g></g></g>
											<g id="SvgjsG1017" class="apexcharts-datalabels"
												data:realIndex="0"></g>
											<g id="SvgjsG1054" class="apexcharts-datalabels"
												data:realIndex="1"></g></g>
											<line id="SvgjsLine1103" x1="0" y1="0" x2="899.1666660308838"
												y2="0" stroke="#b6b6b6" stroke-dasharray="0"
												stroke-width="1" stroke-linecap="butt"
												class="apexcharts-ycrosshairs"></line>
											<line id="SvgjsLine1104" x1="0" y1="0" x2="899.1666660308838"
												y2="0" stroke-dasharray="0" stroke-width="0"
												stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line>
											<g id="SvgjsG1105" class="apexcharts-xaxis"
												transform="translate(0, 0)">
											<g id="SvgjsG1106" class="apexcharts-xaxis-texts-g"
												transform="translate(0, -4)">
											<text id="SvgjsText1108" font-family="inherit"
												x="26.446078412673053" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#968e7e"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1109">Jan 5</tspan>
											<title>Jan 5</title></text>
											<text id="SvgjsText1111" font-family="inherit"
												x="79.33823523801917" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1112"></tspan>
											<title></title></text>
											<text id="SvgjsText1114" font-family="inherit"
												x="132.2303920633653" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1115">Jan 9</tspan>
											<title>Jan 9</title></text>
											<text id="SvgjsText1117" font-family="inherit"
												x="185.12254888871138" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1118"></tspan>
											<title></title></text>
											<text id="SvgjsText1120" font-family="inherit"
												x="238.01470571405747" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1121">Jan 13</tspan>
											<title>Jan 13</title></text>
											<text id="SvgjsText1123" font-family="inherit"
												x="290.90686253940356" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1124"></tspan>
											<title></title></text>
											<text id="SvgjsText1126" font-family="inherit"
												x="343.79901936474965" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1127">Jan 17</tspan>
											<title>Jan 17</title></text>
											<text id="SvgjsText1129" font-family="inherit"
												x="396.69117619009575" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1130"></tspan>
											<title></title></text>
											<text id="SvgjsText1132" font-family="inherit"
												x="449.58333301544184" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1133">Jan 20</tspan>
											<title>Jan 20</title></text>
											<text id="SvgjsText1135" font-family="inherit"
												x="502.475489840788" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1136"></tspan>
											<title></title></text>
											<text id="SvgjsText1138" font-family="inherit"
												x="555.3676466661341" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1139">Jan 23</tspan>
											<title>Jan 23</title></text>
											<text id="SvgjsText1141" font-family="inherit"
												x="608.2598034914802" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1142"></tspan>
											<title></title></text>
											<text id="SvgjsText1144" font-family="inherit"
												x="661.1519603168263" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1145">Jan 25</tspan>
											<title>Jan 25</title></text>
											<text id="SvgjsText1147" font-family="inherit"
												x="714.0441171421724" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1148"></tspan>
											<title></title></text>
											<text id="SvgjsText1150" font-family="inherit"
												x="766.9362739675184" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1151">Jan 24</tspan>
											<title>Jan 24</title></text>
											<text id="SvgjsText1153" font-family="inherit"
												x="819.8284307928645" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1154"></tspan>
											<title></title></text>
											<text id="SvgjsText1156" font-family="inherit"
												x="872.7205876182106" y="260.348" text-anchor="middle"
												dominant-baseline="auto" font-size="12px" font-weight="400"
												fill="#373d3f"
												class="apexcharts-text apexcharts-xaxis-label "
												style="font-family: inherit;">
											<tspan id="SvgjsTspan1157">Jan 29</tspan>
											<title>Jan 29</title></text></g></g>
											<g id="SvgjsG1181"
												class="apexcharts-yaxis-annotations apexcharts-hidden-element-shown"></g>
											<g id="SvgjsG1182"
												class="apexcharts-xaxis-annotations apexcharts-hidden-element-shown"></g>
											<g id="SvgjsG1183"
												class="apexcharts-point-annotations apexcharts-hidden-element-shown"></g></g></svg>
										<div class="apexcharts-tooltip apexcharts-theme-light">
											<div class="apexcharts-tooltip-title"
												style="font-family: inherit; font-size: 12px;"></div>
											<div class="apexcharts-tooltip-series-group"
												style="order: 1;">
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
											<div class="apexcharts-tooltip-series-group"
												style="order: 2;">
												<span class="apexcharts-tooltip-marker"
													style="background-color: rgba(150, 142, 126, 0.2);"></span>
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
											class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
											<div class="apexcharts-yaxistooltip-text"></div>
										</div>
									</div>
								</div>
								<!--end::Chart-->

								<!--begin::Info-->
								<div class="d-flex align-items-center px-9">
									<!--begin::Item-->
									<div class="d-flex align-items-center me-6">
										<!--begin::Bullet-->
										<span class="rounded-1 bg-primary me-2 h-10px w-10px"></span>
										<!--end::Bullet-->

										<!--begin::Label-->
										<span class="fw-semibold fs-6 text-gray-600">Gained</span>
										<!--end::Label-->
									</div>
									<!--ed::Item-->

									<!--begin::Item-->
									<div class="d-flex align-items-center">
										<!--begin::Bullet-->
										<span class="rounded-1 me-2 h-10px w-10px"
											style="background-color: rgba(150, 142, 126, 0.2)"></span>
										<!--end::Bullet-->

										<!--begin::Label-->
										<span class="fw-semibold fs-6 text-gray-600">Lost</span>
										<!--end::Label-->
									</div>
									<!--ed::Item-->
								</div>
								<!--ed::Info-->
							</div>
							<!--end::Body-->
						</div>
						<!--end::Chart Widget 1-->
					</div>
					<!--end::Col-->
				</div> 


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
											class="nav-text text-gray-600 fw-bold fs-6 lh-1">
												Watch </span> <!--end::Subtitle--> <!--begin::Bullet--> <span
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
											class="nav-text text-gray-600 fw-bold fs-6 lh-1">
												Shoes </span> <!--end::Subtitle--> <!--begin::Bullet--> <span
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
															class="text-gray-800 fw-bold d-block fs-6">$72.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$45.00</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$76.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$84.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$32.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$53.00</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$62.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$74.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$43.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$71.00</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$53.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$23.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$65.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$64.00</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$73.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$54.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$64.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$76.00</span>
														</td>
														<td class="text-end pe-0"><span
															class="text-gray-800 fw-bold d-block fs-6">$51.00</span>
														</td>
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
															class="text-gray-800 fw-bold d-block fs-6">$27.00</span>
														</td>
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
										Product Sales</span> <span
										class="text-gray-500 mt-1 fw-semibold fs-6">Users from
										all channels</span>
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
												y2="222.89866666666666" stroke="#4fc9da"
												stroke-dasharray="3" stroke-linecap="butt"
												class="apexcharts-xcrosshairs" x="0" y="0" width="1"
												height="222.89866666666666" fill="#b1b9c4" filter="none"
												fill-opacity="0.9" stroke-width="1"></line>
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
											<div class="apexcharts-tooltip-series-group"
												style="order: 1;">
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
														class="text-gray-900 text-hover-primary">Macbook Air
															M1</a></td>
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
													<td class="text-end dt-type-numeric" data-order="58">
														<span class="text-gray-900 fw-bold">58 PCS</span>
													</td>
													<!--end::Qty-->
												</tr>
												<tr>
													<!--begin::Item-->
													<td><a
														href="/good/apps/ecommerce/catalog/edit-product.html"
														class="text-gray-900 text-hover-primary">Surface
															Laptop 4</a></td>
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
													<td class="text-end dt-type-numeric" data-order="46">
														<span class="text-gray-900 fw-bold">46 PCS</span>
													</td>
													<!--end::Qty-->
												</tr>
												<tr>
													<!--begin::Item-->
													<td><a
														href="/good/apps/ecommerce/catalog/edit-product.html"
														class="text-gray-900 text-hover-primary">HP Hyper LTR</a>
													</td>
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
													<td class="text-end dt-type-numeric" data-order="78">
														<span class="text-gray-900 fw-bold">78 PCS</span>
													</td>
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
														class="text-gray-900 text-hover-primary">Google Pixel
															6 Pro</a></td>
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