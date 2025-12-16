<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="生徒情報詳細" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

        <div class="text-center mb-4">
            <h2 class="mb-0">生徒情報詳細</h2>
            <hr class="mt-2">
        </div>

<%-- 入力欄 --%>
		<div class="container w-50 h-50">
<%-- テーブル --%>
			<table class="table table-bordered border border-dark w-100 h-100">
<%-- <thead style="display: none;"> --%>
 			<thead >
				<tr><th class=""></th><th class=""></th><th class="w-75"></th></tr>
			</thead>
			<tbody>
				<tr><td class="">生徒ID</td><td>：</td><td>AAA</td></tr>
				<tr><td>年・組</td><td>：</td><td>AAA</td></tr>
				<tr><td>名前</td><td>：</td><td>AAA</td></tr>
				<tr><td>QR</td><td>：</td><td><img src="" alt="QRコードの画像"></td></tr>
			</tbody>
			</table>
		</div>

		<div onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_list'" class="position-absolute bottom-0 start-0"><button class="btn btn-secondary m-5">戻る</button></div>
		<div onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_change'" class="position-absolute bottom-0 end-0"><button class="btn btn-primary m-5">変更</button></div>

</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />