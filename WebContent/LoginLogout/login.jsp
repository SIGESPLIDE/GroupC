<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">

<%-- head --%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ユニパス連携システム - ログイン</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/custom.css" rel="stylesheet">
</head>

<%-- メイン --%>
<body>

    <div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
        <div class="card shadow-lg login-card-width">
            <div class="card-header text-center custom-header-blue fw-bold">
                ユニパス連携システム
            </div>

            <div class="card-body p-4">
                <h3 class="text-center mt-3 mb-4">ログイン</h3>

                <%-- エラーメッセージ表示エリア --%>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger text-center py-2" role="alert" style="font-size: 0.9rem;">
                        ${error}
                    </div>
                </c:if>

				<%-- パスワード入力 --%>
                <form action="${pageContext.request.contextPath}/loginlogout/loginexecute" method="post">
                    <div class="input-container mb-4">
                        <input type="password"
                               name="password"
                               class="form-control"
                               placeholder="パスワードを入力"
                               required>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn custom-login-button">
                            ログイン
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>