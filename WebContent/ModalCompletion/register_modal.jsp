<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade" id="registerConfirmModal" tabindex="-1" aria-labelledby="registerConfirmModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header bg-primary bg-opacity-25 text-center">
                <h5 class="modal-title w-100" id="registerConfirmModalLabel">ユニボパス連携システム</h5>
            </div>

            <div class="modal-body text-center py-5">
                <h4 class="mb-5">登録しますか？</h4>

                <div class="d-flex justify-content-center mt-4">

                    <button type="button" class="btn btn-secondary mx-3" data-bs-dismiss="modal">
                        戻る
                    </button>

                    <button type="button" class="btn btn-danger mx-3" id="confirmRegisterBtn" data-bs-dismiss="modal">
                        確定
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>


<%--遷移用 JavaScript --%>
<script>
    // DOM要素が完全に読み込まれた後に実行
    document.addEventListener('DOMContentLoaded', function() {
        var confirmButton = document.getElementById('confirmRegisterBtn');

        if (confirmButton) {
            confirmButton.addEventListener('click', function() {
                // 遷移先のURLを定義 (KeywordRegisterServlet の成功時のリダイレクト先を想定)
                var completedUrl = '<%= request.getContextPath() %>/ModalCompletion/register_complete.jsp';

                // モーダルが閉じた後にページを遷移させる
                window.location.href = completedUrl;
            });
        }
    });
</script>