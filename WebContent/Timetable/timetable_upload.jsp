<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割読み込み" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100">

        <div class="text-center mb-4">
            <h2 class="mb-0">時間割読み込み</h2>
            <hr class="mt-2">
        </div>

		<p class="fs-2">
		  時間割を登録します。<br>
		  時間割の写真をアップロードしてください。
		</p>

		<div>
		  <input type="file" class="form-control form-control-lg">
		</div>


		<div class="d-flex justify-content-between mt-auto">
			<div>
	        	<button type="button" class="btn btn-secondary">戻る</button>
			</div>

			<div>
	        	<button type="button" class="btn btn-primary">次へ</button>
			</div>
		</div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />