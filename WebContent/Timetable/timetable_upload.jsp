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
		<form action="/timetable/timetable_regist" method="POST">
		<div><input type="file" class="form-control form-control-lg"></div>


		<div class="d-flex justify-content-between mt-auto">
			<div>
	        	<button onclick="location.href='${pageContext.request.contextPath}/timetable/timetable_list'" type="button" class="btn btn-secondary">戻る</button>
			</div>
			<div><input type="submit" class="btn btn-primary" value="次へ"></div>
		</div>
		</form>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />