<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="ホーム" /></jsp:include>

<%-- スタイル --%>
<style>
:root {
    --tile-gap: 20px;
}
.tile-container { display: block; }
.content-tile {
    height: 100%;
    display: flex; justify-content: center; align-items: center;
    font-size: 1.8rem; font-weight: bold; color: white;
    border-radius: 0.25rem; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    width: 100%; margin: 0;
}
.tile-student { background-color: #009688; }
.tile-timetable { background-color: #28a745; }
.tile-link-top {
    margin-bottom: var(--tile-gap);
}
</style>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メイン --%>
<div class="col-md-10 content-area d-flex flex-column h-100">
    <div class="tile-container h-100 d-flex flex-column">

        <a href="${pageContext.request.contextPath}/studentinfo/studentinfo_list" class="text-decoration-none h-50 d-flex flex-column tile-link-top">
            <div class="content-tile tile-student shadow">生徒情報</div>
        </a>

        <a href="${pageContext.request.contextPath}/timetable/timetable_list" class="text-decoration-none h-50 d-flex flex-column">
            <div class="content-tile tile-timetable shadow">時間割</div>
        </a>
    </div>

</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" flush="true" />

<%-- ログアウト専用モーダルの読込 --%>
<jsp:include page="/ModalCompletion/logout_modal.jsp" flush="true" />