<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 1. ヘッダーをインクルード --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="登録完了" /></jsp:include>

<%-- 2. サイドメニュー部分 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- 3. メインコンテンツ部分 --%>
<div class="col-md-10 content-area d-flex flex-column h-100">

    <div class="container mt-5 flex-grow-1 d-flex flex-column">

        <%-- ★ 1. タイトル行 (中央揃え) ★ --%>
        <div class="text-center mb-4">
            <h2 class="mb-0">登録完了画面</h2>
            <hr class="mt-2">
        </div>

        <%-- ★ 2. 完了メッセージとボタンを含むエリア ★ --%>
        <div class="d-flex flex-column justify-content-between flex-grow-1 pb-5">

            <%-- 完了メッセージ (左揃え) --%>
            <div class="text-start">
                <h3 class="ms-3">登録が完了しました</h3>
            </div>

            <%-- 戻るボタン (左下配置) --%>
            <div class="text-start">
                <button
                    type="button"
                    class="btn btn-secondary mt-4 ms-3"
                    style="width: 7rem;">
                    戻る
                </button>
            </div>
        </div>

    </div>

</div>

<%-- 4. フッターをインクルード --%>
<jsp:include page="../footer.jsp" />