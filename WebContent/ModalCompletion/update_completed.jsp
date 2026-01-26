<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // URLの ?from=xxx を受け取る
    String from = request.getParameter("from");
    String backUrl = request.getContextPath() + "/loginlogout/mainmenu"; // デフォルトの戻り先

    // ここに、戻る為に必要なルートを設定
    // 各コントローラ―の画面遷移の最後に書かれている?from=の先で、""の中身が一致していれば〇
    if ("teacher".equals(from)) {
        backUrl = request.getContextPath() + "/password/teacher_password";
    } else if ("admin".equals(from)) {
        backUrl = request.getContextPath() + "/password/administrator_password";
    } else if ("student".equals(from)){
    	backUrl = request.getContextPath() + "/studentinfo/studentinfo_list";
    } else if ("time".equals(from)){
    	backUrl = request.getContextPath() + "/timetable/timetable_list";
    } else if ("support".equals(from)){
    	backUrl = request.getContextPath() + "/studentsupport/support_level";
    }
%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="変更完了" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- メイン --%>
<div class="col-md-10 content-area d-flex flex-column h-100">
    <div class="container mt-5 flex-grow-1 d-flex flex-column">
        <div class="text-center mb-4">
            <h2 class="mb-0">変更完了画面</h2>
            <hr class="mt-2">
        </div>

        <div class="d-flex flex-column justify-content-between flex-grow-1 pb-5">
            <div class="text-start">
                <h3 class="ms-3">変更が完了しました</h3>
            </div>

            <div class="text-start">
                <%-- onclickの中で Javaで決めた変数 backUrl を使う --%>
                <button
                    type="button"
                    class="btn btn-secondary mt-4 ms-3"
                    style="width: 7rem;"
                    onclick="location.href='<%= backUrl %>'">
                    戻る
                </button>
            </div>
        </div>
    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />