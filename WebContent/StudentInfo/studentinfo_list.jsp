<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title"
		value="生徒情報一覧" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
	<jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メインエリア --%>
<div class="col-md-10 content-area d-flex flex-column h-100 p-0">

	<%-- スクロール可能なコンテンツエリア --%>
	<div class="container-fluid mt-5 flex-grow-1 overflow-y-auto px-4">

		<%-- タイトル --%>
		<div class="text-center mb-4">
			<h2 class="fw-bold">生徒情報一覧</h2>
		</div>
		<hr class="mb-5">

		<div class="mx-auto pb-5" style="width: 85%;">

			<c:choose>
				<%-- 学生情報が一件も存在していなかった場合 --%>
				<c:when test="${not empty emptyError}">
					<div class="alert alert-info text-center py-5 shadow-sm"
						role="alert">
						<h4 class="alert-heading">${emptyError}</h4>
						<p>下の新規登録ボタンから登録してください⇩</p>
						<button type="button" class="btn btn-primary w-25 shadow-sm mb-1"
							onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_regist'">
							<i class="bi bi-person-plus-fill"></i> 新規登録
						</button>
					</div>
				</c:when>
				<c:otherwise>
					<%-- 検索カード --%>
					<div class="card shadow-sm mb-5 border-0 bg-light">
						<div class="card-body p-4">
							<form
								action="${pageContext.request.contextPath}/studentinfo/studentinfo_list"
								method="post">
								<div class="row g-3 align-items-end">
									<div class="col-md-4">
										<label class="form-label small fw-bold text-secondary">生徒ID</label>
										<input type="text" name="searchId"
											class="form-control border-secondary-subtle"
											placeholder="IDを入力"
											value="${not empty searchId ? searchId : ''}">
									</div>
									<div class="col-md-5">
										<label class="form-label small fw-bold text-secondary">生徒名</label>
										<input type="text" name="searchName"
											class="form-control border-secondary-subtle"
											placeholder="名前を入力"
											value="${not empty searchName ? searchName : ''}">
									</div>
									<div class="d-flex flex-column col-md-3">
										<button type="button"
											class="btn btn-primary w-100 shadow-sm mb-1"
											onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_regist'">
											<i class="bi bi-person-plus-fill"></i> 新規登録
										</button>
										<button type="submit"
											class="btn btn-secondary w-100 shadow-sm">
											<i class="bi bi-search"></i> 検索
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>

					<%-- メッセージ・エラー表示エリア --%>
					<c:if test="${not empty errorMessage}">
						<div class="alert alert-warning text-center shadow-sm py-2 mb-4">${errorMessage}</div>
					</c:if>
					<c:if test="${not empty searchMessage}">
						<div class="alert alert-info text-center shadow-sm py-2 mb-4">${searchMessage}</div>
					</c:if>
					<c:if test="${not empty deleteError}">
						<div class="alert alert-danger text-center shadow-sm">${deleteError}</div>
					</c:if>

					<%-- テーブルエリア --%>
					<div class="card shadow-sm border-0 mb-4">
						<div class="table-responsive">
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
											<td style="width: 100px;">
												<form
													action="${pageContext.request.contextPath}/studentsupport/activity_detail"
													method="post">
													<input type="hidden" name="studentId"
														value="${stuInfo.studentId}">
													<button type="submit"
														class="btn btn-outline-primary btn-sm w-100">交流詳細</button>
												</form>
											</td>
											<td style="width: 100px;">
												<form
													action="${pageContext.request.contextPath}/studentsupport/support_level"
													method="post">
													<input type="hidden" name="studentId"
														value="${stuInfo.studentId}">
													<button type="submit"
														class="btn btn-outline-primary btn-sm w-100">支援段階</button>
												</form>
											</td>
											<td style="width: 100px;">
												<form
													action="${pageContext.request.contextPath}/studentinfo/studentinfo_detail"
													method="post">
													<input type="hidden" name="studentId"
														value="${stuInfo.studentId}">
													<button type="submit"
														class="btn btn-outline-primary btn-sm w-100">生徒詳細</button>
												</form>
											</td>
											<td style="width: 100px;">
												<button type="button"
													class="btn btn-danger btn-sm w-100 btn-delete-trigger"
													data-bs-toggle="modal" data-bs-target="#deleteConfirmModal"
													data-id="${stuInfo.studentId}">削除</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<%-- 下部固定ボタンエリア --%>
	<div
		class="mt-auto d-flex justify-content-between px-5 py-4 bg-white border-top flex-shrink-0">
		<a class="btn btn-secondary shadow-sm" style="width: 7rem;"
			href="${pageContext.request.contextPath}/loginlogout/mainmenu"> <i
			class="bi bi-arrow-left"></i> 戻る
		</a>
	</div>

	<%-- 削除用隠しフォーム --%>
	<form id="deleteForm"
		action="${pageContext.request.contextPath}/studentinfo/studentinfo_delete"
		method="post">
		<input type="hidden" name="studentId" id="deleteIdInput">
	</form>

</div>

<jsp:include page="../footer.jsp" />
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