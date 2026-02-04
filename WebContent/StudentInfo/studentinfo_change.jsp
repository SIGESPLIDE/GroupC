<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="生徒情報変更" /></jsp:include>

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
		<form action="${pageContext.request.contextPath}/studentinfo/studentinfo_change" method="post">
			<div class="container form-group form-control form-control-lg d-flex flex-column w-50">
					<label>生徒ID</label><div class="text-center border rounded bg-light opacity-50 py-2">${stuInfo.studentId}</div>
					<input type="hidden" name="studentId" value="${stuInfo.studentId}">
					<label>年</label><input class="bg-light" type="text" id="gradeInput" value="${grade}" name="grade" placeholder="年を入力してください" required>
					<label>組</label><input class="bg-light" type="text" id="claInput" value="${cla}" name="cla" placeholder="組を入力してください" required>
					<label>名前</label><input class="bg-light" type="text" id="nameInput" value="${stuInfo.studentName}" name="studentName" maxlength="25" placeholder="名前を入力してください" required>

			</div>
		</form>


		<div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white" style="z-index: 1000;">

	        <%-- 戻るボタン --%>
	        <form action="${pageContext.request.contextPath}/studentinfo/studentinfo_detail" method="post">
	        	<input type="hidden" name="studentId" value="${stuInfo.studentId}">
		        <button type="submit"
			            class="btn btn-secondary shadow-sm"
			            style="width: 7rem;">
			        戻る
			    </button>
		    </form>

	        <%-- 変更ボタン --%>
	        <button type="button"
		            class="btn btn-primary shadow-sm"
		            style="width: 7rem;"
					id="preUpdateCheck">
		        変更
		    </button>

		 </div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />

<%-- 変更完了専用モーダルの読込 --%>
<jsp:include page="/ModalCompletion/update_modal.jsp" flush="true" />

<%-- 制御用のスクリプト --%>
<script>
    document.getElementById('preUpdateCheck').addEventListener('click', function() {
        const input = document.getElementById('gradeInput');
        const input2 = document.getElementById('claInput');
        const input3 = document.getElementById('nameInput');

        // 1. 入力チェック（ブラウザ標準の吹き出しを出す）
        if (!input.checkValidity()) {
            // 入力が空、または形式が正しくない場合に吹き出しを表示
            input.reportValidity();
            return; // モーダルは開かずに終了
        } else if (!input2.checkValidity()) {
            // 入力が空、または形式が正しくない場合に吹き出しを表示
            input2.reportValidity();
            return; // モーダルは開かずに終了
        } else if (!input3.checkValidity()) {
            // 入力が空、または形式が正しくない場合に吹き出しを表示
            input3.reportValidity();
            return; // モーダルは開かずに終了
        }

        // 2. 入力がある場合のみ、モーダルを表示
        var modalElement = document.getElementById('updateConfirmModal');
        var myModal = new bootstrap.Modal(modalElement);
        myModal.show();
    });
</script>