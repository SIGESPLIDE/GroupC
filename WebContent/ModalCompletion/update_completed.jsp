<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String from = request.getParameter("from");
	String studentId = request.getParameter("studentId");

	String backUrl = request.getContextPath() + "/loginlogout/mainmenu";

	if ("support".equals(from)) {
		// 支援段階の画面へ ID 付きで戻る
		backUrl = request.getContextPath() + "/studentsupport/support_level?studentId=" + studentId;
	} else if ("teacher".equals(from)) {
		backUrl = request.getContextPath() + "/password/teacher_password";
	} else if ("admin".equals(from)) {
		backUrl = request.getContextPath() + "/password/administrator_password";
	} else if ("student".equals(from)) {
		backUrl = request.getContextPath() + "/studentinfo/studentinfo_list";
	} else if ("time".equals(from)) {
		backUrl = request.getContextPath() + "/timetable/timetable_list";
	}
%>

<%-- headerの読込） --%>
<jsp:include page="../header.jsp"><jsp:param name="title"
		value="変更完了" /></jsp:include>

<div class="col-md-2 sidebar-bg">
	<%-- sidebarの読込 --%>
	<jsp:include page="../sidebar.jsp" flush="true" />
</div>

<div class="col-md-10 content-area d-flex flex-column h-100">
	<div class="container mt-5 flex-grow-1 d-flex flex-column">
		<div class="text-center mb-4">
			<h2 class="mb-0">変更完了画面</h2>
			<hr class="mt-2">
		</div>

		<div
			class="d-flex flex-column justify-content-between flex-grow-1 pb-5">
			<div class="text-start">
				<h3 class="ms-3">変更が完了しました</h3>
			</div>

			<div class="text-start">
				<button type="button" class="btn btn-secondary mt-4 ms-3"
					style="width: 7rem;" onclick="location.href='<%=backUrl%>'">
					戻る</button>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../footer.jsp" />