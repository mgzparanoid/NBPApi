<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Currency Counter</title>
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
<form:select path="codes" items="${rateDtoList}"/>
<form:form method="post">

    Insert amount that you want to convert: <input type="number" name="amount">
    <input type="submit" value="submit">
    Przeliczona wartość to: ${result} zł.
    <br>
    Powstała w wyniku mnożenia: ${certainCurrencyList.mid} ${certainCurrencyList.code} * ${amount}.
</form:form>

</form>


</body>
</html>
