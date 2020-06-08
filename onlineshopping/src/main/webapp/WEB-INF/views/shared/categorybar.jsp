<h1 class="my-2">MNR  Shop </h1>
<hr>
<div class="list-group shadow-lg p-4 mb-4 bg-white pt-2">

	<c:forEach items="${categories }" var="category">
		<a href="${contextRoot}/show/category/${category.id}/products"
			class="list-group-item  category-item" id="a_${category.name}"> ${category.name}</a>


	</c:forEach>

</div>
