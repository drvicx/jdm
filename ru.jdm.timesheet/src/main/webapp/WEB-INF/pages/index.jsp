<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Табель ОРПО | КУСЗН</title>
    <style>
        /**
         *=Включаем отображение границ элеменов глобально и для отдельного класса или группы элементов
         * * { border: 1px solid red; }
         * .debugBorders { border: 1px solid red; }
         * body pre { border: 1px solid red; }
        */
        .headerTitle { margin-bottom: 0px; padding-bottom: 0px; }
        .versionInfo { margin-top: 0px; padding-top: 0px; color: #7f7f7f; }
    </style>
</head>
<body>
    <h3 class="headerTitle">Табель</h3>
    <pre class="versionInfo">*version: 20210318 (06_ConnectDB)</pre>

    <table height="90%" width="100%" border="1">
        <tr>
            <td width="15%" valign="top">
                <div width="100%">
                    <p>Основное меню</p>
                    <ul>
                        <li><a href="/">Табель отдела</a></li>
                        <li><a href="/">Табель сотрудника</a></li>
                        <li><a href="/">Табель сотрудников</a></li>
                    </ul>
                    <p>Разное</p>
                    <ul>
                        <li><a href="/timesheet/user/list" target="_blank">Сотрудники</a></li>
                    </ul>
                </div>
            </td>

            <td width="85%" valign="top">
                <div>
                    <p>Содержание блока</p>
                    <ul>
                        <li><a href="/timesheet/user?userId=0" target="_blank">Начальник Отдела</a></li>
                        <li><a href="/timesheet/user?userId=1" target="_blank">Секретарь</a></li>
                        <li><a href="/timesheet/user?userId=2" target="_blank">Безопасник</a></li>
                        <li><a href="/timesheet/user?userId=3" target="_blank">Кадровик</a></li>
                        <li><a href="/timesheet/user?userId=4" target="_blank">Рабочий1</a></li>
                        <li><a href="/timesheet/user?userId=5" target="_blank">Рабочий2</a></li>
                    </ul>
                </div>
            </td>
        </tr>

        <tr height="25px">
            <td colspan="2" align="center">Copyright @JDM 2021</td>
        </tr>
    </table>

</body>
</html>
