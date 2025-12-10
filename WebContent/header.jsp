<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title} | ユニパス連携システム</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <%-- スタイル --%>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            overflow: hidden;
        }
        body {
            display: flex;
            flex-direction: column;
        }

        /* ヘッダーの固定 */
        .header-bg {
            flex-shrink: 0;
            background-color: #e6f0ff;
            color: #333;
            border-bottom: 1px solid #c0c0c0;
            padding: 10px 20px;
            font-size: 1.2rem;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* メインコンテンツラッパー (HeaderとFooterの間の全領域) */
        .main-content-wrapper {
            flex-grow: 1;
            overflow: hidden;
            display: flex;
            padding: 0;
        }

        .main-content-wrapper > .row {
            width: 100%;
            height: 100%;
            margin: 0;
        }

        /* サイドバーの固定化 */
        .sidebar-bg {
            background-color: #f7f7f7;
            border-right: 1px solid #c0c0c0;
            height: 100%;
            overflow-y: auto;
            padding: 20px;
            flex-shrink: 0;
        }

        /* コンテンツエリア (この要素自体はスクロールしない親コンテナ) */
        .content-area {
            flex-grow: 1;
            padding: 20px;
        }

        /* footerの固定 (footer.jspに適用すべきクラス) */
        .footer-fixed {
            flex-shrink: 0;
            width: 100%;
            padding: 5px 0;
            background-color: #e6f0ff;
            border-top: 1px solid #c0c0c0;
            text-align: center;
            font-size: 0.8rem;
        }

        /* その他既存のスタイル */
        .sidebar-menu a {
            color: #333;
            text-decoration: none;
            display: block;
            padding: 5px 0;
            font-size: 1.1rem;
        }
        .btn-danger:hover { background-color: #ffffff !important; color: #dc3545 !important; border-color: #dc3545 !important; }
        .btn-secondary:hover { background-color: #ffffff !important; color: #6c757d !important; border-color: #6c757d !important; }
    </style>
</head>
<body>
    <header class="header-bg">
        ユニパス連携システム
        <button type="button" class="btn btn-danger"
                data-bs-toggle="modal" data-bs-target="#logoutConfirmModal">
            ログアウト
        </button>
    </header>

    <div class="container-fluid main-content-wrapper">
        <div class="row h-100">