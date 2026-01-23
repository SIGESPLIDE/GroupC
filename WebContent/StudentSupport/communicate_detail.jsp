<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

        <%-- メイン --%>
		<div class="container w-100 h-75">
			<%-- 会話ボックス --%>
        	<div class="w-auto h-75 border border-1 border-secondary rounded p-3" style="overflow-y: scroll;">
        		<c:forEach var="chatLog" items="${chatLogList}">
        			<%-- それぞれのふきだし --%>
	        		<div class="m-2">
	        			<c:choose>
	        				<%-- 生徒のふきだし --%>
		        			<c:when test="${chatLog.speaker==1}">
	        						<div class="text-end"><p class="mb-0">${chatLog.formattedDatetime}</p></div>
			        				<div class="w-100 d-flex justify-content-end">
				        				<p class="m-2 mt-0 p-2 rounded bg-primary-subtle d-inline-block" style="max-width: 70%;">生徒:<c:out value="${chatLog.chatLog}" escapeXml="false" /></p>
			        				</div>
		        			</c:when>
		        			<%-- ユニボのふきだし --%>
		        			<c:otherwise>
		        					<div><p class="mb-0">${chatLog.formattedDatetime}</p></div>
				        			<div class="w-100">
				        				<p class="m-2 mt-0 p-2 rounded bg-secondary-subtle d-inline-block" style="max-width: 70%;">ユニボ:<c:out value="${chatLog.chatLog}" escapeXml="false" /></p>
				        			</div>
		        			</c:otherwise>
	        			</c:choose>
	        		</div>
        		</c:forEach>
			</div>
		</div>

		<div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white" style="z-index: 1000;">

	        <%-- 戻るボタン --%>
	        <form action="${pageContext.request.contextPath}/studentsupport/activity_detail" method="post">
	        	<input type="hidden" name="studentId" value="${chatLogList.get(0).studentId}">
		        <button type="submit"
		            class="btn btn-secondary shadow-sm"
		            style="width: 7rem;">
		        	戻る
		    	</button>
	        </form>

		</div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />