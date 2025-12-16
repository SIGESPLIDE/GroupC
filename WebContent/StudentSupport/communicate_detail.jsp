<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="会話詳細" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>


<div class="col-md-10 content-area d-flex flex-column h-100">

        <div class="text-center mb-4">
            <h2 class="mb-0">会話詳細</h2>
            <hr class="mt-2">
        </div>

        <textarea rows="50" cols=""></textarea>

		<div class="d-flex justify-content-start mt-auto">
        	<button onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_list'" type="button" class="btn btn-secondary">戻る</button>
		</div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />