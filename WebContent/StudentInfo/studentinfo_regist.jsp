<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="生徒情報登録" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100">

        <div class="text-center mb-4">
            <h2 class="mb-0">生徒情報登録</h2>
            <hr class="mt-2">
        </div>

<%-- 入力欄 --%>
		<div class="form-group form-control form-control-lg d-flex flex-column w-50 mx-auto">
			<label>生徒ID</label><input type="text" placeholder="生徒ID">
			<label>年・組</label><input type="text" placeholder="年・組">
			<label>名前</label><input type="text" placeholder="名前">
    		<div class="mb-3">
  				<label for="fileInput" class="form-label">QR</label>
  				<input class="form-control border-secondary" type="file" id="fileInput">
			</div>
		</div>

		<div class="d-flex justify-content-between mt-auto">
			<div><button onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_list'" type="button" class="btn btn-secondary">戻る</button></div>
			<div><button type="button" class="btn btn-primary">登録</button></div>
		</div>

</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />