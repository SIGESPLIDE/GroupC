<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="キーワード一覧" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メインエリア --%>
<div class="col-md-10 content-area d-flex flex-column h-100 p-0">

    <%-- スクロール可能なコンテンツエリア --%>
    <div class="container-fluid mt-5 flex-grow-1 overflow-y-auto px-4">

        <div class="text-center mb-4 flex-shrink-0">
            <h2 class="fw-bold">キーワード一覧</h2>
        </div>
        <hr class="mt-0 flex-shrink-0 mb-5">

        <div class="mx-auto pb-5" style="width: 80%;">

            <c:choose>
                <%-- キーワードが一件も存在していなかった場合 --%>
                <c:when test="${empty keywords}">
                    <div class="alert alert-info text-center py-5 shadow-sm" role="alert">
                        <h4 class="alert-heading">キーワードが登録されていません。</h4>
                        <p>下の新規登録ボタンから登録してください ⇩</p>
                        <a href="${pageContext.request.contextPath}/keyword/keyword_register" class="btn btn-primary w-25 shadow-sm mb-1">
                            <i class="bi bi-plus-lg"></i> 新規登録
                        </a>
                    </div>
                </c:when>

                <%-- キーワードが存在する場合 --%>
                <c:otherwise>
                    <%-- 新規登録ボタン --%>
                    <div class="d-flex justify-content-end mb-3">
                        <a href="${pageContext.request.contextPath}/keyword/keyword_register" class="btn btn-primary shadow-sm">
                            <i class="bi bi-plus-lg"></i> 新規登録
                        </a>
                    </div>

                    <%-- キーワード表示カード --%>
                    <div class="card shadow-sm border-0 mb-4">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0 text-center">
                                <thead class="table-dark sticky-top">
                                    <tr>
                                        <th class="py-3 text-start ps-4" style="width: 75%;">キーワード名</th>
                                        <th class="py-3" style="width: 25%;">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="k" items="${keywords}">
                                        <tr>
                                            <td class="text-start ps-4 fw-bold text-dark">
                                                <c:out value="${k.phrase}" />
                                            </td>
                                            <td>
                                                <button type="button"
                                                        class="btn btn-outline-danger btn-sm px-4 btn-delete-trigger"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#deleteConfirmModal"
                                                        data-id="${k.id}">
                                                    削除
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <%-- 削除用隠しフォーム --%>
                    <form id="deleteForm" action="${pageContext.request.contextPath}/keyword/keyword_index" method="post">
                        <input type="hidden" name="id" id="deleteIdInput" value="">
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <%-- ボタンエリア --%>
    <div class="mt-auto d-flex justify-content-between px-5 py-4 bg-white border-top flex-shrink-0">
        <a class="btn btn-secondary shadow-sm" style="width: 7rem;" href="${pageContext.request.contextPath}/loginlogout/mainmenu">
            <i class="bi bi-arrow-left"></i> 戻る
        </a>
    </div>
</div>

<jsp:include page="../footer.jsp" flush="true" />
<jsp:include page="/ModalCompletion/delete_modal.jsp" flush="true" />

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const deleteButtons = document.querySelectorAll('.btn-delete-trigger');
        const modalInput = document.getElementById('deleteIdInput');

        deleteButtons.forEach(button => {
            button.addEventListener('click', function() {
                const id = this.getAttribute('data-id');
                if (modalInput) modalInput.value = id;
            });
        });

        // モーダル内の確定ボタン（IDはdelete_modal.jsp側に依存します）
        const confirmBtn = document.getElementById('confirmRegisterBtn');
        if (confirmBtn) {
            confirmBtn.onclick = function() {
                document.getElementById('deleteForm').submit();
            };
        }
    });
</script>