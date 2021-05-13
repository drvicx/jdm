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
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Создание Дня Сотрудника | Табель</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/">
    <link href="resources/css/main.css" rel="stylesheet">
    <!--<script src="resources/js/main.js"></script>-->
</head>

<body>
    <h2 class="headerTitle">Добавление Дня Сотрудника</h2>
    <pre class="versionInfo">*ts: <%=ts%></pre>
    <br>

    <!--ФОРМА СВЕДЕНИЯ О ОТРАБОТАННОМ ВРЕМЕНИ СОТРУДНИКА ЗА ДЕНЬ-->
    <div class="form-style-2">
        <div class="form-style-2-heading">Параметры учетного Дня</div>

        <form action="timedata/save" method="post">
            <%--@declare id="field1"--%><%--@declare id="field2"--%><%--@declare id="field3"--%><%--@declare id="field4"--%><%--@declare id="field5"--%>
            <%--скрытое поле необходимое для хранения уникального идентификатора--%>
            <input id="id" name="id" value="${timeData.id}" type="hidden" />

            <label for="field2">
                <span>ИдСотрудника</span>
                <input id="userId" name="userId" value="${timeData.userId}" placeholder="3" type="text" class="input-field" style="color: #0000ff" />
            </label>

            <label for="field3">
                <span>Дата</span>
                <!--<input id="date" name="date" value="${timeData.date}" placeholder="1900-01-31" type="text" class="input-field" style="color: #0000ff" />-->
                    <input id="date" name="date" value="${timeData.date}" placeholder="1900-01-31" type="date" class="input-field" style="color: #0000ff" />
            </label>

            <label for="field4">
                <span>Часы</span>
                <input id="hour" name="hour" value="${timeData.hour}" placeholder="8" type="text" class="input-field" style="color: #0000ff" />
            </label>

            <label for="field5">
                <span>Признак</span>
                <input id="type" name="type" value="${timeData.type}" placeholder="Я" type="text" class="input-field" style="color: #0000ff" />
            </label>

            <!--Кнопка при нажатии на которую происходит сохранение данных в БД-->
            <label>
                <span></span>
                <button class="button">Сохранить</button>
            </label>
        </form>
    </div>

    <a href="timedata/editusersdays">&laquo; к списку</a>

</body>
</html>

