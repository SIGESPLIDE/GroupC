<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header bg-primary bg-opacity-25 text-center">
        <h5 class="modal-title w-100" id="deleteConfirmModalLabel">ユニボパス連携システム</h5>
      </div>

      <div class="modal-body text-center py-5">
        <h4 class="mb-5">削除しますか？</h4>

        <div class="d-flex justify-content-center mt-4">

            <%-- 戻るボタン (btn-secondary: 灰色) --%>
            <button type="button" class="btn btn-secondary mx-3" data-bs-dismiss="modal">
                戻る
            </button>

            <%-- 削除ボタンのテキストを「確定」に変更 (btn-danger) --%>
            <button type="button" class="btn btn-danger mx-3" data-bs-dismiss="modal">
                確定
            </button>
        </div>
      </div>

    </div>
  </div>
</div>