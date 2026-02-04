<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="キーワード" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メイン --%>
<div class="col-md-10 content-area d-flex flex-column h-100 position-relative scroll-content p-0">

    <div class="container mt-5 flex-grow-1 overflow-y-auto">


        <div class="text-center mb-4 flex-shrink-0">
            <h2 class="mb-0">パスワード変更</h2>
        </div>

        <hr class="mt-0 flex-shrink-0">

		<div class="container d-flex flex-column align-items-center justify-content-center flex-grow-1">
	        <div class="password-card shadow-sm">
	        	<div class="password-card-header">
	                    別室担任パスワード変更
	            </div>
	            <div class="password-card-body">
	            	<%-- エラーメッセージ表示エリア --%>
	                <c:if test="${not empty error}">
	                    <div class="alert alert-danger text-center py-2" role="alert" style="font-size: 0.9rem;">
	                        ${error}
	                    </div>
	                </c:if>
	            	<form action="${pageContext.request.contextPath}/password/teacher_password" method="post">
					    <input type="password" id="newPassInput" name="newPassword" class="form-control mx-auto custom-input" placeholder="新しいパスワードを入力" required>
						<div>
						    <button type="button" id="changeBtn" class="btn btn-submit-red" style="width: 7rem;">
						        変更
						    </button>
						</div>
					</form>
	            </div>
			</div>
		</div>

		<div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white" style="z-index: 1000;">

	        <%-- 戻るボタン (左下) --%>
	        <button type="button"
	                class="btn btn-secondary"
	                style="width: 7rem;"
	                onclick="window.location.href='${pageContext.request.contextPath}/loginlogout/mainmenu';">
	            戻る
	        </button>

	        <button type="button"
	                class="btn btn-primary"
	                style="width: 15rem;"
	                onclick="window.location.href='${pageContext.request.contextPath}/password/administrator_password';">
				管理者パスワードの設定
	        </button>
		</div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" flush="true" />

<%-- 変更専用モーダルの読込 --%>
<jsp:include page="/ModalCompletion/update_modal.jsp" flush="true" />

<script>
    const passInput = document.getElementById('newPassInput');
    const changeBtn = document.getElementById('changeBtn');

    // エンターキー対策
    document.querySelector('form').addEventListener('keydown', function(e) {
        if (e.key === 'Enter') {
            e.preventDefault(); //
            changeBtn.click();
        }
    });

    // ボタンクリック時の処理
    changeBtn.addEventListener('click', function() {
        // ブラウザのバリデーションチェックを実行
        if (!passInput.checkValidity()) {
            passInput.reportValidity();
            return;
        }

        // 入力がOKな場合のみ、モーダルを表示
        const modalElement = document.getElementById('updateConfirmModal');
        const myModal = new bootstrap.Modal(modalElement);
        myModal.show();
    });
</script>