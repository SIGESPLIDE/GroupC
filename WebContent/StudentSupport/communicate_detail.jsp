<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="会話詳細" /></jsp:include>

<style>
    /* メインエリア */
    .scroll-content {
        padding-bottom: 100px !important;
    }
</style>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メイン --%>
<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

    <div class="container mt-5 flex-grow-1 overflow-y-auto">

        <div class="text-center mb-4 flex-shrink-0">
            <h2 class="mb-0">会話詳細</h2>
        </div>

        <hr class="mt-0 flex-shrink-0">

        <%-- 会話欄 --%>
		<div class="container w-50 h-50">
        	<textarea class="w-100 h-100" readonly><c:forEach var="chatLog" items="${chatLogList}">【${chatLog.formattedDatetime}】&NewLine;${chatLog.chatLog}&NewLine;</c:forEach></textarea>
		</div>

		<div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white" style="z-index: 1000;">

	        <%-- 戻るボタン --%>
	        <a class="btn btn-secondary shadow-sm"
	           style="width: 7rem;"
	           href="${pageContext.request.contextPath}/studentsupport/activity_detail">
	           戻る
	        </a>

		</div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />