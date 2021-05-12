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
    <title>Сотрудники | Табель ОРПО</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/">
    <link href="resources/css/main.css" rel="stylesheet">
    <!--<script src="resources/js/main.js"></script>-->
</head>

<body>
    <h2 class="headerTitle">Просмотр Сотрудников</h2>
    <pre class="versionInfo">*ts: <%=ts%></pre>
    <br>
    <br>

    <!---->
    <div id="userList">
        <table class="userListTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${not empty users}">
                    <c:forEach var="u" items="${users}">
                        <tr>
                            <td>${u.userId}</td>
                            <td>${u.name}</td>
                            <td>${u.surname}</td>
                            <td><a href="user/view?userId=${u.userId}" target="_blank">смотреть</a></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </tbody>
        </table>
    </div>

</body>
</html>
