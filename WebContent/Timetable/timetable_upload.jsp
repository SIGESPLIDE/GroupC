<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割読み込み" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

        <div class="text-center mb-4">
            <h2 class="mb-0">時間割読み込み</h2>
            <hr class="mt-2">
        </div>

<%-- メイン --%>
	<div class="container w-75">
		<p class="fs-2">
		  時間割を登録します。<br>
		  時間割の写真をアップロードしてください。
		</p>
		<form action="${pageContext.request.contextPath}/timetable/timetable_regist" method="POST" class="d-flex flex-column h-100">
		<div><input type="file" class="form-control form-control-lg"></div>


		</form>
	</div>
		<div class="position-absolute bottom-0 start-0"><button onclick="location.href='${pageContext.request.contextPath}/timetable/timetable_list'" type="button" class="btn btn-secondary m-5">戻る</button></div>
		<div class="position-absolute bottom-0 end-0"><button onclick="location.href='${pageContext.request.contextPath}/timetable/timetable_regist'" type="button" class="btn btn-primary m-5">次へ</button></div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />