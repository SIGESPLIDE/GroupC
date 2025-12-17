<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割一覧" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

        <div class="text-center mb-4">
            <h2 class="mb-0">時間割一覧</h2>
            <hr class="mt-2">
        </div>

<%-- メイン --%>
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

		<div class="position-absolute bottom-0 start-0">
			<button onclick="location.href='${pageContext.request.contextPath}#'" class="btn btn-secondary m-5">戻る</button>
		</div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />