<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title"
		value="交流詳細" /></jsp:include>

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
			<h2 class="mb-0">交流詳細</h2>
		</div>

		<hr class="mt-0 flex-shrink-0">

		<%-- まだ交流詳細が存在していなかった場合 --%>
		<c:choose>
			<c:when test="${emptyError!=null}">
				<div class="alert alert-info text-center py-5 shadow-sm"
					role="alert">
					<h4 class="alert-heading">${emptyError}</h4>
					<p>生徒がユニボと交流したら表示されます</p>
				</div>
			</c:when>
			<c:otherwise>
				<%-- テーブル --%>
				<div class="container w-75 h-75">
					<table class="table border-secondary table-hover text-center mb-0">
						<thead class="table-dark sticky-top">
							<tr>
								<th scope="col" class="w-18">日付</th>
								<th scope="col" class="w-18">生徒気分</th>
								<th scope="col" class="w-18">会話詳細</th>
							</tr>
						</thead>

						<tbody>
							<c:set var="lastDate" value="" />
							<c:forEach var="acLog" items="${acLogList}">
								<c:if test="${acLog.formattedDate != lastDate}">
									<tr>
										<td>${acLog.formattedDate}</td>
										<td class="fs-3"><c:choose>
												<c:when test="${acLog.emotionLog==0}">
					      			&#x1f622;
					      		</c:when>
												<c:when test="${acLog.emotionLog==1}">
					      			&#x1f610;
					      		</c:when>
												<c:otherwise>
					      			&#x1f60a;
					      		</c:otherwise>
											</c:choose></td>
										<td>
											<form
												action="${pageContext.request.contextPath}/studentsupport/communicate_detail"
												method="post">
												<input type="hidden" name="studentId"
													value="${acLog.studentId}"> <input type="hidden"
													name="datetime" value="${acLog.datetime}">
												<button type="submit" class="btn btn-primary text-nowrap">詳細</button>
											</form>
										</td>
									</tr>
								</c:if>
								<c:set var="lastDate" value="${acLog.formattedDate}" />
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:otherwise>
		</c:choose>

		<div
			class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white border-top pt-3"
	style="z-index: 1000;">

			<%-- 戻るボタン --%>
			<a class="btn btn-secondary shadow-sm" style="width: 7rem;"
				href="${pageContext.request.contextPath}/studentinfo/studentinfo_list">
				戻る </a>

		</div>

	</div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />