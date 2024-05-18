<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Articles</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Ajouter un article</h1>
    <form action="articles.do" method="post">
        <div class="form-group">
            <label for="description">Description:</label>
            <input type="text" class="form-control" id="description" name="description">
        </div>
        <div class="form-group">
            <label for="quantite">Quantité:</label>
            <input type="text" class="form-control" id="quantite" name="quantite">
        </div>
        <div class="form-group">
            <label for="price">Prix:</label>
            <input type="text" class="form-control" id="price" name="price">
        </div>
        <button type="submit" class="btn btn-primary">Ajouter</button>
    </form>

    <table class="table">
        <thead class="thead-dark">
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
            <div class="modal fade" id="editModal${article.id}" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Modifier l'article</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="articles.do" method="post">
                                <input type="hidden" name="id" value="${article.id}">
                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <input type="text" class="form-control" id="description" name="description" value="${article.description}">
                                </div>
                                <div class="form-group">
                                    <label for="quantite">Quantité:</label>
                                    <input type="text" class="form-control" id="quantite" name="quantite" value="${article.quantite}">
                                </div>
                                <div class="form-group">
                                    <label for="price">Prix:</label>
                                    <input type="text" class="form-control" id="price" name="price" value="${article.price}">
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
