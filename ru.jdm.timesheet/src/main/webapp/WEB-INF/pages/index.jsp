<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
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
    <pre class="versionInfo">*version: 20210225 (04_CreateMainPage)</pre>

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
                </div>
            </td>

            <td width="85%" valign="top">
                <div>
                    <ul>
                        <li>Начальник отдела</li>
                        <li>Сотрудник1</li>
                        <li>Сотрудник2</li>
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
