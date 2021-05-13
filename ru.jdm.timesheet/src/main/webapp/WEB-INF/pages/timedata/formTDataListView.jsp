<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <title>Табель сотрудников за все Время | Табель ОРПО</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/">
    <link href="resources/css/main.css" rel="stylesheet">
</head>

<body>
    <h2 class="headerTitle">Просмотр Дней Сотрудника(ов)</h2>
    <pre class="versionInfo">*ts: <%=ts%></pre>
    <br>
    <br>

    <!---->
    <div id="userTDataListView">
        <table class="userListTable">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>UserId</th>
                    <th>Date</th>
                    <th>Hour</th>
                    <th>Type</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${not empty timeData}">
                    <c:forEach var="t" items="${timeData}">
                        <tr>
                            <td>${t.id}</td>
                            <td>${t.userId}</td>
                            <td>${t.date}</td>
                            <td>${t.hour}</td>
                            <td>${t.type}</td>
                            <td><a href="timedata/viewrecord?id=${t.id}" target="_blank">смотреть</a></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </tbody>
        </table>
    </div>

</body>
</html>
