<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Dodaj uzytkownika</title>
</head>
<body>

<h1>Dodaj uzytkownika</h1>
<form action="/user/add" method="post">
Imię:
<input type="text" name="username"/>
Email
<input type="text" name="email"/>
Password
<input type="text" name="password"/>

<button type="submit"> Dodaj</button>


</form>
</body>
</html>
