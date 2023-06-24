<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 24.06.2023
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Show all Users</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
</head>
<body>

<section class="section">
    <div class="container">
        <h1 class="title">
            Lista użytkowników
        </h1>
        <p class="subtitle">
            Możesz dodawać, edytować, oglądać i usuwać!
        </p>
    </div>
</section>
<div class="container">
    <div class="notification is-primary">
        <form>
            <button class="button is-small is-link is-light" formaction=/user/add method="get" type="submit">Dodaj
                uzytkownika
            </button>
        </form>
        <br>
        <table class="table">

            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Password</th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${users}">
                <tr>

                    <td><c:out value="${user.id}"/></td>
                    <td><c:out value="${user.username}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.password}"/></td>
                    <form>
                        <td>
                            <form>
                                <input type="hidden" name="id" value="${user.id}">
                                <button class="button is-small is-text " formaction=/user/edit formmethod="get"
                                        type="submit">Edytuj
                                </button>
                            </form>
                        </td>
                        <td>
                            <button id="deleteButton" class="button is-small is-text"
                                    onclick="confirmAction('${user.id}')">Delete
                            </button>
                                <%--                            <button class="button is-small is-text" formaction=/user/delete formmethod="get" type="submit">Kasuj--%>
                            </button>
                        </td>
                        <td>
                            <form>
                                <input type="hidden" name="id" value="${user.id}">
                                <button class="button is-small is-text" formaction=/user/show formmethod="get"
                                        type="submit">Pokaz
                                    detale
                                </button>
                            </form>
                        </td>
                    </form>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>

</body>
<script>
    function confirmAction(id) {
        let confirmResult = confirm("Czy na pewno usunąć?");
        if (confirmResult) {
            // Create a form element
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = '/user/delete';

            // Create an input element and set its attributes
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'id';
            input.value = id;

            // Append the input element to the form
            form.appendChild(input);

            // Append the form to the document body
            document.body.appendChild(form);

            // Submit the form
            form.submit();
        }
    }
</script>


</html>
