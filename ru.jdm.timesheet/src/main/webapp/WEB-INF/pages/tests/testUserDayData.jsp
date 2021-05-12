<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Время сотрудника за День | Табель</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</head>

<body>
    <h2>ТЕСТ: Время Сотрудника (День)</h2>

    <!--
        Id: <input id="timeDataId" name="timeDataId" value="${timeData.id}" type="text"/><br/>
        Hour:   <input id="hour" name="hour" value="${timeData.hour}" type="text"/><br/>
        Type:   <input id="type" name="type" value="${timeData.type}" type="text"/><br/>
        Date:   <input id="date" name="date" value="${timeData.date}" type="text"/><br/>
    -->
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
                <tr>
                    <th scope="row">${userDayData.id}</th>
                    <td>${userDayData.userId}</td>
                    <td>${userDayData.hour}</td>
                    <td>${userDayData.type}</td>
                    <td>${userDayData.date}</td>
                </tr>
          </tbody>
        </table>
    </div><!--timedataWrapper-->

</body>
</html>
