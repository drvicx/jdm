<%--создано: 14.03.2021 15:51--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Сотрудник | Табель</title>
</head>
<body>
<h2>Сотрудник</h2>
<form id="user">
    Login:<input id="login" name="login" value="${user.login}" type="text" aria-label="Логин"/><br/>
    Name:<input id="name" name="name" value="${user.name}" type="text" aria-label="Имя"/><br/>
    Surname:<input id="surname" name="surname" value="${user.surname}" type="text" aria-label="Фамилия"/>
</form>
</body>
</html>
