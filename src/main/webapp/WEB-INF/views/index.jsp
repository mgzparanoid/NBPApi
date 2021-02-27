<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Index</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="script" href="resources/js/app.js">
</head>
<body>
<%@include file="parts/header.jsp" %>
<h2>Strona główna</h2>
<h1>AXGIOASDGJOIDGKJSDOGKSDGPKOSDGKOPSKDGOPSDGKOSDG
    SDKGSPDKGPODSKGOPSDKGPOKSDGKSDGOPK
    KOSDGKOPSDPOGKOPDSGKOPKSDGOPKSDGKSDGKP</h1>

<h3>
    <c:forEach items="${rateDtoList}" var="currency">
        <tr>
            <td>
                <b>Name: </b> ${currency.name}
            </td>
        </tr>
    </c:forEach>
</h3>
<%@include file="parts/footer.jsp" %>
</body>
</html>