<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="キーワード登録" /></jsp:include>

<%-- スタイル --%>
<style>
	/* メインエリア */
    .scroll-content {
        padding-bottom: 100px !important;
    }

    /* キーワード登録画面専用のスタイル */
    .register-form-container {
        /* フォームの枠線や背景が必要な場合はここにスタイルを追加 */
        padding: 40px; /* コンテナ内のパディング */
    }

    /* 入力フィールドの幅調整 */
    .keyword-input {
        width: 100%;
        max-width: 500px; /* 入力フィールドの最大幅を制限 */
    }
</style>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メインコンテンツエリア --%>
<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

    <div class="container mt-5 flex-grow-1 overflow-y-auto">

        <%-- タイトル行 --%>
        <div class="text-center mb-4 flex-shrink-0">
            <h2 class="mb-0">キーワード登録</h2>
        </div>

        <hr class="mt-0 mb-5 flex-shrink-0">

        <%-- 登録フォーム --%>
        <div class="register-form-container flex-grow-1">

            <form action="KeywordRegisterServlet" method="post">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10">

                        <%-- 入力フィールド --%>
                        <div class="form-group mb-5">
                            <label for="keywordInput" class="form-label">強調したいキーワードを入力 (例: いじめ)</label>
                            <input type="text"
                                   class="form-control keyword-input"
                                   id="keywordInput"
                                   name="keyword"
                                   placeholder="キーワードを入力してください"
                                   required>
                        </div>

                    </div>
                </div>
        	</form>


        </div>

    </div>

    <div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white" style="z-index: 1000;">

        <%-- 戻るボタン (左下) --%>
        <button type="button"
                class="btn btn-secondary"
                style="width: 7rem;"
                onclick="window.location.href='keyword_index.jsp';"> <%-- キーワード一覧画面への遷移を設定 --%>
            戻る
        </button>

        <button type="button"
                class="btn btn-primary"
                style="width: 7rem;"
                data-bs-toggle="modal"
                data-bs-target="#registerConfirmModal"> <%-- 登録完了モーダルを起動 --%>
            登録
        </button>

    </div>

</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" flush="true" />

<%-- 登録完了専用モーダルの読込 --%>
<jsp:include page="/ModalCompletion/register_modal.jsp" flush="true" />