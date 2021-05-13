<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Время сотрудника за Месяц | Табель</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</head>

<body>
    <h2>ТЕСТ: Время Сотрудника (Неделя/Месяц) | static</h2>

    <!--   CSS Bootstrap 5 Tables
           https://getbootstrap.com/docs/5.0/content/tables/
    -->
    <div id="timedataWrapper" style="border: 0px solid red; position: relative; width: 40%; left: 50px; margin-top: 50px; padding: 10px;">
        <table id="timedata" class="table table-sm table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">USERID</th>
                    <th scope="col">HOUR</th>
                    <th scope="col">TYPE</th>
                    <th scope="col">DATE</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${not empty userMonthData}">
                    <c:forEach items="${userMonthData}" var="mdata">
                        <tr>
                            <th scope="row">${mdata.id}</th>
                            <td>${mdata.userId}</td>
                            <td>${mdata.hour}</td>
                            <td>${mdata.type}</td>
                            <td>${mdata.date}</td>
                        </tr>
                    </c:forEach>
                </c:if>
          </tbody>
        </table>
    </div><!--timedataWrapper-->

</body>
</html>
