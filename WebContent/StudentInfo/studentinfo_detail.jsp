<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="生徒情報詳細" /></jsp:include>

<%-- スタイル --%>
<style>
    /* メインエリア */
    .scroll-content {
        padding-bottom: 100px !important;
    }

    /* QR画像の表示枠 */
    .qr-display-box {
        width: 150px;
        height: 150px;
        background-color: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 5px;
    }
</style>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メイン --%>
<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

    <div class="container mt-5 flex-grow-1 overflow-y-auto">

        <div class="text-center mb-4 flex-shrink-0">
            <h2 class="mb-0">生徒情報詳細</h2>
        </div>

        <hr class="mt-0 flex-shrink-0">

        <%-- 情報欄 --%>
        <div class="container form-group form-control form-control-lg d-flex flex-column w-50 shadow-sm p-4">
        <c:forEach var="stuInfo" items="${stuInfoList}">
            <label class="small text-muted">生徒ID</label>
            <div class="text-center border bg-light rounded mb-3 py-2">${stuInfo.studentId}</div>

            <label class="small text-muted">年・組</label>
            <div class="text-center border bg-light rounded mb-3 py-2">${stuInfo.classes}</div>

            <label class="small text-muted">名前</label>
            <div class="text-center border bg-light rounded mb-3 py-2">${stuInfo.studentName}</div>
		</c:forEach>
            <div class="mb-3">
                <label class="small text-muted">QR</label>
                <div class="qr-display-box border border-secondary mx-auto">
                    <%-- ここに実際のQR画像を表示 --%>
                    <img src="${pageContext.request.contextPath}/images/qr-sample.png" alt="QR" style="max-width: 100%; height: auto;">
                </div>
            </div>
        </div>
    </div>

    <div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white" style="z-index: 1000;">

        <%-- 戻るボタン --%>
        <a class="btn btn-secondary shadow-sm"
           style="width: 7rem;"
           href="${pageContext.request.contextPath}/studentinfo/studentinfo_list">
           戻る
        </a>

        <%-- 変更ボタン --%>
        <a class="btn btn-primary shadow-sm"
           style="width: 7rem;"
           href="${pageContext.request.contextPath}/studentinfo/studentinfo_change">
           変更
        </a>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />