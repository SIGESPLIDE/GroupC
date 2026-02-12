<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="supportdownConfirmModal" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header bg-primary bg-opacity-25 text-center">
				<h5 class="modal-title w-100">ユニパス連携システム</h5>
			</div>
			<div class="modal-body text-center py-5">
				<h4 class="mb-5">支援段階を下げますか？</h4>
				<div class="d-flex justify-content-center mt-4">
					<button type="button" class="btn btn-secondary mx-3"
						data-bs-dismiss="modal">戻る</button>
					<button type="button" class="btn btn-danger mx-3"
						id="confirmDownBtn" data-bs-dismiss="modal">確定</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var downBtn = document.getElementById('confirmDownBtn');
		if (downBtn) {
			downBtn.addEventListener('click', function() {
				var forms = document.forms;
				for (var i = 0; i < forms.length; i++) {
					if (forms[i].updateValue
							&& forms[i].updateValue.value === "-1") {
						forms[i].submit();
						break;
					}
				}
			});
		}
	});
</script>