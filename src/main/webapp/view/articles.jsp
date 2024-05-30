<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
    <title>Articles</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        h1 {
            margin-bottom: 30px;
        }
        .form-group label {
            font-weight: bold;
        }
        .table {
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 0.5rem;
            overflow: hidden;
        }
        .table thead {
            background-color: #007bff;
            color: white;
        }
        .table tbody tr:nth-child(odd) {
            background-color: #f2f2f2;
        }
        .table tbody tr:nth-child(even) {
            background-color: #e9ecef;
        }
        .table tbody tr:hover {
            background-color: #d1ecf1;
        }
        .modal-header {
            background-color: #007bff;
            color: white;
        }
        .btn-primary {
            background-color: #007bff;
        }
        .btn-info {
            background-color: #17a2b8;
        }
        .btn-danger {
            background-color: #dc3545;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Ajouter un article</h1>
    <form action="articles.do" method="post">
        <div class="form-group">
            <label for="description">Description:</label>
            <input type="text" class="form-control" id="description" name="description" required>
        </div>
        <div class="form-group">
            <label for="quantite">Quantité:</label>
            <input type="number" class="form-control" id="quantite" name="quantite" required>
        </div>
        <div class="form-group">
            <label for="price">Prix:</label>
            <input type="number" step="0.01" class="form-control" id="price" name="price" required>
        </div>
        <button type="submit" class="btn btn-primary">Ajouter</button>
    </form>

    <table class="table table-striped mt-4">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Description</th>
            <th scope="col">Quantité</th>
            <th scope="col">Prix</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${articles}" var="article">
            <tr>
                <td>${article.id}</td>
                <td>${article.description}</td>
                <td>${article.quantite}</td>
                <td>${article.price}</td>
                <td>
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#editModal${article.id}">
                        Modifier
                    </button>
                    <a href="articles.do?action=delete&id=${article.id}" class="btn btn-danger">Supprimer</a>
                </td>
            </tr>
            <!-- Modal de modification pour chaque article -->
            <div class="modal fade" id="editModal${article.id}" tabindex="-1" role="dialog" aria-labelledby="editModalLabel${article.id}" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel${article.id}">Modifier l'article</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="articles.do" method="post">
                                <input type="hidden" name="id" value="${article.id}">
                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <input type="text" class="form-control" id="description" name="description" value="${article.description}" required>
                                </div>
                                <div class="form-group">
                                    <label for="quantite">Quantité:</label>
                                    <input type="number" class="form-control" id="quantite" name="quantite" value="${article.quantite}" required>
                                </div>
                                <div class="form-group">
                                    <label for="price">Prix:</label>
                                    <input type="number" step="0.01" class="form-control" id="price" name="price" value="${article.price}" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Modifier</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

