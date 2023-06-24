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
    <title>Potwierdz usuwanie</title>
</head>
<body>


        <section class="modal-card-body">
            Are you sure you want to delete
        </section>
        <footer class="modal-card-foot">

            <form>
                <input type="hidden" name="id" value="${id}">
                <button class="button is-small" formaction="/user/delete" formmethod="post" type="submit">Zatwierdz</button>
                <button class="button is-small" formaction="/user/list" formmethod="get" type="submit">Anuluj</button>
            </form>
        </footer>


</body>
</html>
