<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h5 class="mb-3">サイドメニュー</h5>
<div class="sidebar-menu">
    <a href="${pageContext.request.contextPath}/studentinfo/studentinfo_list">生徒情報</a>
    <a href="${pageContext.request.contextPath}/timetable/timetable_list">時間割</a>
    <a href="${pageContext.request.contextPath}/keyword/keyword_index">キーワード設定</a>

    <%-- 管理者がログインしている場合 --%>
    <c:if test="${userAuth == 1}">
        <a href="${pageContext.request.contextPath}/password/teacher_password">パスワード変更</a>
    </c:if>
</div>