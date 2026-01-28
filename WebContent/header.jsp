<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">

<%-- head --%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title} | ユニパス連携システム</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/custom.css" rel="stylesheet">

    <%-- スタイル --%>
    <style>
        html, body { height: 100%; margin: 0; overflow: hidden; }
        body { display: flex; flex-direction: column; }
        .header-bg {
            flex-shrink: 0; background-color: #e6f0ff; color: #333;
            border-bottom: 1px solid #c0c0c0; padding: 10px 20px;
            font-size: 1.2rem; font-weight: bold; display: flex;
            justify-content: space-between; align-items: center;
        }
        .main-content-wrapper { flex-grow: 1; overflow: hidden; display: flex; padding: 0; }
        .main-content-wrapper > .row { width: 100%; height: 100%; margin: 0; }
        .sidebar-bg {
            border-right: 1px solid #c0c0c0;
            height: 100%; overflow-y: auto; padding: 20px; flex-shrink: 0;
        }
        .content-area { flex-grow: 1; padding: 20px; }
        .footer-fixed {
            flex-shrink: 0; width: 100%; padding: 5px 0;
            background-color: #e6f0ff; border-top: 1px solid #c0c0c0;
            text-align: center; font-size: 0.8rem;
        }
        .sidebar-menu a { color: #333; text-decoration: none; display: block; padding: 5px 0; font-size: 1.1rem; }
        .btn-danger:hover { background-color: #ffffff !important; color: #dc3545 !important; border-color: #dc3545 !important; }
        .btn-secondary:hover { background-color: #ffffff !important; color: #6c757d !important; border-color: #6c757d !important; }
    </style>
</head>

<%-- headerの記述 --%>
<body>
    <header class="header-bg">
    	<%-- main.jspに戻る --%>
        <a href="${pageContext.request.contextPath}/loginlogout/mainmenu" style="text-decoration: none; color: inherit;">
            ユニパス連携システム
        </a>
        <%-- mainのみログアウトボタンを表示 --%>
        <c:if test="${param.title == 'メインメニュー'}">
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#logoutConfirmModal">
                ログアウト
            </button>
        </c:if>
    </header>

    <div class="container-fluid main-content-wrapper">
        <div class="row h-100">