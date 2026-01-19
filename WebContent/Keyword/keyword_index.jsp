<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"><jsp:param name="title" value="キーワード一覧" /></jsp:include>

<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">
    <div class="container mt-5 flex-grow-1 overflow-y-auto pb-5">

        <div class="text-center mb-4">
            <h2 class="fw-bold">キーワード一覧</h2>
        </div>
        <hr class="mb-5">

        <div class="mx-auto" style="width: 80%;">
            <%-- 新規登録ボタンを右上に --%>
            <div class="d-flex justify-content-end mb-3">
                <a href="${pageContext.request.contextPath}/keyword/keyword_register" class="btn btn-primary shadow-sm">
                    <i class="bi bi-plus-lg"></i> 新規登録
                </a>
            </div>

            <%-- キーワード表示カード --%>
            <div class="card shadow-sm border-0">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0 text-center">
                        <thead class="table-dark">
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
                            <c:if test="${empty keywords}">
                                <tr>
                                    <td colspan="2" class="py-5 text-muted">キーワードが登録されていません。</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

            <%-- 削除フォーム --%>
            <form id="deleteForm" action="${pageContext.request.contextPath}/keyword/keyword_index" method="post">
                <input type="hidden" name="id" id="deleteIdInput" value="">
            </form>
        </div>
    </div>

    <%-- 下部固定戻るボタン --%>
    <div class="position-absolute bottom-0 start-0 end-0 d-flex px-5 pb-4 bg-white border-top pt-3" style="z-index: 1000;">
        <a class="btn btn-secondary shadow-sm" style="width: 8rem;" href="${pageContext.request.contextPath}/loginlogout/mainmenu">
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
        const confirmBtn = document.getElementById('confirmRegisterBtn');
        if (confirmBtn) {
            confirmBtn.onclick = function() {
                document.getElementById('deleteForm').submit();
            };
        }
    });
</script>