<%--создано: 14.03.2021 15:51--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Сотрудник | Табель</title>

    <style type="text/css">

        .form-style-2 {
            max-width: 500px;
            padding: 20px 12px 10px 20px;
            font: 13px Arial, Helvetica, sans-serif;
        }
        .form-style-2-heading {
            font-weight: bold;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
            font-size: 15px;
            padding-bottom: 3px;
            color: #333;
        }
        .form-style-2 label {
            display: block;
            margin: 0px 0px 15px 0px;
        }
        .form-style-2 label > span {
            width: 100px;
            font-weight: bold;
            float: left;
            padding-top: 8px;
            padding-right: 5px;
            color: #555;
        }
        .form-style-2 input.input-field, .form-style-2 {
            width: 48%;
        }
        .form-style-2 input.input-field {
            box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            border: 1px solid #C2C2C2;
            box-shadow: 1px 1px 4px #EBEBEB;
            -moz-box-shadow: 1px 1px 4px #EBEBEB;
            -webkit-box-shadow: 1px 1px 4px #EBEBEB;
            border-radius: 3px;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            padding: 7px;
            outline: none;
        }
        .form-style-2 .input-field:focus {
            border: 1px solid #0C0;
        }

        .button {
            background-color: white;
            color: black;
            border: 1px solid #555;
            padding: 8px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 12px;
            margin: 1px 1px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #555;
            color: white;
        }
    </style>
</head>

<body>
<!--
<h2>Сотрудник</h2>
<form id="user">
    Login:<input id="login" name="login" value="${user.login}" type="text" aria-label="Логин"/><br/>
    Name:<input id="name" name="name" value="${user.name}" type="text" aria-label="Имя"/><br/>
    Surname:<input id="surname" name="surname" value="${user.surname}" type="text" aria-label="Фамилия"/>
</form>
-->

<div class="form-style-2">
    <div class="form-style-2-heading">Общая информация о сотруднике</div>
    <form action="" method="post">
        <%--@declare id="field1"--%><%--@declare id="field2"--%>
        <label for="field1"><span>ФИО</span><input type="text" class="input-field" name="field1" value="${user.name} ${user.surname}" /></label>
        <label for="field2"><span>Логин</span><input type="text" class="input-field" name="field2" value="${user.login}" /></label>
        <label><span></span>
            <button class="button">Submit</button>
        </label>
    </form>
</div>

</body>
</html>
