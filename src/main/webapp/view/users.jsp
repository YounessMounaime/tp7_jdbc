<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
<table class="table">
<thead class="thead-dark">
<tr>
    <th scope="col">Id</th>
    <th scope="col">Description</th>
    <th scope="col">Quantité</th>
    <th scope="col">Prix</th>
</tr>
</thead>
<tbody>
<c:forEach items="${users}" var="user">
    <tr>
        <th scope="row">${users.username}</th>

    </tr>
</c:forEach>