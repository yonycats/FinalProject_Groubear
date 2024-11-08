<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set value="${comMsg}" var="comMsg"/>

<div style="margin-bottom: 50px;">
    <div style="margin-top: -32px;">
        <div class="separator border-2 my-10"></div>
    </div>
    <div style="margin-left: 30px; margin-top: -100px;">
        <h3>통계</h3>
        <h6>기업통계</h6>
    </div>
</div>

<div class="card mb-5 mb-xxl-8">
    <div class="card-body pt-0 pb-0">
        <ul class="nav nav-stretch nav-line-tabs nav-line-tabs-2x border-transparent fs-5 fw-bold">
            <c:if test="${comMsg eq 'numOfMem' }">
                <li class="nav-item mt-2">
                    <a class="wow nav-link text-active-primary ms-0 me-10 py-5 active" href="companydetailnumofmem.do">구성원수</a>
                </li>
                <li class="nav-item mt-2">
                    <a class="wow nav-link text-active-primary ms-0 me-10 py-5" href="companydetailpremium.do">프리미엄</a>
                </li>
                <li class="nav-item mt-2">
                    <a class="wow nav-link text-active-primary ms-0 me-10 py-5" href="companydetailnumofmon.do">계약기간</a>
                </li>
            </c:if>
            <c:if test="${comMsg eq 'premium' }">
                <li class="nav-item mt-2">
                    <a class="wow nav-link text-active-primary ms-0 me-10 py-5" href="companydetailnumofmem.do">구성원수</a>
                </li>
                <li class="nav-item mt-2">
                    <a class="wow nav-link text-active-primary ms-0 me-10 py-5 active" href="companydetailpremium.do">프리미엄</a>
                </li>
                <li class="nav-item mt-2">
                    <a class="wow nav-link text-active-primary ms-0 me-10 py-5" href="companydetailnumofmon.do">계약기간</a>
                </li>
            </c:if>
            <c:if test="${comMsg eq 'numOfMon' }">
                <li class="nav-item mt-2">
                    <a class="wow nav-link text-active-primary ms-0 me-10 py-5" href="companydetailnumofmem.do">구성원수</a>
                </li>
                <li class="nav-item mt-2">
                    <a class="wow nav-link text-active-primary ms-0 me-10 py-5" href="companydetailpremium.do">프리미엄</a>
                </li>
                <li class="nav-item mt-2">
                    <a class="wow nav-link text-active-primary ms-0 me-10 py-5 active" href="companydetailnumofmon.do">계약기간</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>

<!-- 차트 영역 -->
<canvas id="kt_chartjs" class="mh-400px"></canvas>

<script type="text/javascript">
$(function(){
    var ctx = document.getElementById('kt_chartjs');


    // Chart config
    var config = {
        type: 'pie', // 차트 타입 (pie, bar, line 등)
        data: {
            labels: [],
            datasets: [{
                label: '',
                data: [],
                backgroundColor: ['#B7E0FF', '#FFF5CD', '#FFCFB3', '#E78F81', '#87A2FF'],
            }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: ''
                }
            },
            responsive: true,
        }
    };

    // 함수: 차트 업데이트
    function updateChart(statType) {
        if (statType === 'numOfMem') {
            config.data.labels = ['50인이하', '51~100인', '101~150인', '151~200인', '201인이상']; // 실제 레이블로 변경
            config.data.datasets[0].data = [<c:forEach var="mem" items="${numOfMem}">${mem.fiftyPeople},${mem.hundredPeople},${mem.hundredPeopleHalf},${mem.twoHundredPeople},${mem.twoHundredPeopleHalf}</c:forEach>]; // count로 변경
            config.options.plugins.title.text = '구성원 수 통계';
        } else if (statType === 'premium') {
            config.data.labels = ['프리미엄', '일반']; // 실제 레이블로 변경
            config.data.datasets[0].data = [<c:forEach var="prem" items="${premium}">${prem.premium},${prem.normal},</c:forEach>]; // count로 변경
            config.options.plugins.title.text = '프리미엄 통계';
        } else if (statType === 'numOfMon') {
            config.data.labels = ['3개월이하', '4~6개월', '6~12개월', '1년이상', '2년이상']; // 실제 레이블로 변경
            config.data.datasets[0].data = [<c:forEach var="mon" items="${numOfMon}">${mon.threeMon},${mon.sixMon},${mon.oneYear},${mon.twoYear},${mon.overYear}</c:forEach>]; // count로 변경
            config.options.plugins.title.text = '계약 기간 통계';
        }

        // 차트 업데이트
        myChart.update();
    }

    // Init ChartJS
    var myChart = new Chart(ctx, config);

    // 초기 차트 데이터 설정
    updateChart('${comMsg}');
});
</script>
