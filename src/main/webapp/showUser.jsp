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
<form action="/user/list" method="get">

    <p>Id <c:out value="${user.id}"/></p>
    <p>Name <c:out value="${user.username}"/></p>
    <p>Email <c:out value="${user.email}"/></p>
    <p>Password <c:out value="${user.password}"/></p>
    <button type="submit">Powrót</button>

</form>

</body>
</html>
