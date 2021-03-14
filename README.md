# jdm
JavaEE Tutorial "Timesheet App"<hr/>


<b>=ИСТОРИЯ ИЗМЕНЕНИЙ:</b><br/>
*сначала самые новые; <br/>
<hr/>

05: 20210311: Model and View
- создана Модель: класс "User" и тестовые данные;
- создан Вид: созданы разделы "/user" и "/user/list";
- внесены изменения в Контроллер: добавлены маршруты к новым разделам;
- добавлены ссылки на разделы на странице "index.jsp";
<hr/>

04: 20210225: Create Main Page
- создан каркас основной страницы "index.jsp";
- создан Контроллер и настроена маршрутизация к странице "index.jsp";
- настроен автоматический деплой веб-приложения из IDE веб-сервер;
- веб-приложение размещено на веб-сервере;
- проверена работа основного раздела:
  http://locahost:8080/timesheet;
<hr/>

03: 20210218: Create Spring MVC Application
- создан каркас SpringMVC - приложения;
- настроен локальный контейнер сервлетов Apache Tomcat (далее - веб-сервер);
- настроен автоматический деплой веб-приложения из IDE на веб-сервер
  и проверена работа основного раздела веб-приложения
  http://locahost:8080/timesheet;
<hr/>

02: 20210211: Create Remote GitHub Project and Sync with local
- на GitHub создан репозиторий, добавлен проект "TimeSheet", создан первый "issue";
- произведена выгрузка каркаса Локального Maven-проекта (ветки "create-maven-project") из IDE в GitHub аккаунт;
- на GitHub создан первый "Pull Request" на слияние изменений с веткой "main";
<hr/>

01: 20210128: Create Local Maven Project
- в IDE с помощью артифакта создан каркас Maven-проекта и подключены базовые зависимости в "pom.xml";
<hr/>

00: Базовые системные требования
- ОС Windows 7/10 (для разработки)
- IDE IntelliJ IDEA Ultimate Edition 2020.3.2
- Oracle Java SE 1.8.0_231 JDK
- Git клиент для Windows 2.28.0.windows.1
- Apache Maven 3.6.3
- Apache Tomcat 9.0.43
