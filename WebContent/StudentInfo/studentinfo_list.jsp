<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- headerの読込 --%>
<jsp:include page="../header.jsp"><jsp:param name="title" value="生徒情報一覧" /></jsp:include>

<%-- スタイル --%>
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
            <h2 class="mb-0">生徒情報一覧</h2>
        </div>

        <hr class="mt-0 flex-shrink-0">

		<div class="container w-75">
			<div class="d-flex justify-content-between my-3">
				<div class="w-75"><input class="rounded-start rounded-end w-100" type="text" placeholder="生徒IDまたは名前で検索"></div>
				<div><button onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_regist'" type="button" class="btn btn-primary">新規登録</button></div>
			</div>
			<%-- テーブル --%>
		    <table class="table table-bordered text-center border-secondary">
				<thead>
				    <tr>
				      <th scope="col">生徒ID</th>
				      <th scope="col">名前</th>
				      <th scope="col" style="white-space: nowrap;"></th>
				      <th scope="col" style="white-space: nowrap;"></th>
				      <th scope="col" style="white-space: nowrap;"></th>
				      <th scope="col" style="white-space: nowrap;"></th>
				    </tr>
				</thead>

			  	<tbody>
			  	<%-- controllerがDBから持ってきたリストからデータを取り出して、テーブルに入れる --%>

				    <tr>
				      <td>A</td>
				      <td>aaaaaaaaaaa</td>
				      <td><button onclick="location.href='${pageContext.request.contextPath}/studentsupport/activity_detail'" type="button" class="btn btn-primary">交流詳細</button></td>
				      <td><button onclick="location.href='${pageContext.request.contextPath}/studentsupport/support_level'" type="button" class="btn btn-primary">支援段階</button></td>
				      <td><button onclick="location.href='${pageContext.request.contextPath}/studentinfo/studentinfo_detail'" type="button" class="btn btn-primary">生徒詳細</button></td>
				      <td><button type="button" class="btn btn-danger">削除</button></td>
				    </tr>
				    <tr>
				      <td>B</td>
				      <td>bbbbbbbbbbb</td>
				      <td><button type="button" class="btn btn-primary">交流詳細</button></td>
				      <td><button type="button" class="btn btn-primary">支援段階</button></td>
				      <td><button type="button" class="btn btn-primary">生徒詳細</button></td>
				      <td><button type="button" class="btn btn-danger">削除</button></td>
				    </tr>
				    <tr>
				      <td>C</td>
				      <td>ccccccccccc</td>
				      <td><button type="button" class="btn btn-primary">交流詳細</button></td>
				      <td><button type="button" class="btn btn-primary">支援段階</button></td>
				      <td><button type="button" class="btn btn-primary">生徒詳細</button></td>
				      <td><button type="button" class="btn btn-danger">削除</button></td>
				    </tr>
		  		</tbody>
			</table>

	        <%-- 戻るボタン --%>
	        <div class="position-absolute bottom-0 start-0 end-0 d-flex justify-content-between px-5 pb-4 bg-white" style="z-index: 1000;">
		        <a class="btn btn-secondary shadow-sm"
		           style="width: 7rem;"
		           href="${pageContext.request.contextPath}/loginlogout/mainmenu">
		           戻る
		        </a>
		    </div>

		 </div>

    </div>
</div>

<%-- footerの読込 --%>
<jsp:include page="../footer.jsp" />