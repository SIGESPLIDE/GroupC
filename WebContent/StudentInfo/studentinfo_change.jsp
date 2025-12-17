<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="生徒情報変更" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

        <div class="text-center mb-4">
            <h2 class="mb-0">生徒情報変更</h2>
            <hr class="mt-2">
        </div>

<%-- 入力欄 --%>
		<div class="container form-group form-control form-control-lg d-flex flex-column w-50">
			<label>生徒ID</label><input type="text" placeholder="生徒IDを入力してください">
			<label>年・組</label><input type="text" placeholder="年・組を入力してください">
			<label>名前</label><input type="text" placeholder="名前を入力してください">
    		<div class="mb-3">
  				<label for="fileInput" class="form-label">QR</label>
  				<input class="form-control border-secondary" type="file" id="fileInput">
			</div>
		</div>

		<div onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_detail'" class="position-absolute bottom-0 start-0"><button class="btn btn-secondary m-5">戻る</button></div>
		<div class="position-absolute bottom-0 end-0">
			<button class="btn btn-primary m-5"  data-bs-toggle="modal" data-bs-target="#updateConfirmModal">変更</button>
		</div>

</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />

<%-- 変更完了専用モーダルの読込 --%>
<jsp:include page="/ModalCompletion/update_modal.jsp" flush="true" />