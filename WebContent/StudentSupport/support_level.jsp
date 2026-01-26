<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title"
		value="支援段階" /></jsp:include>

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

<%-- メイン --%>
<div
	class="col-md-10 content-area d-flex flex-column h-100 position-relative">

	<div class="container mt-5 flex-grow-1 overflow-y-auto">

		<div class="text-center mb-4 flex-shrink-0">
			<h2 class="mb-0">支援段階</h2>
		</div>

		<hr class="mt-0 flex-shrink-0">


		<div class="container w-75">
			<div
				class="rounded-start rounded-end bg-secondary text-white mb-3 p-4">現在の段階:${supLev.supportLevel}</div>


			<c:choose>
				<c:when test="${empty attReco}">
					<div class="text-center text-primary">まだ情報が記録されていません</div>
				</c:when>
				<c:otherwise>
					<div class="d-flex h-75">
						<%-- テーブル --%>
						<table
							class="table table-bordered text-center border-secondary w-100 h-100">
							<tbody>
								<tr>
									<td>連続登校日数:${attReco.sequentialDays}</td>
								</tr>
								<tr>
									<td>学校滞在時間:${attReco.schoolTime}</td>
								</tr>
								<tr>
									<td>教室滞在時間:${attReco.classTime}</td>
								</tr>
								<tr>
									<td>合計登校日数:${attReco.totalDays}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div
			class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white"
			style="z-index: 1000;">

			<%-- 戻るボタン --%>
			<a class="btn btn-secondary shadow-sm" style="width: 7rem;"
				href="${pageContext.request.contextPath}/studentinfo/studentinfo_list">
				戻る </a>

			<button type="button"
	            class="btn btn-primary shadow-sm"
	            style="width: 7rem;"
	            id="preRegisterCheck">
		        登録
		    </button>
		</div>
	</div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />

<%-- 登録完了専用モーダルの読込 --%>
<jsp:include page="/ModalCompletion/register_modal.jsp" flush="true" />