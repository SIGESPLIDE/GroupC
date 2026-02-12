<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title"
		value="支援段階" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
	<jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メイン --%>
<div
	class="col-md-10 content-area d-flex flex-column h-100 position-relative p-0">
	<div class="container-fluid mt-5 flex-grow-1 overflow-y-auto mb-3">

		<div class="text-center mb-4 flex-shrink-0">
			<h2 class="mb-0">支援段階</h2>
		</div>
		<hr class="mt-0 flex-shrink-0 mb-5">

		<%-- 支援段階の表示 --%>
		<div class="container w-75 pb-5">
			<div
				class="rounded-start rounded-end bg-secondary text-white mb-3 p-4 d-flex align-items-center justify-content-between">
				<h4 class="mb-0">現在の段階 : ${supLev.supportLevel}</h4>

				<%-- ボタン --%>
				<div class="d-flex gap-3">
					<%-- 支援段階が1の場合に表示 --%>
					<c:if test="${supLev.supportLevel > 1}">
						<form
							action="${pageContext.request.contextPath}/studentsupport/support_level_update"
							method="post">
							<input type="hidden" name="studentId" value="${supLev.studentId}">
							<input type="hidden" name="updateValue" value="-1">
							<button type="button" class="btn btn-warning shadow-sm"
								style="width: 10rem;" data-bs-toggle="modal"
								data-bs-target="#supportdownConfirmModal">支援段階を下げる</button>
						</form>
					</c:if>

					<form
						action="${pageContext.request.contextPath}/studentsupport/support_level_update"
						method="post">
						<input type="hidden" name="studentId" value="${supLev.studentId}">
						<input type="hidden" name="updateValue" value="1">
						<button type="button" class="btn btn-primary shadow-sm"
							style="width: 10rem;" data-bs-toggle="modal"
							data-bs-target="#supportupConfirmModal">支援段階を上げる</button>
					</form>
				</div>
			</div>

			<div class="alert alert-info text-center shadow-sm">
				昨日までの確定データに基づいた集計です。本日分は翌日反映されます。</div>

			<c:choose>
				<%-- ログインログアウト情報がない場合 --%>
				<c:when test="${empty attReco || attReco.totalDays == 0}">
					<div class="text-center text-primary py-5">
						<h4>昨日までの登校記録はありません</h4>
					</div>
				</c:when>
				<%-- ログインログアウト情報がある場合 --%>
				<c:otherwise>
					<table
						class="table table-striped text-center border-secondary w-100 shadow-sm">
						<tbody>
							<tr>
								<td class="py-4"><h5>連続登校日数 :
										${attReco.sequentialDays} 日</h5></td>
							</tr>
							<tr>
								<td class="py-4"><h5>学校滞在時間 : ${attReco.schoolTime} 時間</h5></td>
							</tr>
							<tr>
								<td class="py-4"><h5>累計登校日数 : ${attReco.totalDays} 日</h5></td>
							</tr>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div
		class="mt-auto d-flex justify-content-between px-5 py-4 bg-white border-top flex-shrink-0">
		<a class="btn btn-secondary shadow-sm" style="width: 7rem;"
			href="${pageContext.request.contextPath}/studentinfo/studentinfo_list">
			戻る </a>
	</div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />
<%-- modalの読込 --%>
<jsp:include page="/ModalCompletion/support_levelup_modal.jsp"
	flush="true" />
<jsp:include page="/ModalCompletion/support_leveldown_modal.jsp"
	flush="true" />