<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String loginPageUrl = request.getContextPath() + "/loginlogout/logout";
%>

<div class="modal fade" id="logoutConfirmModal" tabindex="-1"
	aria-labelledby="logoutConfirmModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<div class="modal-header bg-primary bg-opacity-25 text-center">
				<h5 class="modal-title w-100" id="logoutConfirmModalLabel">ユニボパス連携システム</h5>
			</div>

			<div class="modal-body text-center py-5">
				<h4 class="mb-5">ログアウトしますか？</h4>

				<div class="d-flex justify-content-center mt-4">

					<button type="button" class="btn btn-secondary mx-3"
						data-bs-dismiss="modal">戻る</button>

					<button type="button" class="btn btn-danger mx-3"
						onclick="window.location.href = '<%=loginPageUrl%>';">
						ログアウト</button>
				</div>
			</div>

		</div>
	</div>
</div>