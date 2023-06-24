<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 24.06.2023
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<form action=/user/add method="get">
    <button type="submit">Dodaj uzytkownika</button>
</form>

<c:forEach var="user" items="${users}">
    <p>Id <c:out value="${user.id}"/></p>
    <p>Name <c:out value="${user.username}"/></p>
    <p>Email <c:out value="${user.email}"/></p>
    <p>Password <c:out value="${user.password}"/></p>
    <form action=/user/edit  method="get">
        <input type="hidden" name="id" value="${user.id}">
        <button type="submit">Edytuj</button>
    </form>
    <form action=/user/delete  method="get">
        <input type="hidden" name="id" value="${user.id}">
        <button type="submit">Kasuj</button>
    </form>
    <form action=/user/show  method="get">
        <input type="hidden" name="id" value="${user.id}">
        <button type="submit">Pokaz detale</button>
    </form>

</c:forEach>

</body>
</html>
