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
    <title>Табель сотрудника за День | Табель ОРПО</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/">
    <link href="resources/css/main.css" rel="stylesheet">
</head>

<body>

    <h2 class="headerTitle">Просмотр Дня Сотрудника</h2>
    <pre class="versionInfo">*ts: <%=ts%></pre>
    <br>

    <!---->
    <div id="userTDataView">
        <table class="userListTable">
            <thead>
            <tr>
                <th>Id</th>
                <th>UserId</th>
                <th>Date</th>
                <th>Hour</th>
                <th>Type</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${not empty timeData}">
                <%-- no need for iteration, couse this is single object --%>
                <%-- <c:forEach var="tdata" items="${timeData}"> --%>
                <tr>
                    <td>${timeData.id}</td>
                    <td>${timeData.userId}</td>
                    <td>${timeData.date}</td>
                    <td>${timeData.hour}</td>
                    <td>${timeData.type}</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

</body>
</html>
