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
<form action="/user/edit" method="post">

    <p>Id <c:out value="${user.id}"/></p>
    <input value="${user.id}" name="id" type="text" readonly/><br>
    <p>Name <c:out value="${user.username}"/></p>

    <input value="${user.username}" name="username" type="text"/><br>
    <p>Email <c:out value="${user.email}"/></p>

    <input value="${user.email}" name="email" type="text"/><br>
    <p>Password <c:out value="${user.password}"/></p>

    <input value="${user.password}" name="password" type="text"/><br>
    <button type="submit">Zatwierdz</button>

</form>

</body>
</html>
