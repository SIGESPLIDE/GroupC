<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="交流詳細" /></jsp:include>

<style>
    /* メインエリア */
    .content-area {
        padding-bottom: 80px !important;
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
            <h2 class="mb-0">交流詳細</h2>
        </div>

        <hr class="mt-0 flex-shrink-0">

        <%-- テーブル --%>
		<div class="container w-50">
		    <table class="table table-bordered text-center border-secondary">
				<thead>
				    <tr>
				      <th scope="col" class="w-18">日付</th>
				      <th scope="col" class="w-18">生徒気分</th>
				      <th scope="col" class="w-18">ユニボ気分</th>
				      <th scope="col" style="width: 1%;"></th>
				    </tr>
				</thead>

			  	<tbody>
				    <tr>
				      <td>12/1</td>
				      <td class="fs-3">&#128516;</td>
				      <td class="fs-3">&#128516;</td>
				      <td><button onclick="location.href='${pageContext.request.contextPath}/studentsupport/communicate_detail'" type="button" class="btn btn-primary text-nowrap">詳細</button></td>
				    </tr>
				    <tr>
				      <td>12/2</td>
				      <td class="fs-3">&#128516;</td>
				      <td class="fs-3">&#128532;</td>
				      <td><button type="button" class="btn btn-primary text-nowrap">詳細</button></td>
				    </tr>
		  		</tbody>
			</table>
		</div>

		<div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-5">

	        <%-- 戻るボタン --%>
	        <a class="btn btn-secondary shadow-sm"
	           style="width: 7rem;"
	           href="${pageContext.request.contextPath}/studentinfo/studentinfo_list">
	           戻る
	        </a>

		 </div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />