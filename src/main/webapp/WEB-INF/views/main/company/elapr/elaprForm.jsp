<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- CKEDITOR API -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
   .cke_notifications_area { display: none; }
</style>

<div>
    <h3>결재 진행</h3>
    <div class="card card-flush" style="width: 100%"> 
        <div class="container">
            <div class="card-header">
                <h2>전자결재 제목</h2>
            </div>
            <div class="card-body pt-0">
                <form id="empProvedocAplyInsert" action="/employee/empElaprUpdate.do" method="post">
                    <input type="hidden" name="prdocNo" value="${elaprVO.elaprNo}">

                    <!-- CKEditor 시작 -->
                    <div style="width: 100%; min-width: 720px; display: flex; justify-content: center; background-color: #dbdbdb; border: 1px solid #f8f8f8;">
                        <textarea id="formEditorCK" name="prdocCn" style="position: absolute;">
                            <c:out value="${param.formContent}"/> <!-- 전달된 양식 내용 -->
                        </textarea>
                    </div>
                    <!-- CKEditor 끝 -->

                    <div style="display: flex; justify-content: right;">
                        <input type="submit" class="btn btn-light-primary mt-3" value="발급하기">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
$(function() {
    // CKEDITOR 자바스크립트 설정
    CKEDITOR.replace('formEditorCK', {
        height: 500,
        width: 740,
        toolbar: [
            { name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'Undo', 'Redo'] },
            { name: 'styles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript'] },
            { name: 'insert', items: ['Image', 'Table', 'HorizontalRule'] }
        ]
    });
});
</script>
