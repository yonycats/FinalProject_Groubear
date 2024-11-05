<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div style="margin-bottom: 50px;">
	<div style="margin-top: -32px;">
		<div class="separator border-2 my-10"></div>
	</div>
	<div style="margin-left: 30px; margin-top: -100px;">
		<h3>화상채팅</h3>
		<h6>화상채팅</h6>
	</div>
</div>

<div>
	<div class="d-flex flex-column flex-root app-root" id="kt_app_root">
		<div class="app-page flex-column flex-column-fluid" id="kt_app_page">
			<div class="app-main flex-column flex-row-fluid" id="kt_app_main">
				<div class="d-flex flex-column flex-column-fluid">
					<div id="kt_app_content" class="app-content flex-column-fluid">
						<div id="kt_app_content_container"
							class="app-container container-fluid">
							<div class="card card-flush">
								<div
									style="display: flex; flex-direction: row; justify-content: space-between;">
									<form id="searchForm">
										<input type="hidden" name="page" id="page">
										<div
											class="card-header align-items-center py-5 gap-2 gap-md-5">
											<div class="card-title">
												<div
													class="d-flex align-items-center position-relative my-1">
													<i
														class="ki-duotone ki-magnifier fs-3 position-absolute ms-4">
														<span class="path1"></span> <span class="path2"></span>
													</i> <input id="myInput" name="searchWord" type="text"
														data-kt-ecommerce-product-filter="search"
														class="form-control form-control-solid w-250px ps-12"
														placeholder="검색" value="${searchWord }" />
												</div>
											</div>
										</div>
									</form>
									<div
										style="display: flex; align-items: center; padding-right: 27px">
						<div
    style="display: flex; align-items: center; padding-right: 27px;">
    <input type="text" id="createValue"
           data-kt-ecommerce-product-filter="search"
           class="form-control form-control-solid w-175px ps-12" 
           placeholder="방이름"/>

    <button type="button" id="createBtn" class="btn btn-success" >방생성</button>
</div>
										</div>
									</div>
								</div>
								<div class="card-body pt-0">
									<table
										class="table align-middle table-row-dashed fs-6 gy-5 table-bordered"
										id="kt_ecommerce_products_table">
										<thead>
											<tr
												class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0 text-center">
												<th class="min-w-50px h4">번호</th>
												<th class="min-w-150px h4">방이름</th>
												<th class="min-w-100px h4">방장</th>
												<th class="min-w-100px h4">개설시간</th>
												<th class="min-w-100px h4"></th>
											</tr>
										</thead>

										<tbody class="fw-semibold text-gray-600" id="myRoomList">
											<c:set value="${pagingVO.dataList }" var="vcList" />
											<c:choose>
												<c:when test="${empty vcList }">
													<tr>
														<td class="text-center" colspan="8">화상채팅방이 존재하지 않습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${vcList }" var="item">
														<tr>
															<td><div class="text-center">${item.chatNo }</div></td>
															<td id="videoChatNm"><div class="text-center">${item.videoChatNm }</div></td>
															<td><div class="text-center">나야</div></td>
															<td><div class="text-center">${item.videoChatDate }</div></td>


															<td class="d-flex justify-content-center">
    <span class="btn btn-primary" id="modalBtn"
        data-toggle="modal"
        data-target="#exampleModalCenter${item.videoChatNm}">참여</span>
    <button class="btn btn-danger" data-id="${item.chatNo}">삭제</button> <!-- data-id 추가 -->
</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
								<div class="card-footer clearfix" id="pagingArea">${pagingVO.pagingHTML }
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
$(function(){
	let searchForm = $('#searchForm');      // 검색 및 페이징 처리 위한 Form
	let pagingArea = $('#pagingArea');		// 페이징 처리 위한 div
	
	// pagingArea 내의 a 태그를 클릭했을 경우의 이벤트 주기
	   pagingArea.on('click', 'a', function(event) {
	      event.preventDefault();
	      let pageNo = $(this).data('page');
	      searchForm.find('#page').val(pageNo);
	      searchForm.submit();
	   });
});


$('#createBtn').on('click', function() {
    value = $('#createValue').val();
    var obj = { value: value };
    var jsonObj = JSON.stringify(obj);

    console.log(value);

    $.ajax({
        url: "/employee/createroom",
        type: "POST",
        data: jsonObj,
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        success: function(res) {
            var list = res.data.list;
            var html = "";
            console.log(list[1]);

//             for (var i = 0; i < list.length; i++) {
//                 html += "<tr>";
//                 html += "<td>" + (list.length - i) + "</td>";
//                 html += "<td id='videoChatNm' style='display:none'>" + list[i].videoChatNm + "</td>";
//                 html += "<td>" + list[i].roomTitle + "</td>";
//                 html += "<td>" + list[i].endDate + "</td>";
//                 html += "<td><button id='delBtn' class='btn btn-warning'>삭제하기</button></td>";
//                 html += "<td><span class='btn btn-primary' id='modalBtn' data-toggle='modal' data-target='#exampleModalCenter" + list[i].videoChatNm + "'>참여</span></td>";
//                 html += "</tr>";
//             }

//             $('#myRoomList').html('');
//             $('#myRoomList').html(html);
//             $('#createValue').val('');
            alert("방 생성이 완료되었습니다.");
            
            window.location.reload();
        },
        error: function(xhr) {
            alert(xhr.status);
        }
    });
});


    // 방 참여 버튼 클릭 이벤트
    $('#myRoomList').on('click', '.btn-primary', function() {
        // 클릭한 버튼에서 방 ID 가져오기
        var videoChatNm = $(this).closest('tr').find('td#videoChatNm').text();
        // 방 입장 URL 생성
        var enterUrl = `http://biz.gooroomee.com/\${videoChatNm}`;
        console.log(enterUrl);
        // 새 창으로 방 입장
        window.open(enterUrl, '_blank');
    });


    
 // 방 삭제 버튼 클릭 이벤트
    $('#myRoomList').on('click', '.btn-danger', function() {
        var roomId = $(this).data('id'); // 버튼에 저장된 방 ID 가져오기
        var row = $(this).closest('tr'); // 삭제할 행을 가져오기

        if (confirm("정말로 이 방을 삭제하시겠습니까?")) {
            $.ajax({
                url: "/employee/deleteroom/" + roomId, // 삭제 요청 URL
                type: "POST",
                success: function() {
                    row.remove(); // 행 삭제
                },
                error: function(xhr) {
                    alert("삭제 실패: " + xhr.status); // 실패 메시지 표시
                }
            });
        }
    });
    
    
    
</script>
