<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割変更" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100">

        <div class="text-center mb-4">
            <h2 class="mb-0">時間割変更</h2>
            <hr class="mt-2">
        </div>


<%-- テーブル --%>
	    <table class="table table-bordered text-center table-hover w-auto">
			<thead>
			    <tr class="table-secondary">
			      <th scope="col" class="w-10">＃</th>
			      <th scope="col" class="w-18">月</th>
			      <th scope="col" class="w-18">火</th>
			      <th scope="col" class="w-18">水</th>
			      <th scope="col" class="w-18">木</th>
			      <th scope="col" class="w-18">金</th>
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
			<div>
	        	<button type="button" class="btn btn-secondary">戻る</button>
			</div>

			<div>
	        	<button type="button" class="btn btn-primary">変更</button>
			</div>
		</div>

</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />