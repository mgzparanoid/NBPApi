<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Index</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Charmonman:400,700|Open+Sans:400,600,700&amp;subset=latin-ext"
          rel="stylesheet">

<%--    <style>--%>
<%--        <%@ include file="/css/style.css" %>--%>
<%--    </style>--%>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

</head>
<body>

<h2>Strona główna</h2>
<h1>AXGIOASDGJOIDGKJSDOGKSDGPKOSDGKOPSKDGOPSDGKOSDG
SDKGSPDKGPODSKGOPSDKGPOKSDGKSDGOPK
KOSDGKOPSDPOGKOPDSGKOPKSDGOPKSDGKSDGKP</h1>
<h3>
    <c:forEach items="${currencyList}" var="currency">
        <b>Name: </b> ${currencyList.name}
    </c:forEach>
</h3>

</body>
</html>