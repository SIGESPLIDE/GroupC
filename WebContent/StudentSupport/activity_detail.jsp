<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="交流詳細" /></jsp:include>

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
            <h2 class="mb-0">交流詳細</h2>
        </div>

        <hr class="mt-0 flex-shrink-0">

        <%-- テーブル --%>
		<div class="container w-50">
		    <table class="table table-bordered text-center border-secondary">
				<thead>
				    <tr>
				      <th scope="col" class="w-18">日付</th>
				      <th scope="col" class="w-18">生徒気分</th>
				      <th scope="col" class="w-18">ユニボ気分</th>
				      <th scope="col" style="width: 1%;"></th>
				    </tr>
				</thead>

			  	<tbody>
			  		<c:set var="lastDate" value="" />
			      	<c:forEach var="acLog" items="${acLogList}">
					<c:if test="${acLog.formattedDate != lastDate}">
					    <tr>
					      <td>
                				${acLog.formattedDate}
					      </td>
					      <td class="fs-3">
					      	${acLog.emotionLog}
					      </td>
					      <td class="fs-3">&#128516;</td>
					      <td>
						  <form action="${pageContext.request.contextPath}/studentsupport/communicate_detail" method="post">
					      	<input type="hidden" name="studentId" value="${acLog.studentId}">
					      	<input type="hidden" name="datetime" value="${acLog.datetime}">
					      	<button type="submit" class="btn btn-primary text-nowrap">詳細</button>
						  </form>
					      </td>
					    </tr>
         				</c:if>
			      	<c:set var="lastDate" value="${acLog.formattedDate}" />
			      	</c:forEach>
				    <tr>
				      <td>12/2</td>
				      <td class="fs-3">&#128516;</td>
				      <td class="fs-3">&#128532;</td>
				      <td><button type="button" class="btn btn-primary text-nowrap">詳細</button></td>
				    </tr>
		  		</tbody>
			</table>
		</div>

		<div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white" style="z-index: 1000;">

	        <%-- 戻るボタン --%>
	        <a class="btn btn-secondary shadow-sm"
	           style="width: 7rem;"
	           href="${pageContext.request.contextPath}/studentinfo/studentinfo_list">
	           戻る
	        </a>

		 </div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />