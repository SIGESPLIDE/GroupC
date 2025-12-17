<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="交流詳細" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

        <div class="text-center mb-4">
            <h2 class="mb-0">交流詳細</h2>
            <hr class="mt-2">
        </div>

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

		<div onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_list'" class="position-absolute bottom-0 start-0"><button class="btn btn-secondary m-5">戻る</button></div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />