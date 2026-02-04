<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title"
		value="キーワード登録" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
	<jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メインコンテンツエリア --%>
<div
	class="col-md-10 content-area d-flex flex-column h-100 position-relative scroll-content p-0">

	<div class="container mt-5 flex-grow-1 overflow-y-auto">

		<%-- タイトル行 --%>
		<div class="text-center mb-4 flex-shrink-0">
			<h2 class="mb-0">キーワード登録</h2>
		</div>

		<hr class="mt-0 mb-5 flex-shrink-0">

		<%-- 登録フォーム --%>
		<div class="register-form-container flex-grow-1">

			<form
				action="${pageContext.request.contextPath}/keyword/keyword_register"
				method="post">
				<div class="row justify-content-center">
					<div class="col-lg-8 col-md-10">

						<%-- 入力フィールド --%>
						<div class="form-group mb-5">
							<label for="keywordInput" class="form-label">強調したいキーワードを入力
								(例: いじめ)</label> <input type="text" class="form-control keyword-input"
								id="keywordInput" name="keyword"
								placeholder="キーワードを入力してください(20字以内)" required maxlength="20">
						</div>

					</div>
				</div>
			</form>


		</div>

	</div>

	<div
		class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white"
		style="z-index: 1000;">

		<%-- 戻るボタン (左下) --%>
		<button type="button" class="btn btn-secondary" style="width: 7rem;"
			onclick="window.location.href='${pageContext.request.contextPath}/keyword/keyword_index';">
			戻る</button>

		<button type="button" class="btn btn-primary" style="width: 7rem;"
			id="preRegisterCheck">登録</button>

	</div>

</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" flush="true" />

<%-- 登録完了専用モーダルの読込 --%>
<jsp:include page="/ModalCompletion/register_modal.jsp" flush="true" />

<%-- 制御用のスクリプト --%>
<script>
	document.getElementById('preRegisterCheck').addEventListener(
			'click',
			function() {
				const input = document.getElementById('keywordInput');

				// 1. 入力チェック（ブラウザ標準の吹き出しを出す）
				if (!input.checkValidity()) {
					// 入力が空、または形式が正しくない場合に吹き出しを表示
					input.reportValidity();
					return; // モーダルは開かずに終了
				}

				// 2. 入力がある場合のみ、モーダルを表示
				var modalElement = document
						.getElementById('registerConfirmModal');
				var myModal = new bootstrap.Modal(modalElement);
				myModal.show();
			});
</script>