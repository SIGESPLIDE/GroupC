<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割一覧" /></jsp:include>

<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">
    <div class="container mt-5 flex-grow-1 overflow-y-auto pb-5">

        <div class="text-center mb-4">
            <h2 class="fw-bold">時間割一覧</h2>
        </div>
        <hr class="mb-5">

        <div class="mx-auto" style="width: 70%;">
            <c:choose>
                <c:when test="${not empty classList}">
                    <div class="card shadow-sm border-0">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0 text-center">
                                <thead class="table-dark">
                                    <tr>
                                        <th class="py-3" style="width: 70%;">クラス</th>
                                        <th class="py-3" style="width: 30%;">詳細確認</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="c" items="${classList}">
                                        <tr>
                                            <td class="py-3 fw-bold fs-5">
                                                <i class="bi bi-door-closed me-2 text-primary"></i>
                                                <c:out value="${c.classes}" />
                                            </td>
                                            <td class="py-3">
                                                <a href="${pageContext.request.contextPath}/timetable/timetable_detail?class_name=${c.classes}"
                                                   class="btn btn-outline-primary shadow-sm px-4">
                                                    詳細 <i class="bi bi-chevron-right small"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="alert alert-light border text-center py-5 shadow-sm" role="alert">
                        <i class="bi bi-info-circle fs-1 text-secondary mb-3 d-block"></i>
                        <h5 class="fw-bold">クラスが見つかりません</h5>
                        <p class="text-muted mb-0">利用する生徒の情報を先に登録してください。</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <%-- 下部固定戻るボタン --%>
    <div class="position-absolute bottom-0 start-0 end-0 d-flex px-5 pb-4 bg-white border-top pt-3" style="z-index: 1000;">
        <a class="btn btn-secondary shadow-sm" style="width: 8rem;" href="${pageContext.request.contextPath}/loginlogout/mainmenu">
            <i class="bi bi-arrow-left"></i> 戻る
        </a>
    </div>
</div>

<jsp:include page="../footer.jsp" />