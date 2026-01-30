<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割変更" /></jsp:include>

<style>
    /* 全体コンテナの高さ固定 */
    .content-area {
        height: 100vh;
        overflow: hidden;
    }
    /* スクロールエリアの設定 */
    .scrollable-area {
        flex-grow: 1;
        overflow-y: auto;
        padding-bottom: 120px; /* 下部ボタンと被らないための余白 */
    }
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
<form id="mainForm" action="${pageContext.request.contextPath}/timetable/timetable_change" method="post" class="col-md-10 h-100">
    <%-- どのクラスのデータか送信するために隠し持っておく --%>
    <input type="hidden" name="class_name" value="${className}">
    <div class="content-area d-flex flex-column h-100 position-relative">

        <%-- スクロール可能なエリア --%>
        <div class="scrollable-area container mt-5">
            <div class="text-center mb-4 flex-shrink-0">
                <h2 class="mb-0">時間割変更</h2>
            </div>
            <hr class="mt-0 flex-shrink-0">

            <%-- エラーメッセージ --%>
            <div id="errorMessageArea">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger text-center py-2" role="alert" style="font-size: 0.9rem;">
                        ${error}
                    </div>
                </c:if>
            </div>

            <div class="container w-75">
                <table class="table table-bordered table-hover text-center shadow-sm">
                    <thead>
                        <tr class="table-secondary">
                            <th scope="col" style="width: 50px;"></th>
                            <c:forEach var="wd" items="${weekdayList}">
                                <th scope="col">${fn:substring(wd, 0, 1)}</th>
                            </c:forEach>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="i" begin="1" end="6">
                            <tr>
                                <th scope="row" class="table-secondary align-middle">${i}</th>
                                <c:forEach var="wd" items="${weekdayList}">
                                    <td class="align-middle">
                                        <input type="text"
                                               name="subject_${wd}_${i}"
                                               value="${timetableMap[wd][i]}"
                                               class="form-control form-control-sm mx-auto"
                                               style="width: 90%;"
                                               maxlength="10">
                                    </td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <%-- ボタンエリア（常に下部に固定） --%>
        <div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white border-top pt-3" style="z-index: 1000;">
        	<%-- <form action="${pageContext.request.contextPath}/timetable/timetable_detail" method="post">
		        <button type="submit" class="btn btn-secondary shadow-sm" style="width: 7rem;">戻る</button>
        	</form> --%>
            <button type="button" class="btn btn-secondary shadow-sm" style="width: 7rem;" onclick="submitBack();">
                戻る
            </button>

            <button type="button"
                    class="btn btn-primary shadow-sm"
                    style="width: 7rem;"
                    data-bs-toggle="modal"
                    data-bs-target="#updateConfirmModal">
                変更
            </button>
        </div>
    </div>
</form>

<%-- 送信先の切り替え --%>
<script>
function submitBack() {
    const form = document.getElementById('mainForm');
    // JavaScriptで一時的に送信先(action)を「詳細画面」に書き換える
    form.action = "${pageContext.request.contextPath}/timetable/timetable_detail";
    // 送信実行
    form.submit();
}
</script>

<jsp:include page="../footer.jsp" />
<jsp:include page="/ModalCompletion/update_modal.jsp" flush="true" />