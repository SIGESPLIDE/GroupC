<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                        <tr>
                            <td style="width: 70%;"><div class="keyword-text">キーワード1</div></td>
                            <td class="text-end" style="width: 30%;">
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal" style="width: 5rem;">削除</button>
                            </td>
                        </tr>

                        <% for (int i = 4; i <= 30; i++) { %>
                        <tr>
                            <td><div class="keyword-text">テストキーワード<%= i %> (長い行の確認用)</div></td>
                            <td class="text-end">
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal" style="width: 5rem;">削除</button>
                            </td>
                        </tr>
                        <% } %>

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