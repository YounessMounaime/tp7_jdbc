<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<h1>Ajouter un article</h1>
	<form action="articles.do" method="post">
		<label for="description">Description:</label><br>
		<input type="text" id="description" name="description"><br>
		<label for="quantite">Quantité:</label><br>
		<input type="text" id="quantite" name="quantite"><br>
		<label for="price">Prix:</label><br>
		<input type="text" id="price" name="price"><br>
		<input type="submit" value="Ajouter">
	</form>



	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Description</th>
				<th scope="col">Quantit�</th>
				<th scope="col">Prix</th>
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
                    <a href="articles.do?action=edit&id=${article.id}">Modifier</a>
                    <a href="articles.do?action=delete&id=${article.id}">Supprimer</a>
                </td>
            </tr>
            <c:if test="${param.action == 'edit' && param.id == article.id}">
                <tr>
                    <td colspan="4">
                        <form action="articles.do" method="post">
                            <input type="hidden" name="id" value="${article.id}">
                            <label for="description">Description:</label><br>
                            <input type="text" id="descriptio" name="description" value="${article.description}"><br>
                            <label for="quantite">Quantité:</label><br>
                            <input type="text" id="quantit" name="quantite" value="${article.quantite}"><br>
                            <label for="price">Prix:</label><br>
                            <input type="text" id="pric" name="price" value="${article.price}"><br>
                            <input type="submit" value="Modifier">
                        </form>
                    </td>
                </tr>
            </c:if>
        </c:forEach>

		</tbody>
	</table>
</div>



