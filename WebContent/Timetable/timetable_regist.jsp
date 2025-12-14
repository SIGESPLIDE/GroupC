<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割登録" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100">

        <div class="text-center mb-4">
            <h2 class="mb-0">時間割登録</h2>
            <hr class="mt-2">
        </div>


<%-- テーブル --%>
		<form action"" method="POST">
	    <table class="table table-bordered table-hover text-center">
			<thead>
			    <tr class="table-secondary">
			      <th scope="col">＃</th>
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
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			    </tr>

			    <tr>
			      <th scope="row" class="table-secondary">2</th>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>

			    </tr>

			    <tr>
			      <th scope="row" class="table-secondary">3</th>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			    </tr>

			    <tr>
			      <th scope="row" class="table-secondary">4</th>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			    </tr>

			    <tr>
			      <th scope="row" class="table-secondary">5</th>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			    </tr>

			    <tr>
			      <th scope="row" class="table-secondary">6</th>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			      <td>
			        <input type="text">
			      </td>
			    </tr>
	  		</tbody>
		</table>

		<div class="d-flex justify-content-between mt-auto">
			<div><button onclick="location.href='${pageContext.request.contextPath}/timetable/timetable_list'" type="button" class="btn btn-secondary">戻る</button></div>
			<div><input type="submit" class="btn btn-primary" value="登録"></div>
		</div>
		</form>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />