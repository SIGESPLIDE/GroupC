<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="時間割登録" /></jsp:include>

<style>
    .scroll-content { padding-bottom: 100px !important; }
    /* 入力欄 */
    .table input[type="text"] {
        border: 1px solid #ced4da;
        border-radius: 4px;
        padding: 4px;
    }
</style>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メイン --%>
<form action="${pageContext.request.contextPath}/timetable/timetable_regist" method="post" class="col-md-10">
    <div class="content-area d-flex flex-column h-100 position-relative">

        <%-- クラス名の保持（URLパラメータから取得） --%>
        <input type="hidden" name="class_name" value="${param.class_name}">

        <div class="container mt-5 flex-grow-1 overflow-y-auto">
            <div class="text-center mb-4 flex-shrink-0">
                <h2 class="mb-0">【<c:out value="${param.class_name}" />】の時間割登録</h2>
            </div>
            <hr class="mt-0 flex-shrink-0">

            <div class="container w-75">
                <table class="table table-bordered table-hover text-center shadow-sm">
                    <thead>
                        <tr class="table-secondary border-dark">
                            <th scope="col" style="width: 10%;"></th>
                            <th scope="col" style="width: 18%;">月</th>
                            <th scope="col" style="width: 18%;">火</th>
                            <th scope="col" style="width: 18%;">水</th>
                            <th scope="col" style="width: 18%;">木</th>
                            <th scope="col" style="width: 18%;">金</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- 1時限〜6時限をループ --%>
                        <c:forEach var="period" begin="1" end="6">
                            <tr>
                                <th scope="row" class="table-secondary border-dark align-middle">${period}</th>
                                <%-- 月曜(1)〜金曜(5)をループ --%>
                                <c:forEach var="day" begin="1" end="5">
                                    <c:set var="weekdayName" value="${day==1 ? '月曜日' : day==2 ? '火曜日' : day==3 ? '水曜日' : day==4 ? '木曜日' : '金曜日'}" />
                                    <td class="border-dark align-middle">
                                        <%-- name属性を subject_月曜日_1 のようにして一意にする --%>
                                        <input type="text"
                                               name="subject_${weekdayName}_${period}"
                                               class="form-control form-control-sm mx-auto"
                                               style="width: 90%;"
                                               placeholder="-">
                                    </td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <%-- ボタンエリア --%>
        <div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white" style="z-index: 1000;">
            <a class="btn btn-secondary shadow-sm" style="width: 7rem;"
               href="${pageContext.request.contextPath}/timetable/timetable_detail?class_name=${param.class_name}">
                戻る
            </a>
            <button type="button" class="btn btn-primary shadow-sm" style="width: 7rem;"
                    data-bs-toggle="modal" data-bs-target="#registerConfirmModal">
                登録
            </button>
        </div>
    </div>
</form>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />

<%-- modalの読込 --%>
<jsp:include page="/ModalCompletion/register_modal.jsp" flush="true" />