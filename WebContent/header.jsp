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
            overflow: hidden;
        }
        body {
            display: flex;
            flex-direction: column;
            margin: 0;
        }
        .main-content-wrapper {
            flex-grow: 1;
            display: flex;
        }
        .main-content-wrapper > .row {
            width: 100%;
            height: 100%;
        }
        .header-bg {
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
        .sidebar-bg {
            background-color: #f7f7f7;
            border-right: 1px solid #c0c0c0;
            min-height: 100%;
            padding: 20px;
        }
        .sidebar-menu a {
            color: #333;
            text-decoration: none;
            display: block;
            padding: 5px 0;
            font-size: 1.1rem;
        }
        .content-area {
            padding: 20px;
        }
        .btn-danger:hover {
            background-color: #ffffff !important;
            color: #dc3545 !important;
            border-color: #dc3545 !important;
        }
        .btn-secondary:hover {
            background-color: #ffffff !important;
            color: #6c757d !important;
            border-color: #6c757d !important;
        }
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