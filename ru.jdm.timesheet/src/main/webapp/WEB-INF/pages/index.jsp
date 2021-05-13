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
    <title>Табель ОРПО</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/">
    <link href="resources/css/main.css" rel="stylesheet">
    <!--<script src="resources/js/main.js"></script>-->
</head>

<body>
    <h3 class="headerTitle">Табель</h3>
    <pre class="versionInfo">*version: 20210512_2324 (08_UpdateData)<br>*ts.....: <%=ts%></pre>

    <table class="fixed" height="90%" width="100%" style="border: 1px solid #C2C2C2;">

        <col width="220px" />
        <col width="auto" />
        <tr>
            <!--<td width="15%" valign="top">-->
            <td valign="top">
                <div width="100%" class="menuLeft">
                    <p>Основное меню</p>
                    <ul>
                        <li><a href="page404" target="_blank">Табель отдела</a></li>
                        <li><a href="page404" target="_blank">Табель сотрудника</a></li>
                        <li><a href="page404" target="_blank">Табель сотрудников</a></li>
                    </ul>
                    <p>Просмотр</p>
                    <ul>
                        <li><a href="user/listview" target="_blank">Сотрудники</a></li>
                        <li><a href="user/view?userId=1" target="_blank">Сотрудник (userId=1)</a></li>
                        <li><a href="timedata/viewusersdays" target="_blank">Дни Сотрудников</a></li>
                        <li><a href="timedata/viewrecord?id=33" target="_blank">Единичная запись</a></li>
                        <li><a href="timedata/viewuserday?userId=1&date=2021-03-01" target="_blank">День Сотрудника</a></li>
                        <li><a href="timedata/viewuserdays?userId=2" target="_blank">Дни Сотрудника</a></li>
                    </ul>
                    <p>Изменение</p>
                    <ul>
                        <li><a href="user/listedit" target="_blank">Сотрудники</a></li>
                        <li><a href="user/edit?userId=1" target="_blank">Сотрудник (userId=1)</a></li>
                        <li><a href="timedata/editusersdays" target="_blank">Дни Сотрудников</a></li>
                        <!--<li><a href="timedata/edit?userId=1&date=2021-03-01" target="_blank">День Сотрудника</a></li>-->
                    </ul>
                    <p>Тесты</p>
                    <ul>
                        <li><a href="page404" target="_blank">Нету</a></li>
                        <li><a href="tests" target="_blank">Контроллер 0</a></li>
                        <li><a href="tests/test1" target="_blank">Контроллер 1</a></li>
                        <li><a href="tests/test2" target="_blank">Контроллер 2</a></li>
                        <li><a href="tests/test3" target="_blank">Контроллер 3</a></li>
                        <li><a href="tests/test4" target="_blank">Контроллер 4</a></li>
                        <li><a href="tests/test5" target="_blank">Контроллер 5</a></li>
                        <li><a href="tests/test6?id=1" target="_blank">Контроллер 6</a></li>
                        <br>
                        <li><a href="timedata/getrecord?id=3" target="_blank">Одна Запись из TD</a></li>
                        <li><a href="timedata/getrecords" target="_blank">Все Записи из TD</a></li>
                        <!--<li><a href="timedata/userdaydata" target="_blank">День Сотрудника v1</a></li>-->
                        <li><a href="page404" target="_blank">День Сотрудника v1</a></li>
                        <li><a href="timedata/getuserday?userId=1&date=2021-03-01" target="_blank">День Сотрудника v2</a></li>
                        <!--<li><a href="timedata/usermonthdata" target="_blank">Месяц Сотрудника</a></li>-->
                        <li><a href="page404" target="_blank">Месяц Сотрудника</a></li>
                    </ul>
                </div>
            </td>

            <td width="85%" valign="top">
                <div>
                    <p>Содержание блока</p>
                    <ul>
                        <!--
                        <li><a href="user?userId=1" target="_blank">Начальник Отдела</a></li>
                        <li><a href="user?userId=2" target="_blank">Секретарь</a></li>
                        <li><a href="user?userId=3" target="_blank">Безопасник</a></li>
                        <li><a href="user?userId=4" target="_blank">Кадровик</a></li>
                        <li><a href="user?userId=5" target="_blank">Рабочий1</a></li>
                        <li><a href="user?userId=6" target="_blank">Рабочий2</a></li>
                        -->
                        <pre style="color: #7f7f7f">ВЫВОД ВО ВНУТРЕННИЙ ФРЕЙМ НЕ РЕАЛИЗОВАН</pre>
                    </ul>
                </div>
            </td>
        </tr>

        <tr height="25px" class="test_footer">
            <td class="footer_centered" colspan="2" align="center">Copyright @JDM 2021</td>
        </tr>
    </table>

</body>
</html>
