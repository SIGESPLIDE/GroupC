<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="キーワード" /></jsp:include>

<%-- スタイル --%>
<style>
    /* パスワード変更画面専用のスタイル */
    .content-area {
        background-color: #ffffff;
        min-height: 80vh;
        position: relative;
    }

    /* 中央のパスワード変更カード */
    .password-card {
        max-width: 600px;
        width: 100%;
        border: 1px solid #999;
        border-radius: 8px;
        overflow: hidden;
    }

    .password-card-header {
        background-color: #0099d9; /* 画像の青色 */
        color: white;
        padding: 10px 20px;
        font-weight: bold;
    }

    .password-card-body {
        background-color: #eeeeee;
        padding: 40px;
        text-align: center;
    }

    /* 入力フィールド */
    .custom-input {
        border-radius: 4px;
        border: 1px solid #ccc;
        padding: 10px;
        width: 100%;
        max-width: 400px;
        margin-bottom: 20px;
    }

    /* 変更ボタン（赤色） */
    .btn-submit-red {
        background-color: #d9334e;
        color: white;
        padding: 8px 40px;
        border: none;
        border-radius: 4px;
    }

    .btn-submit-red:hover {
        background-color: #b52a41;
        color: white;
    }

    /* フッター付近のボタン配置用 */
    .action-footer {
        padding: 20px;
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
    }
</style>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メイン --%>
<div class="col-md-10 content-area d-flex flex-column h-100">

    <div class="container mt-5 flex-grow-1 overflow-y-auto">


        <div class="text-center mb-4 flex-shrink-0">
            <h2 class="mb-0">パスワード</h2>
        </div>

        <hr class="mt-0 flex-shrink-0">

		<div class="container d-flex flex-column align-items-center justify-content-center flex-grow-1">
	        <div class="password-card shadow-sm">
	        	<div class="password-card-header">
	                    管理者パスワード変更
	            </div>
	            <div class="password-card-body">
	            	<form action="UpdatePasswordServlet" method="post">
	                	<input type="password" name="newPassword" class="form-control mx-auto custom-input" placeholder="新しいパスワードを入力">
	                    <div>
	                        <button type="button"
                					class="btn btn-submit-red"
                					style="width: 7rem;"
                					data-bs-toggle="modal"
                					data-bs-target="#updateConfirmModal"> <%-- 変更モーダルを起動 --%>
            					変更
        					</button>
	                    </div>
	                </form>
	            </div>
			</div>
		</div>

		<div class="action-footer">
            <div class="text-start mt-4 flex-shrink-0">
                <button
                    type="button"
                    class="btn btn-secondary"
                    style="width: 7rem;"
                    onclick="window.location.href='./teacher_password.jsp';">
                    戻る
                </button>
            </div>
        </div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" flush="true" />

<%-- 変更専用モーダルの読込 --%>
<jsp:include page="/ModalCompletion/update_modal.jsp" flush="true" />