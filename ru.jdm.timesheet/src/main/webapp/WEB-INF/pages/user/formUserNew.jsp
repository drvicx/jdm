<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<%--Set page timestamp --%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String ts = dateFormat.format(new Date());
%>
<!--<!doctype html>-->
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Создание Сотрудника | Табель</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/">
    <link href="resources/css/main.css" rel="stylesheet">
    <!--<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">-->
</head>

<body>

    <h2 class="headerTitle">Добавление Сотрудника</h2>
    <pre class="versionInfo">*ts: <%=ts%></pre>
    <br>

    <!--НЕ_РАБОТАЕТ: ИСХОДНАЯ ФОРМА-->
    <!--
    <form id="user">
        Login:<input id="login" name="login" value="${user.login}" type="text" aria-label="Логин"/><br/>
        Name:<input id="name" name="name" value="${user.name}" type="text" aria-label="Имя"/><br/>
        Surname:<input id="surname" name="surname" value="${user.surname}" type="text" aria-label="Фамилия"/>
    </form>
    -->

    <!--РАБОТАЕТ-->
    <div class="form-style-2">
        <div class="form-style-2-heading">Новый Сотрудник</div>

        <form action="user/add" method="post">
            <%--@declare id="field1"--%><%--@declare id="field2"--%><%--@declare id="field3"--%>
            <%--скрытое поле необходимое для хранения уникального идентификатора--%>
            <input id="userId" name="userId" value="${user.userId}" type="hidden" />

            <%--остальные поля--%>
            <label for="field1">
                <span>Имя</span>
                <input id="name" name="name" value="${user.name}" type="text" class="input-field" />
            </label>
            <label for="field2">
                <span>Фамилия</span>
                <input id="surname" name="surname" value="${user.surname}" type="text" class="input-field" />
            </label>
            <label for="field3">
                <span>Логин</span>
                <input id="login" name="login" value="${user.login}" type="text" class="input-field" />
            </label>

            <!--кнопка при нажатии на которую происходит переход на страницу указанную в <form action="..">-->
            <label>
                <span></span>
                <button class="button">Сохранить</button>
            </label>
        </form>
    </div>

</body>
</html>
