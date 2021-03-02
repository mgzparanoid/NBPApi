<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
<%@include file="parts/header.jsp" %>
<%--TODO Adding script that takes the values from radio/select button to do the equation--%>
<%--<form:radiobuttons path="getMapOfCodes" items="${getMapOfCodes}" display="value" name="radio"/>--%>
<div>
    <h1>List of currency codes you can enter:</h1>
</div>
<div>
    <c:forEach items="${getMapOfCodes}" var="current">
        <b>${current.key}</b>
    </c:forEach>
</div>
<br>
<div>
    <form:form method="post">

    <div>
        Insert amount that you want to convert: <input type="number" name="amount" step="0.01" required="yes"
                                                       id="number" >
        Insert the code of the value: <input type="text" label="code" name="valueName" required="yes" id="valueName" pattern="[Cc][Hh][Ff]|[Hh][Rr][Kk]|
                                                                                                  [Mm][Xx][Nn]|[Cc][Ll][Pp]|
                                                                                                  [Zz][Aa][Rr]|[Ii][Nn][Rr]|[Tt][Hh][Bb]|[Cc][Nn][Yy]|[Aa][Uu][Dd]|[Ii][Ll][Ss]|[Kk][Rr][Ww]|
                                                                                                  [Jj][Pp][Yy]|[Gg][Bb][Pp]|[Ii][Dd][Rr]|[Hh][Uu][Ff]|[Pp][Hh][Pp]|[Tt][Rr][Yy]|[Rr][Uu][Bb]|[Hh][Kk][Dd]|
                                                                                                  [Ii][Ss][Kk]|[Ee][Uu][Rr]|[Dd][Kk][Kk]|[Uu][Ss][Dd]|[Cc][Aa][Dd]|[Mm][Yy][Rr]|[Xx][Dd][Rr]|[Bb][Gg][Nn]|
                                                                                                  [Nn][Oo][Kk]|[Rr][Oo][Nn]|[Ss][Gg][Dd]|[Cc][Zz][Kk]|[Ss][Ee][Kk]|[Nn][Zz][Dd]|[Uu][Aa][Hh]|[Bb][Rr][Ll]">
            <%--        TODO validation through a JS script, not the way it is.--%>
        <input type="submit" value="submit">
    </div>
    <br>
    <h2>Currency summary</h2>
    <tr>
        <td>
            <b>Currency:</b> ${certainCurrencyList.currency}
            <b>Code: </b> ${certainCurrencyList.code}
            <b>Mid: </b> ${certainCurrencyList.mid}
            <br>
        </td>
    </tr>

</div>
</form:form>
</div>

<%--TODO This solution makes my eyes bleeding, hence I need to change it once I learn how to do it efficently. I could do that based on the ROLES, but that doesnt make any sense to include SPRING SECURITY in that application, as its for everybody.--%>

<% if (request.getParameter("amount") != null && request.getParameter("valueName") != null) {
    out.println("  <div>\n" +
            "            Converted value in polish currency(PLN): <b>");
}%>
${result}
<% if (request.getParameter("amount") != null && request.getParameter("valueName") != null) {
    out.println("</b> .\n" +
            "        </div>\n" +
            "        <br>\n" +
            "        <div>\n" +
            "            The math behind that:\n" +
            "            <br>\n" +
            "            The entered amount is:\n" +
            "            <br>\n" +
            "            <b>");
}%>
${amount}
<%
    if (request.getParameter("amount") != null && request.getParameter("valueName") != null) {
        out.println("</b>\n" +
                "            <br>\n" +
                "            The entered currency is:\n" +
                "            <br>\n" +
                "            <b>");
    }
%>
${certainCurrencyList.code}
<% if (request.getParameter("amount") != null && request.getParameter("valueName") != null) {
    out.println("</b>\n" +
            "            <br>\n" +
            "            The exchange rate for the currency is:\n" +
            "            <br>\n" +
            "            <b>");
}%>
${certainCurrencyList.mid}
<%
    if (request.getParameter("amount") != null && request.getParameter("valueName") != null) {
        out.println("</b>\n" +
                "\n" +
                "        </div>");
    }
%>

<script>
    const valueName = document.getElementById("valueName");

    valueName.addEventListener("input", function (event) {
        if (valueName.validity.patternMismatch) {
            valueName.setCustomValidity("Wrong code, please look above for a list of all codes. Be vary of unnecessary spaces.");
        } else {
            valueName.setCustomValidity("");
        }
    });
</script>

</body>
</html>
