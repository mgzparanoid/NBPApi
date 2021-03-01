<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Index</title>
</head>
<body>
<%@include file="parts/header.jsp" %>
<h2>This is a simple currency counter application, to go to the counter click on the middle button in the menu.</h2>
<h3>Enjoy your stay.</h3>

<h3>
    List of currency names in Polish:
    <br>
    <c:forEach items="${rateDtoList}" var="rateDtoList">
        <tr>
            <td>
                <b>Name: </b> ${rateDtoList.currency}
                <br>
            </td>
        </tr>
    </c:forEach>
</h3>
<%@include file="parts/footer.jsp" %>
</body>
</html>