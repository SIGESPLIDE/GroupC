<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割一覧" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100">

        <div class="text-center mb-4">
            <h2 class="mb-0">時間割一覧</h2>
            <hr class="mt-2">
        </div>

		<div class="d-flex justify-content-end mb-3">
        	<button onclick="location.href='${pageContext.request.contextPath}/timetable/timetable_upload'" type="button" class="btn btn-primary">新規登録</button>
		</div>

<%-- テーブル --%>
	    <table class="table table-bordered text-center border-secondary">
			<thead>
			    <tr>
			      <th scope="col" style="width: 90%;">クラス</th>
			      <th scope="col" style="width: 10%; white-space: nowrap;"></th>
			    </tr>
			</thead>

		  	<tbody>
			    <tr>
			      <td class="">1年1組</td>
			      <td><button onclick="location.href='${pageContext.request.contextPath}/timetable/timetable_detail'" type="button" class="btn btn-primary">詳細</button></td>
			    </tr>
			    <tr>
			      <td>2年1組</td>
			      <td><button type="button" class="btn btn-primary">詳細</button></td>
			    </tr>
			    <tr>
			      <td>3年1組</td>
			      <td><button type="button" class="btn btn-primary">詳細</button></td>
			    </tr>
	  		</tbody>
		</table>

		<div class="d-flex justify-content-start mt-auto">
        	<button onclick="location.href='${pageContext.request.contextPath}/loginlogout/mainmenu" type="button" class="btn btn-secondary">戻る</button>
		</div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />