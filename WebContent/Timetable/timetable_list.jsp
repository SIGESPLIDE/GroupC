<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割一覧" /></jsp:include>

<%-- スタイル --%>
<style>
    /* メインエリア */
    .scroll-content {
        padding-bottom: 100px !important;
    }
</style>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メインエリア --%>
<div class="col-md-10 content-area d-flex flex-column h-100">

    <%-- スクロールを可能にするコンテナ --%>
    <div class="container mt-5 flex-grow-1 overflow-y-auto content-container">

        <div class="text-center mb-4 flex-shrink-0">
            <h2 class="mb-0">時間割一覧</h2>
        </div>

        <hr class="mt-0 mb-5 flex-shrink-0">

        <div class="container w-75">
            <c:choose>
                <%-- クラスが存在する場合 --%>
                <c:when test="${not empty classList}">
                    <table class="table table-bordered text-center border-secondary shadow-sm">
                        <thead class="table-light">
                            <tr>
                                <th scope="col" class="w-75">クラス</th>
                                <th scope="col" class="w-25"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${classList}">
                                <tr>
                                    <td class="align-middle fw-bold">
                                        <c:out value="${c.classes}" />
                                    </td>
                                    <td>
                                        <%-- 詳細ボタン：URLパラメータにクラス名を埋め込む --%>
                                        <a href="${pageContext.request.contextPath}/timetable/timetable_detail?class_name=${c.classes}"
                                           class="btn btn-primary w-100">
                                            詳細
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>

                <%-- クラスが存在しない場合 --%>
                <c:otherwise>
                    <div class="alert alert-warning text-center py-5 shadow-sm" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        クラスが登録されていません。<br>
                        利用する生徒の情報を登録してください。
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <%-- 戻るボタン --%>
        <div class="text-start mt-5 mb-3 w-75 mx-auto">
            <a class="btn btn-secondary shadow-sm"
               style="width: 7rem;"
               href="${pageContext.request.contextPath}/loginlogout/mainmenu">
                戻る
            </a>
        </div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />