<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="支援段階" /></jsp:include>

<style>
.scroll-content { padding-bottom: 100px !important; }
</style>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
	<jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メイン --%>
<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">
	<div class="container mt-5 flex-grow-1 overflow-y-auto">
		<div class="text-center mb-4 flex-shrink-0">
			<h2 class="mb-0">支援段階</h2>
		</div>
		<hr class="mt-0 flex-shrink-0">

		<div class="container w-75">
			<div class="rounded-start rounded-end bg-secondary text-white mb-3 p-4 d-flex align-items-center justify-content-between">
			    <h4 class="mb-0">現在の段階 : ${supLev.supportLevel}</h4>

			    <div class="d-flex gap-3">
			        <%-- 支援段階が1より大きい場合のみ「下げる」ボタンを表示 --%>
			        <c:if test="${supLev.supportLevel > 1}">
			            <form action="${pageContext.request.contextPath}/studentsupport/support_level_update" method="post">
			                <input type="hidden" name="studentId" value="${supLev.studentId}">
			                <input type="hidden" name="updateValue" value="-1">
			                <button type="button" class="btn btn-warning shadow-sm" style="width: 10rem;"
			                    data-bs-toggle="modal" data-bs-target="#supportdownConfirmModal">
			                    支援段階を下げる
			                </button>
			            </form>
			        </c:if>

			        <%-- 支援段階を上げるフォーム --%>
			        <form action="${pageContext.request.contextPath}/studentsupport/support_level_update" method="post">
			            <input type="hidden" name="studentId" value="${supLev.studentId}">
			            <input type="hidden" name="updateValue" value="1">
			            <button type="button" class="btn btn-primary shadow-sm" style="width: 10rem;"
			                id="preLe" data-bs-toggle="modal" data-bs-target="#supportupConfirmModal">
			                支援段階を上げる
			            </button>
			        </form>
			    </div>
			</div>

			<c:choose>
				<c:when test="${empty attReco}">
					<div class="text-center text-primary"><h4>まだ情報が記録されていません</h4></div>
				</c:when>
				<c:otherwise>
					<div class="d-flex h-75">
						<table class="table table-striped text-center border-secondary w-100 h-100">
							<tbody>
								<tr><td><h4>連続登校日数:${attReco.sequentialDays}</h4></td></tr>
								<tr><td><h4>学校滞在時間:${attReco.schoolTime}</h4></td></tr>
								<tr><td><h4>教室滞在時間:${attReco.classTime}</h4></td></tr>
								<tr><td><h4>合計登校日数:${attReco.totalDays}</h4></td></tr>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white border-top pt-3" style="z-index: 1000;">
			<a class="btn btn-secondary shadow-sm" style="width: 7rem;"
				href="${pageContext.request.contextPath}/studentinfo/studentinfo_list"> 戻る </a>
		</div>
	</div>
</div>

<jsp:include page="../footer.jsp" />

<%-- モーダル読込 (ファイル名間違い注意) --%>
<jsp:include page="/ModalCompletion/support_levelup_modal.jsp" flush="true" />
<jsp:include page="/ModalCompletion/support_leveldown_modal.jsp" flush="true" />