<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割一覧" /></jsp:include>

<%-- スタイル --%>
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
<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

    <div class="container mt-5 flex-grow-1 overflow-y-auto">

        <div class="text-center mb-4 flex-shrink-0">
            <h2 class="mb-0">時間割一覧</h2>
        </div>

        <hr class="mt-0 flex-shrink-0">

		<div class="container w-75">
			<div class=" d-flex justify-content-end mb-3">
	        	<button onclick="location.href='${pageContext.request.contextPath}/timetable/timetable_upload'" type="button" class="btn btn-primary">新規登録</button>
			</div>

			<%-- テーブル --%>
		    <table class="table table-bordered text-center border-secondary">
				<thead>
				    <tr>
				      <th scope="col" class="w-75">クラス</th>
				      <th scope="col" class="w-15" style="white-space: nowrap;"></th>
				    </tr>
				</thead>

			  	<tbody>
				    <tr>
				      <td>1年1組</td>
				      <td><button onclick="location.href='${pageContext.request.contextPath}/timetable/timetable_detail'" class="btn btn-primary w-100">詳細</button></td>
				    </tr>
				    <tr>
				      <td>2年1組</td>
				      <td><button class="btn btn-primary w-100">詳細</button></td>
				    </tr>
				    <tr>
				      <td>3年1組</td>
				      <td><button class="btn btn-primary w-100">詳細</button></td>
				    </tr>
		  		</tbody>
			</table>
		</div>

		<div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white" style="z-index: 1000;">

	        <%-- 戻るボタン --%>
	        <a class="btn btn-secondary shadow-sm"
	           style="width: 7rem;"
	           href="${pageContext.request.contextPath}/loginlogout/mainmenu">
	           戻る
	        </a>

		 </div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />