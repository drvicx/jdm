# jdm
JavaEE Tutorial "Timesheet App"<hr/>


<b>=ИСТОРИЯ ИЗМЕНЕНИЙ:</b><br/>
*сначала самые новые; <br/>
<hr/>

08: 20210512: Update Data
- реализован функционал Изменения, Добавления, Удаления данных для Сущностей "User" и "Timedata";
- логика отображения разбита на формы ТолькоЧтение и Редактирование;  
- обновлены Контроллеры:<br>
  UserController.java, TimeDataController.java
- добавлены Виды:<br>
  formUserListView.jsp, formUserListEdit.jsp, formUserView.jsp, formUserEdit.jsp, formUserNew.jsp,<br>
  formTDataListView.jsp, formTDataListEdit.jsp, formTDataView.jsp, formTDataEdit.jsp, formTDataNew.jsp<br>
- добавлены CSS-стили к JSP-страницам;
- обновлено веб-приложение на прерываемой виртуальной машине Yandex.Cloud:<br>
  https://dotspace.ru/ <br>
  http://dotspace.ru:8080/timesheet/ <br>
<hr/>

07: 20210325: Timedata Implementation
- с помощью GUI-инструмента в БД создана и заполнена таблица "TIMEDATA";
- создан Энумератор "TimeDataType.java" для хранения кодов учета времени;
- создан JPA Класс "TimeData.java" для связи с таблицей TIMEDATA;
- создана Модель "TimeDataRepository.java" для выборки данных из БД;
- создан Контроллер "TimeDataController.java" обрабатывающий параметры GET-запроса для извлечения Данных;
- создан Вид "/timedata/form.jsp" (информация об 1 учетном дне сотрудника в табеле);
- внесены изменения в Вид "index.jsp": добавлены новые элементы в Меню: <br/>
--"Табель Сотрудника #1"<br/>
http://localhost:8080/timesheet/timedata?userId=1&date=2021-03-01 <br/>
--"Табель Сотрудника #2"<br/>
http://localhost:8080/timesheet/timedata?userId=2&date=2021-03-01
<hr/>

06: 20210318: Connect DB
- установлена СУБД HSQLDB (HyperSQL DataBase);
- создан скрипт "HSQL_start.bat" запускающий СУБД;
- создан скрипт "HSQL_stop.bat" безопасно останавливающий СУБД;
- с помощью GUI-инструмента в БД создана и заполнена таблица "USER";
- добавлены необходимые зависимости в pom.xml;
- создана конфигурация подключения к БД в "persistence.xml";
- создана конфигурация JPA в "JpaConfig.java";
- внесены изменения в Модель: создаем Интерфейс "UserRepository.java";
- внесены изменения в Контроллер: добавляем связь с данными в Модели (в БД);
- внесены изменения в Вид: "user/form.jsp", "user/list.jsp", "index.jsp";

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
- настроен локальный контейнер сервлетов Apache Tomcat (далее — веб-сервер);
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
- в IDE с помощью артефакта создан каркас Maven-проекта и подключены базовые зависимости в "pom.xml";
<hr/>

00: Базовые системные требования
- ОС Windows 7/10 (для разработки)
- IDE IntelliJ IDEA Ultimate Edition 2020.3.2
- Oracle Java SE 1.8.0_231 JDK
- Git клиент для Windows 2.28.0.windows.1
- Apache Maven 3.6.3
- Apache Tomcat 9.0.43
- In-Memory Java СУБД HSQLDB (HyperSQL DataBase)
