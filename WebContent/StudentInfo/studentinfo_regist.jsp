<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="生徒情報登録" /></jsp:include>

<style>
    /* メインエリア */
    .content-area {
        padding-bottom: 80px !important;
    }
</style>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メイン --%>
<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

    <div class="container mt-5 flex-grow-1 overflow-y-auto">

        <div class="text-center mb-4 flex-shrink-0">
            <h2 class="mb-0">生徒情報変更</h2>
        </div>

        <hr class="mt-0 flex-shrink-0">

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

		<div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-5">

	        <%-- 戻るボタン --%>
	        <a class="btn btn-secondary shadow-sm"
	           style="width: 7rem;"
	           href="${pageContext.request.contextPath}/studentinfo/studentinfo_list">
	           戻る
	        </a>

	        <%-- 登録ボタン --%>
	        <button type="button"
		            class="btn btn-primary shadow-sm"
		            style="width: 7rem;"
		            data-bs-toggle="modal"
		            data-bs-target="#registerConfirmModal">
		        登録
		    </button>

		 </div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />

<%-- 登録完了専用モーダルの読込 --%>
<jsp:include page="/ModalCompletion/register_modal.jsp" flush="true" />