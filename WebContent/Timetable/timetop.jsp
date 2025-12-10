<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- 3. メイン --%>
<div class="col-md-10 content-area d-flex flex-column h-100">

        <div class="text-center mb-4">
            <h2 class="mb-0">時間割</h2>
            <hr class="mt-2">
        </div>

        	<button type="button" class="btn btn-primary">新規登録</button>

    <table class="table table-bordered text-center">
		<thead>
		    <tr>
		      <th scope="col">クラス</th>
		      <th scope="col">操作</th>
		    </tr>
		</thead>

	  	<tbody>
		    <tr>
		      <td>1-1</td>
		      <td><button type="button" class="btn-primary">詳細</button></td>
		    </tr>
		    <tr>
		      <td>2-1</td>
		      <td><button type="button" class="btn-primary">詳細</button></td>
		    </tr>
		    <tr>
		      <td>3-1</td>
		      <td><button type="button" class="btn-primary">詳細</button></td>
		    </tr>
  		</tbody>
	</table>

</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />