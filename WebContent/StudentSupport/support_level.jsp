<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="支援段階" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100">

        <div class="text-center mb-4">
            <h2 class="mb-0">支援段階</h2>
            <hr class="mt-2">
        </div>

		<div class="d-flex justify-content-center">
<%-- テーブル --%>
		    <table class="table table-bordered text-center border-secondary w-25">
			  	<tbody>
				    <tr>
				      <td>学生滞在時間</td>
				    </tr>
				    <tr>
				      <td>教室滞在時間</td>
				    </tr>
				    <tr>
				      <td>登校日数</td>
				    </tr>
		  		</tbody>
			</table>

			<textarea rows="" cols="" class="w-25"></textarea>
		</div>

		<div class="d-flex justify-content-start mt-3">
        	<button type="button" class="btn btn-secondary">戻る</button>
		</div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />