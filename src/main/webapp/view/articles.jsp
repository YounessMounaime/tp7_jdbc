<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<h1>Ajouter un article</h1>
	<form action="articles.do" method="post">
		Description: <input type="text" name="description"><br>
		Quantité: <input type="text" name="quantite"><br>
		Prix: <input type="text" name="price"><br>
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
					<a href="editArticle.jsp?id=${article.id}">Modifier</a>
					<a href="articles.do?action=delete&id=${article.id}">Supprimer</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<a href="addArticle.jsp">Ajouter un article</a>

</div>