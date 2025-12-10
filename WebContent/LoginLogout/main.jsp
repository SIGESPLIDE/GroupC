<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 1. 共通ヘッダーを読み込む (タイトルを渡す) --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="ホーム" /></jsp:include>

<style>
/* 📌 【main.jsp 専用スタイル】タイルの高さを画面サイズに応じて計算で設定 */
:root {
    --tile-gap: 20px; /* タイル間の隙間 */
}

/* ★ タイル自体のスタイルは変更なし ★ */
.tile-container { display: block; }
.content-tile {
    /* height: calc() の計算は、親要素の高さ (h-50) から隙間を引く形に修正 */
    height: 100%;

    display: flex; justify-content: center; align-items: center;
    font-size: 1.8rem; font-weight: bold; color: white;
    border-radius: 0.25rem; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    width: 100%; margin: 0;
}
.tile-student { background-color: #009688; }
.tile-timetable { background-color: #28a745; }

/* ★ h-50 が適用された <a> 要素で隙間を調整 ★ */
.tile-link-top {
    margin-bottom: var(--tile-gap); /* 上側のタイルと下側のタイルの間に隙間を設定 */
}
</style>

<%-- 2-A. 共通サイドバーを読み込む (col-md-2 の中) --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- 2-B. メインコンテンツを col-md-10 で囲む --%>
<%-- d-flex flex-column と h-100 を適用し、中の要素に高さを均等に分配させる --%>
<div class="col-md-10 content-area d-flex flex-column h-100">

    <%-- ★★★ 修正箇所: タイル全体を囲むコンテナに h-100 を適用 ★★★ --%>
    <div class="tile-container h-100 d-flex flex-column">

        <%-- 生徒情報 (上側のタイル) --%>
        <%-- h-50: 親の 50% の高さを取る, tile-link-top: 下に隙間を作成 --%>
        <a href="student.jsp" class="text-decoration-none h-50 d-flex flex-column tile-link-top">
            <div class="content-tile tile-student shadow">生徒情報</div>
        </a>

        <%-- 時間割 (下側のタイル) --%>
        <%-- h-50: 親の 50% の高さを取る --%>
        <a href="timetable.jsp" class="text-decoration-none h-50 d-flex flex-column">
            <div class="content-tile tile-timetable shadow">時間割</div>
        </a>
    </div>

</div>

<%-- 3. 共通フッターを読み込む --%>
<jsp:include page="../footer.jsp" flush="true" />

<%-- 4. ログアウト専用モーダルをインクルード --%>
<jsp:include page="/ModalCompletion/logout_modal.jsp" flush="true" />