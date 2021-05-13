<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<!--<!doctype html>-->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Сотрудник | Табель</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/">
    <link href="resources/css/main.css" rel="stylesheet">
    <!--<script src="resources/js/main.js"></script>-->
</head>

<body>

<h2>Сотрудник</h2>
<br>

    <!--ФОРМА СВЕДЕНИЯ О СОТРУДНИКЕ (только чтение)-->
    <div class="form-style-2">
        <div class="form-style-2-heading">Общая информация о сотруднике</div>
        <form action="user/save" method="post">
                <%--@declare id="field1"--%><%--@declare id="field2"--%><%--@declare id="field3"--%>
                <%--скрытое поле необходимое для хранения уникального идентификатора--%>
                <input readonly id="userId" name="userId" value="${user.userId}" type="hidden" />
                <label for="field1">
                    <span>Имя</span>
                    <input readonly id="name" name="name" value="${user.name}" type="text" class="input-field" />
                </label>
                <label for="field2">
                    <span>Фамилия</span>
                    <input readonly id="surname" name="surname" value="${user.surname}" type="text" class="input-field" />
                </label>
                <label for="field3">
                    <span>Логин</span>
                    <input readonly id="login" name="login" value="${user.login}" type="text" class="input-field" />
                </label>
        </form>
    </div>

    <a href="user/listview">&laquo; к списку</a>

</body>
</html>
