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

<%-- 情報欄 --%>
		<div class="container form-group form-control form-control-lg d-flex flex-column w-50">
			<label>生徒ID</label><div class="text-center border bg-light rounded-start rounded-end">AAA</div>
			<label>年・組</label><div class="text-center border bg-light rounded-start rounded-end">AAA</div>
			<label>名前</label><div class="text-center border bg-light rounded-start rounded-end">AAA</div>
    		<div class="mb-3">
  				<label for="fileInput" class="form-label">QR</label>
  				<input class="form-control border-secondary" type="file" id="fileInput">
			</div>
		</div>


		<div onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_list'" class="position-absolute bottom-0 start-0"><button class="btn btn-secondary m-5">戻る</button></div>
		<div onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_change'" class="position-absolute bottom-0 end-0"><button class="btn btn-primary m-5">変更</button></div>

</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />