<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割詳細" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メイン --%>
<div class="col-md-10 content-area d-flex flex-column h-100 position-relative">

    <div class="container mt-5 flex-grow-1 overflow-y-auto">

        <div class="text-center mb-4 flex-shrink-0">
            <h2 class="mb-0">【<c:out value="${className}" />】の時間割</h2>
        </div>

        <hr class="mt-0 mb-5 flex-shrink-0">

        <div class="container w-75">
            <c:choose>
                <%-- 時間割が存在する場合 --%>
                <c:when test="${not empty timetableList}">
                    <table class="table table-bordered table-hover text-center border-secondary shadow-sm">
                        <thead class="table-light">
                            <tr class="table-secondary">
                                <th scope="col" style="width: 10%;"></th>
                                <th scope="col">月</th>
                                <th scope="col">火</th>
                                <th scope="col">水</th>
                                <th scope="col">木</th>
                                <th scope="col">金</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="period" begin="1" end="6">
                                <tr>
                                    <th scope="row" class="table-secondary align-middle">${period}</th>
                                    <c:forEach var="weekday" items="${weekdayList}">
                                        <td class="align-middle">
                                            <c:out value="${timetableMap[weekday][period]}" default="-" />
                                        </td>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>

                <%-- 時間割が存在しない場合 --%>
                <c:otherwise>
                    <div class="alert alert-info text-center py-5 shadow-sm" role="alert">
                        <h4 class="alert-heading">時間割がありません</h4>
                        <p>【<c:out value="${className}" />】の時間割はまだ登録されていません。<br>下の登録ボタンから登録してください。</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <%-- ボタン --%>
        <div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white" style="z-index: 1000;">

            <a class="btn btn-secondary shadow-sm"
               style="width: 7rem;"
               href="${pageContext.request.contextPath}/timetable/timetable_list">
                戻る
            </a>

            <c:choose>
                <c:when test="${not empty timetableList}">
                    <%-- データあり：変更ボタン --%>
                    <a class="btn btn-primary shadow-sm"
                       style="width: 7rem;"
                       href="${pageContext.request.contextPath}/timetable/timetable_change?class_name=${className}">
                        変更
                    </a>
                </c:when>
                <c:otherwise>
                    <%-- データなし：登録ボタン --%>
                    <a class="btn btn-primary shadow-sm"
                       style="width: 7rem;"
                       href="${pageContext.request.contextPath}/timetable/timetable_regist?class_name=${className}">
                        登録
                    </a>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />