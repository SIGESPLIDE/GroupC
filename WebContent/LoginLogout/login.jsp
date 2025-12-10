<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ユニパス連携システム - ログイン</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        html, body {
            height: 100%;
            background-color: #f7f7f7;
        }
        .custom-header-blue {
            background-color: #e0f0ff !important;
            color: #333333;
            border-top-left-radius: 0.25rem;
            border-top-right-radius: 0.25rem;
            border-bottom: 1px solid #dee2e6;
            padding-top: 1rem !important;
            padding-bottom: 1rem !important;
            font-size: 1.1rem !important;
        }
        .login-card-width {
            width: 30rem;
            max-width: 90%;
        }
        .custom-login-button {
            background-color: #d9534f !important;
            border: 1px solid #d9534f !important;
            color: white !important;
            font-weight: normal !important;
            width: 7rem;
            height: 2.5rem;
            font-size: 1rem;
            padding: 0.375rem 0.75rem;
        }
        .custom-login-button:hover {
            background-color: white !important;
            color: #d9534f !important;
            border-color: #d9534f !important;
            box-shadow: 0 0 0 0.25rem rgba(217, 83, 79, 0.5);
        }
        .input-container {
            width: 70%;
            margin: 0 auto;
        }
    </style>
</head>
<body>

    <div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">

        <div class="card shadow-lg login-card-width">

            <div class="card-header text-center custom-header-blue fw-bold">
                ユニパス連携システム
            </div>

            <div class="card-body p-4">
                <h3 class="text-center mt-3 mb-4">ログイン</h3>

                <%-- ★ 修正: form タグをこの位置に設定し直す ★ --%>
                <form action="main.jsp" method="get">

                    <div class="input-container mb-4">

                        <input
                            type="password"
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