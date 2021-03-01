<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>All</title>


    <%--    <style>--%>
    <%--        <%@ include file="/css/style.css" %>--%>
    <%--    </style>--%>

</head>
<body>
<%@include file="parts/header.jsp" %>

<h2>List of all currencies, codes and their exchange rate values taken from the NBP API:</h2>

<%--TO DO:: Tutaj chce dodać możliwość wyszukiwania valut po wartości MID!!!!!!--%>

<%--<form:form method="post" modelAttribute="rateDtoList">--%>
<%--<div>--%>
<%--    <label></label>--%>
<%--</div>--%>
<%--</form:form>--%>
<%--<form:radiobuttons items="${rateDtoList}" path="rateDtoList"/>--%>

<table>
    <h6>
        <c:forEach items="${rateDtoList}" var="rateDtoList">
            <tr>
                <td>
                    <b>Currency:</b> ${rateDtoList.currency}
                    <b>Code: </b> ${rateDtoList.code}
                    <b>Mid: </b> ${rateDtoList.mid}
                    <br>
                </td>
            </tr>
        </c:forEach>
    </h6>
</table>

</body>
</html>