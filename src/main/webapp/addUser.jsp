<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dodaj użytkownika</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
</head>
<body>
<section class="section">
    <div class="container">
        <h1 class="title">
            Dodaj użytkownika
        </h1>
        <p class="subtitle">
            Możesz dodawać, edytować, oglądać i usuwać!
        </p></div>
</section>
<div class="container">
    <div class="notification is-primary">

        <form>
            <button class="button is-small is-link is-light" type="submit" formaction="/user/list" method="post">
                Powrót
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
            <tr>
                <form>
                    <td></td>
                    <td><input type="text" name="username"/></td>
                    <td><input type="text" name="email"/></td>
                    <td><input type="text" name="password"/></td>

                    <td>
                        <button class="button is-small is-text" type="submit" formaction="/user/add" formmethod="post">
                            Dodaj
                        </button>
                    </td>
                    <td></td>
                    <td></td>

                </form>
            </tr>
            </tbody>
        </table>


    </div>
</div>
</body>
</html>
</html>
