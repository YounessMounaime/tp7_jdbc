<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="common/header.jsp"%>
<html>
<head>
    <title>Liste des Utilisateurs</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
        }
        .container {
            margin-top: 50px;
        }
        h1 {
            margin-bottom: 30px;
            color: #343a40;
        }
        .form-group label {
            font-weight: bold;
            color: #495057;
        }
        .form-control {
            border-radius: 0.25rem;
        }
        .btn-custom {
            background-color: #28a745;
            border-color: #28a745;
            color: white;
        }
        .btn-custom:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .table-custom {
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 0.5rem;
            overflow: hidden;
            color: #495057;
        }
        .table-custom thead {
            background-color: #17a2b8;
            color: white;
        }
        .table-custom tbody tr:nth-child(odd) {
            background-color: #e9ecef;
        }
        .table-custom tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        .table-custom tbody tr:hover {
            background-color: #d1ecf1;
        }
        .modal-header {
            background-color: #17a2b8;
            color: white;
        }
        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }
        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Ajouter un utilisateur</h1>
    <form action="user.do" method="post" class="mb-4">
        <input type="hidden" name="action" value="add">
        <div class="form-group">
            <label for="username">Nom d'utilisateur:</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Mot de passe:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-custom">Ajouter</button>
    </form>

    <h1>Liste des Utilisateurs</h1>
    <table class="table table-hover table-custom">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nom d'utilisateur</th>
            <th>Mot de passe</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>
                    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updatePasswordModal${user.id}">
                        Modifier mot de passe
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="updatePasswordModal${user.id}" tabindex="-1" role="dialog" aria-labelledby="updatePasswordModalLabel${user.id}" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="updatePasswordModalLabel${user.id}">Modifier le mot de passe</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="user.do" method="post">
                                        <input type="hidden" name="action" value="updatePassword">
                                        <input type="hidden" name="id" value="${user.id}">
                                        <div class="form-group">
                                            <label for="newPassword">Nouveau mot de passe:</label>
                                            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                                        </div>
                                        <button type="submit" class="btn btn-custom">Enregistrer</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
<%@include file="common/footer.jsp"%>
