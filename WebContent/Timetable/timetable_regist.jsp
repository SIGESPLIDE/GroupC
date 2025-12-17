<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割登録" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

        <div class="text-center mb-4">
            <h2 class="mb-0">時間割登録</h2>
            <hr class="mt-2">
        </div>

<%-- メイン --%>
	<div class="container w-75">
<%-- テーブル --%>
	    <table class="table table-bordered table-hover text-center">
			<thead>
			    <tr class="table-secondary">
			      <th scope="col"></th>
			      <th scope="col">月</th>
			      <th scope="col">火</th>
			      <th scope="col">水</th>
			      <th scope="col">木</th>
			      <th scope="col">金</th>
			    </tr>
			</thead>

		  	<tbody>
			    <tr>
			      <th scope="row" class="table-secondary">1</th>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto" >
				      </td>
			    </tr>

			    <tr>
			      <th scope="row" class="table-secondary">2</th>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto" >
				      </td>
				</tr>

			    <tr>
			      <th scope="row" class="table-secondary">3</th>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto" >
				      </td>
				</tr>

			    <tr>
			      <th scope="row" class="table-secondary">4</th>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto" >
				      </td>
			    </tr>

			    <tr>
			      <th scope="row" class="table-secondary">5</th>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto" >
				      </td>
			    </tr>

			    <tr>
			      <th scope="row" class="table-secondary">6</th>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto">
				      </td>
				      <td>
				        <input type="text" class="w-75 mx-auto" >
				      </td>
			    </tr>

	  		</tbody>
		</table>
<%-- ボタン --%>
		<div class="position-absolute bottom-0 start-0"><button onclick="location.href='${pageContext.request.contextPath}/timetable/timetable_upload'" class="btn btn-secondary m-5">戻る</button></div>
		<div class="position-absolute bottom-0 end-0"><button class="btn btn-primary m-5" data-bs-toggle="modal" data-bs-target="#registerConfirmModal">登録</button></div>
	</div>

</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />

<%-- 登録完了専用モーダルの読込 --%>
<jsp:include page="/ModalCompletion/register_modal.jsp" flush="true" />