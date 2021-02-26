<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>

<%--    Tutaj jest select, by dodać mnożnik z tego do działania--%>
<%--<form:select path="codes" items="${rateDtoList}" name="converter"/>--%>


<%--<form:input path="codes" items="${getListOfCodes}"/>--%>

<%--<form:radiobuttons path="getMapOfCodes" items="${getMapOfCodes}" display="value" name="radio"/>--%>
<div>
    <h1>List of currency codes you can enter:</h1>
</div>
<div>
    <c:forEach items="${getMapOfCodes}" var="current">
        <b>${current.key}</b>
    </c:forEach>
</div>
<%--<%--%>
<%--    String b = request.getParameter("current");--%>
<%--    out.print(b);--%>
<%--%>--%>
<%--<b>${current.value}</b>--%>
<br>
<div>
    <form:form method="post">

    <div>
        Insert amount that you want to convert: <input type="number" name="amount" step="0.01" required="yes" id="number">
        Insert the code of the value: <input type="text" name="valueName" required="yes" id="valueName"  pattern="[Cc][Hh][Ff]|[Hh][Rr][Kk]|
                                                                                                  [Mm][Xx][Nn]|[Cc][Ll][Pp]|
                                                                                                  ZAR|INR|THB|CNY|AUD|ILS|KRW|
                                                                                                  JPY|GBP|IDR|HUF|PHP|TRY|RUB|HKD|
                                                                                                  ISK|EUR|DKK|USD|CAD|MYR|XDR|BGN|
                                                                                                  NOK|RON|SGD|CZK|SEK|NZD|UAH|BRL">
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
        <%--        <div>--%>
        <%--            Converted value in polish currency(PLN): <b>${result}</b> .--%>
        <%--        </div>--%>
        <%--        <br>--%>
        <%--        <div>--%>
        <%--            The math behind that:--%>
        <%--            <br>--%>
        <%--            The entered amount is:--%>
        <%--            <br>--%>
        <%--            <b>${amount}</b>--%>
        <%--            <br>--%>
        <%--            The entered currency is:--%>
        <%--            <br>--%>
        <%--            <b>${certainCurrencyList.code}</b>--%>
        <%--            <br>--%>
        <%--            The exchange rate for the currency is:--%>
        <%--            <br>--%>
        <%--            <b>${certainCurrencyList.mid}</b>--%>

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

</form>
<script>
    const valueName = document.getElementById("valueName");

    valueName.addEventListener("input", function (event){
        if(valueName.validity.patternMismatch){
            valueName.setCustomValidity("Wrong code, please look above for a list of all codes.");
        }else{
            valueName.setCustomValidity("");
        }
    });
</script>

</body>
</html>
