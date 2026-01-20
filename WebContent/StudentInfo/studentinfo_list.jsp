<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="生徒情報一覧" /></jsp:include>

<style>
    /* コンテンツエリア全体の微調整 */
    .content-wrapper {
        padding-bottom: 100px; /* 下部固定ボタンとの重なり防止 */
    }
    /* テーブルのホバー効果を強調 */
    .table-hover tbody tr:hover {
        background-color: rgba(0,0,0,.03);
    }
    /* 入力欄のフォーカス時の色 */
    .form-control:focus {
        border-color: #80bdff;
        box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
    }
</style>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メインエリア --%>
<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

    <div class="container mt-5 flex-grow-1 overflow-y-auto content-wrapper">

        <%-- タイトル --%>
        <div class="text-center mb-4">
            <h2 class="fw-bold">生徒情報一覧</h2>
        </div>
        <hr class="mb-5">

        <div class="mx-auto" style="width: 85%;">

            <%-- 新規登録ボタン --%>
            <div class="d-flex justify-content-end mb-3">
                <button type="button" class="btn btn-primary shadow-sm" onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_regist'">
                    <i class="bi bi-person-plus-fill"></i> 新規登録
                </button>
            </div>

            <%-- 検索カード --%>
            <div class="card shadow-sm mb-5 border-0 bg-light">
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/studentinfo/studentinfo_list" method="post">
                        <div class="row g-3 align-items-end">
                            <%-- ID検索欄 --%>
                            <div class="col-md-4">
                                <label class="form-label small fw-bold text-secondary">生徒ID</label>
                                <input type="text" name="searchId" class="form-control border-secondary-subtle" placeholder="IDを入力" value="${not empty searchId ? searchId : ''}">
                            </div>

                            <%-- 名前検索欄 --%>
                            <div class="col-md-5">
                                <label class="form-label small fw-bold text-secondary">生徒名</label>
                                <input type="text" name="searchName" class="form-control border-secondary-subtle" placeholder="名前を入力" value="${not empty searchName ? searchName : ''}">
                            </div>

                            <%-- 検索ボタン --%>
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-secondary w-100 shadow-sm">
                                    <i class="bi bi-search"></i> 検索
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <%-- 数値エラーメッセージ（IDに文字が入力された場合） --%>
			<c:if test="${not empty errorMessage}">
			    <div class="alert alert-warning text-center shadow-sm py-2 mb-4" role="alert">
			        <i class="bi bi-exclamation-circle-fill me-2"></i> ${errorMessage}
			    </div>
			</c:if>

			<%-- 検索結果なしメッセージ --%>
			<c:if test="${not empty searchMessage}">
			    <div class="alert alert-info text-center shadow-sm py-2 mb-4" role="alert">
			        <i class="bi bi-info-circle-fill me-2"></i> ${searchMessage}
			    </div>
			</c:if>

            <%-- エラー表示 --%>
            <c:if test="${not empty deleteError}">
                <div class="alert alert-danger text-center shadow-sm" role="alert">
                    <i class="bi bi-exclamation-triangle-fill"></i> ${deleteError}
                </div>
            </c:if>

            <%-- テーブルエリア --%>
            <div class="card shadow-sm border-0">
                <div class="table-responsive" style="max-height: 500px;">
                    <table class="table table-hover text-center mb-0">
                        <thead class="table-dark sticky-top">
                            <tr>
                                <th class="py-3">生徒ID</th>
                                <th class="py-3">名前</th>
                                <th class="py-3" colspan="4">アクション</th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <c:forEach var="stuInfo" items="${stuInfoList}">
                                <tr>
                                    <td class="fw-bold">${stuInfo.studentId}</td>
                                    <td>${stuInfo.studentName}</td>
                                    <%-- ボタン --%>
                                    <td style="width: 100px;">
                                        <form action="${pageContext.request.contextPath}/studentsupport/activity_detail" method="post">
                                            <input type="hidden" name="studentId" value="${stuInfo.studentId}">
                                            <button type="submit" class="btn btn-outline-primary btn-sm w-100">交流詳細</button>
                                        </form>
                                    </td>
                                    <td style="width: 100px;">
                                        <form action="${pageContext.request.contextPath}/studentsupport/support_level" method="post">
                                            <input type="hidden" name="studentId" value="${stuInfo.studentId}">
                                            <button type="submit" class="btn btn-outline-primary btn-sm w-100">支援段階</button>
                                        </form>
                                    </td>
                                    <td style="width: 100px;">
                                        <form action="${pageContext.request.contextPath}/studentinfo/studentinfo_detail" method="post">
                                            <input type="hidden" name="studentId" value="${stuInfo.studentId}">
                                            <button type="submit" class="btn btn-outline-primary btn-sm w-100">生徒詳細</button>
                                        </form>
                                    </td>
                                    <td style="width: 100px;">
                                        <button type="button" class="btn btn-danger btn-sm w-100 btn-delete-trigger"
                                                data-bs-toggle="modal" data-bs-target="#deleteConfirmModal"
                                                data-id="${stuInfo.studentId}">削除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <%-- 削除用隠しフォーム --%>
            <form id="deleteForm" action="${pageContext.request.contextPath}/studentinfo/studentinfo_delete" method="post">
                <input type="hidden" name="studentId" id="deleteIdInput">
            </form>

        </div>
    </div>

    <%-- 下部固定ボタンエリア --%>
    <div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white border-top pt-3" style="z-index: 1000;">
        <a class="btn btn-secondary shadow-sm" style="width: 8rem;" href="${pageContext.request.contextPath}/loginlogout/mainmenu">
            <i class="bi bi-arrow-left"></i> 戻る
        </a>
    </div>

</div>

<jsp:include page="../footer.jsp" />
<jsp:include page="/ModalCompletion/delete_modal.jsp" flush="true" />

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 1. 削除ボタンのID連携
        const deleteButtons = document.querySelectorAll('.btn-delete-trigger');
        const modalInput = document.getElementById('deleteIdInput');

        deleteButtons.forEach(button => {
            button.addEventListener('click', function() {
                const id = this.getAttribute('data-id');
                if (modalInput) modalInput.value = id;
            });
        });

        // 2. モーダルの確定ボタン連携（IDが modalExecuteBtn と仮定）
        const confirmBtn = document.getElementById('confirmRegisterBtn');
        if (confirmBtn) {
            confirmBtn.onclick = function() {
                document.getElementById('deleteForm').submit();
            };
        }
    });
</script>