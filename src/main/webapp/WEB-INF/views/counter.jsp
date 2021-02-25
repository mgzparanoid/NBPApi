<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
<tr>
    <td>
        <b>Currency:</b> ${certainCurrencyList.currency}
        <b>Code: </b> ${certainCurrencyList.code}
        <b>Mid: </b> ${certainCurrencyList.mid}
        <br>
    </td>
</tr>
<%--    Tutaj jest select, by dodać mnożnik z tego do działania--%>
<%--<form:select path="codes" items="${rateDtoList}" name="converter"/>--%>


<%--<form:select path="codes" items="${getListOfCodes}"/>--%>

<%--<form:radiobuttons path="getMapOfCodes" items="${getMapOfCodes}" display="value" name="radio"/>--%>
<c:forEach items="${getMapOfCodes}" var="current">
    <form:radiobutton path="getMapOfCodes" value="${current.key}" label="${current.key} Value: ${current.value}" name="radio" var="radio"/>
    <br>
</c:forEach>
<b>${radio.value}</b>
<br>
<form:form method="post">

    Insert amount that you want to convert: <input type="number" name="amount">
    <input type="submit" value="submit">
    <br>
    Converted value: ${result} zł.
    <br>
    The math behind that:${certainCurrencyList.mid} ${certainCurrencyList.code} * ${amount}.
</form:form>

</form>


</body>
</html>
