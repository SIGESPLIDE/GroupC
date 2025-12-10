<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="登録完了" /></jsp:include>

<%-- sidebarの読込 --%>
<div class="col-md-2 sidebar-bg">
    <jsp:include page="../sidebar.jsp" flush="true" />
</div>

<%-- 3. メイン --%>
<div class="col-md-10 content-area d-flex flex-column h-100">

    <div class="container mt-5 flex-grow-1 d-flex flex-column">

        <div class="text-center mb-4">
            <h2 class="mb-0">登録完了画面</h2>
            <hr class="mt-2">
        </div>

        <div class="d-flex flex-column justify-content-between flex-grow-1 pb-5">

            <div class="text-start">
                <h3 class="ms-3">登録が完了しました</h3>
            </div>

            <div class="text-start">
                <button
                    type="button"
                    class="btn btn-secondary mt-4 ms-3"
                    style="width: 7rem;">
                    戻る
                </button>
            </div>
        </div>

    </div>

</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />