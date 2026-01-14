<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割変更" /></jsp:include>

<%-- スタイル --%>
<style>
    /* メインエリア */
    .scroll-content {
        padding-bottom: 100px !important;
    }

    /* 入力欄の微調整 */
    .table input[type="text"] {
        border: 1px solid #ced4da;
        border-radius: 4px;
        padding: 2px 5px;
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
            <h2 class="mb-0">時間割変更</h2>
        </div>

        <hr class="mt-0 flex-shrink-0">

        <%-- テーブルコンテナ --%>
        <div class="container w-75">
            <table class="table table-bordered table-hover text-center shadow-sm">
                <thead>
                    <tr class="table-secondary">
                        <th scope="col" style="width: 50px;"></th>
                        <th scope="col">月</th>
                        <th scope="col">火</th>
                        <th scope="col">水</th>
                        <th scope="col">木</th>
                        <th scope="col">金</th>
                    </tr>
                </thead>

                <tbody>
                    <%-- 1限から6限までループ構造を想定 --%>
                    <c:forEach var="i" begin="1" end="6">
                        <tr>
                            <th scope="row" class="table-secondary align-middle">${i}</th>
                            <c:forEach var="j" begin="1" end="5">
                                <td class="align-middle">
                                    <input type="text" class="form-control form-control-sm mx-auto" style="width: 90%;">
                                </td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <%-- ボタン --%>
    <div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white" style="z-index: 1000;">

        <%-- 戻るボタン --%>
        <a class="btn btn-secondary shadow-sm"
           style="width: 7rem;"
           href="${pageContext.request.contextPath}/timetable/timetable_detail">
            戻る
        </a>

        <%-- 変更ボタン --%>
        <button type="button"
                class="btn btn-primary shadow-sm"
                style="width: 7rem;"
                data-bs-toggle="modal"
                data-bs-target="#updateConfirmModal">
            変更
        </button>

    </div>

</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />

<%-- 変更完了専用モーダルの読込 --%>
<jsp:include page="/ModalCompletion/update_modal.jsp" flush="true" />