<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="支援段階" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 text-center content-area d-flex flex-column h-100 position-relative">

        <div class="text-center mb-4">
            <h2 class="mb-0">支援段階</h2>
            <hr class="mt-2">
        </div>

<%-- メイン --%>
	<div class="container w-75">
		<div class="rounded-start rounded-end bg-secondary text-white mb-3 p-4">現在の段階</div>

		<div class="d-flex h-75">
<%-- テーブル --%>
			<div class="w-50 me-3"><table class="table table-bordered text-center border-secondary w-100 h-100">
			  	<tbody>
				    <tr><td>学生滞在時間</td></tr>
				    <tr><td>教室滞在時間</td></tr>
				    <tr><td>登校日数</td></tr>
		  		</tbody>
			</table></div>

			<div class="rounded-start rounded-end bg-primary text-white p-5 w-50">スケジュール</div>

		</div>
	</div>

		 <div onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_list'" class="position-absolute bottom-0 start-0"><button class="btn btn-secondary m-5">戻る</button></div>
</div>
<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />