<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Сотрудник | Табель</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/">
    <link href="resources/css/main.css" rel="stylesheet">
    <!--<script src="resources/js/main.js"></script>-->
</head>

<body>

<h2 class="headerTitle">Сотрудник</h2>
<pre class="versionInfo">*ts: <%=ts%></pre>
<br>

    <!--ФОРМА СВЕДЕНИЯ О СОТРУДНИКЕ + СОХРАНЕНИЕ (ver1)-->
    <!--
    <form action="user/save" method="post">

        <input id="userId" name="userId" value="${user.userId}" type="hidden"/>
        <table>
            <tr><td>Login</td>   <td><input id="login" name="login" value="${user.login}" type="text"/><br/></td></tr>
            <tr><td>Name</td>    <td><input id="name" name="name" value="${user.name}" type="text"/><br/></td></tr>
            <tr><td>Surname</td> <td><input id="surname" name="surname" value="${user.surname}" type="text"/></td></tr>
        </table>
        <br>
        <input type="submit" value="save"/>
    </form>

    <br>
    <a href="user/list">&laquo; к списку</a>
    -->

    <!--ФОРМА СВЕДЕНИЯ О СОТРУДНИКЕ + СОХРАНЕНИЕ (ver2): ИСПРАВЛЕНО-->
    <div class="form-style-2">
        <div class="form-style-2-heading">Общая информация о сотруднике</div>
        <form action="user/save" method="post">
            <%--@declare id="field1"--%><%--@declare id="field2"--%><%--@declare id="field3"--%>
            <%--скрытое поле необходимое для хранения уникального идентификатора--%>
            <input id="userId" name="userId" value="${user.userId}" type="hidden" />
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
            <!--Кнопка при нажатии на которую происходит сохранение данных в БД-->
            <label>
                    <span></span>
                    <button class="button">Сохранить</button>
            </label>
        </form>
    </div>

    <a href="user/listedit">&laquo; к списку</a>

</body>
</html>
