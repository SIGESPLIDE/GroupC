<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">

<%-- head --%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${param.title}| ユニパス連携システム</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../css/custom.css" rel="stylesheet">
</head>

<%-- headerの記述 --%>
<body>
	<header class="header-bg">
		<%-- main.jspに戻る --%>
		<a href="${pageContext.request.contextPath}/loginlogout/mainmenu"
			style="text-decoration: none; color: inherit;"> ユニパス連携システム </a>
		<%-- mainのみログアウトボタンを表示 --%>
		<c:if test="${param.title == 'メインメニュー'}">
			<button type="button" class="btn btn-danger" data-bs-toggle="modal"
				data-bs-target="#logoutConfirmModal">ログアウト</button>
		</c:if>
	</header>

	<div class="container-fluid main-content-wrapper">
		<div class="row h-100">