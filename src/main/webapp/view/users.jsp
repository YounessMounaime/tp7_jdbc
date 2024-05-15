<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Utilisateurs</title>
</head>
<body>
<h1>Liste des Utilisateurs</h1>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Nom d'utilisateur</th>
        <th>password</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.username}</td>
            <td>${user.id}</td>
            <td>${user.password}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
