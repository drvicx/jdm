<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<!--<!doctype html>-->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>В разборке | 404</title>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/">
    <!--<link href="resources/css/main.css" rel="stylesheet">-->
    <style>

        body {
            border: 0;
            margin: 0;
            padding: 0;
        }

        img {
            /*border: 1px solid green;*/
            margin: auto;
            display: block;
        }

        #wrapper {
            /*border: 0px solid red;*/
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #internal {
            /*border: 1px solid green;*/
            text-align: center;
        }

        #internal span {
            /*border: 1px solid red;*/
            min-width: 100%;
            text-align: center;
            color: #AF2F1D;
            font-family: monospace;
            font-size: 20px;
            font-weight: bold;
        }

    </style>

</head>

<body>
    <div id="wrapper">
        <div id="internal">
            <span>Страницанама в разборке<br> насяльника!</span>
            <img src="resources/images/workers.png" />
        </div>
    </div>
</body>
</html>
