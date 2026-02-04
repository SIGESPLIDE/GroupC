<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade" id="deleteConfirmModal" tabindex="-1"
	aria-labelledby="registerConfirmModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<div class="modal-header bg-primary bg-opacity-25 text-center">
				<h5 class="modal-title w-100" id="registerConfirmModalLabel">ユニボパス連携システム</h5>
			</div>

			<div class="modal-body text-center py-5">
				<h4 class="mb-5">削除しますか？</h4>

				<div class="d-flex justify-content-center mt-4">

					<button type="button" class="btn btn-secondary mx-3"
						data-bs-dismiss="modal">戻る</button>

					<button type="button" class="btn btn-danger mx-3"
						id="confirmRegisterBtn" data-bs-dismiss="modal">確定</button>
				</div>
			</div>

		</div>
	</div>
</div>


<%--遷移用 JavaScript --%>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var confirmButton = document.getElementById('confirmRegisterBtn');

		if (confirmButton) {
			confirmButton.addEventListener('click', function() {
				// ページ内の最初の「form」タグを取得する
				var targetForm = document.forms[0];

				if (targetForm) {
					targetForm.submit(); // 見つかったフォームを送信
				} else {
					console.error("送信できるフォームがページ内に見つかりません。");
				}
			});
		}
	});
</script>