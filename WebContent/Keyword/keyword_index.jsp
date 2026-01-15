<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="キーワード" /></jsp:include>

<%-- スタイル --%>
<style>
    /* キーワード一覧画面専用のスタイル */
    .keyword-list-card {
        border: 1px solid #c0c0c0;
        border-radius: 0.25rem;
        padding: 20px 30px;
        background-color: #ffffff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        margin-top: 10px;
        width: 100%;
    }

    .keyword-table { width: 100%; margin-bottom: 0; border: none; }
    .keyword-table th, .keyword-table td { vertical-align: middle; padding: 10px 0; border-top: none; }
    .keyword-table tr { border-bottom: 1px solid #dee2e6; }
    .keyword-table tr:last-child { border-bottom: none; }
    .keyword-text { font-size: 1.1rem; font-weight: bold; color: #333; display: flex; align-items: center; }
</style>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メイン --%>
<div class="col-md-10 content-area d-flex flex-column h-100">

    <div class="container mt-5 flex-grow-1 overflow-y-auto">

        <div class="text-center mb-4 flex-shrink-0">
            <h2 class="mb-0">キーワード一覧</h2>
        </div>

        <hr class="mt-0 flex-shrink-0">

        <div class="flex-grow-1">
            <div class="text-end mb-3">
                <a href="${pageContext.request.contextPath}/keyword/keyword_register;" class="btn btn-primary" style="width: 7rem;">
                    新規登録
                </a>
            </div>

            <div class="keyword-list-card">
			    <table class="table keyword-table">
			        <tbody>
			            <%-- Controllerから届いた "keywords" を1つずつ "k" として取り出す --%>
			            <c:forEach var="k" items="${keywords}">
			                <tr>
			                    <td style="width: 70%;">
			                        <div class="keyword-text">
			                            <%-- Beanの getPhrase() を呼び出して表示 --%>
			                            <c:out value="${k.phrase}" />
			                        </div>
			                    </td>
			                    <td class="text-end" style="width: 30%;">
			                        <%-- 削除ボタン --%>
									<button type="button"
									        class="btn btn-danger btn-delete-trigger"
									        data-bs-toggle="modal"
									        data-bs-target="#deleteConfirmModal"
									        data-id="${k.id}"
									        style="width: 5rem;">
									    削除
									</button>
									<form id="deleteForm" action="${pageContext.request.contextPath}/keyword/keyword_index" method="post">
									    <input type="hidden" name="id" id="deleteIdInput" value="">
									</form>
			                    </td>
			                </tr>
			            </c:forEach>

			            <%-- もしキーワードが1つもなかった時の表示 --%>
			            <c:if test="${empty keywords}">
			                <tr>
			                    <td colspan="2" class="text-center text-muted">キーワードが登録されていません。</td>
			                </tr>
			            </c:if>
			        </tbody>
			    </table>
			</div>

            <div class="text-start mt-4 flex-shrink-0">
                <a
                    class="btn btn-secondary"
                    style="width: 7rem;"
                    href="${pageContext.request.contextPath}/loginlogout/mainmenu">
                    戻る
                </a>
            </div>

        </div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" flush="true" />

<%-- 削除専用モーダルの読込 --%>
<jsp:include page="/ModalCompletion/delete_modal.jsp" flush="true" />

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 全ての削除ボタンを取得
        const deleteButtons = document.querySelectorAll('.btn-delete-trigger');

        deleteButtons.forEach(button => {
            button.addEventListener('click', function() {
                // ボタンに隠したIDを取得
                const id = this.getAttribute('data-id');
                // モーダル内にある「削除実行用のフォーム」の隠し入力欄にIDをセット
                const modalInput = document.getElementById('deleteIdInput');
                if (modalInput) {
                    modalInput.value = id;
                }
            });
        });
    });
</script>