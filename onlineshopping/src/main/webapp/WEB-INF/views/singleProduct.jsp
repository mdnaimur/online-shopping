<div class="container">

	<!-- Breadcrumb -->
	<div class="row">

		<div class="col-xs-12">

			<ol class="breadcrumb">

				<li class="breadcrumb-item"><a href="${contextRoot }/home ">Home</a></li>
				<li class="breadcrumb-item"><a href="${contextRoot }/show/all/products ">Products</a></li>
				<li class="active breadcrumb-item">${product.name}</li>

			</ol>

		</div>

	</div>

	<div class="row">
		<!-- Dispay the product image -->

		<div class="col-xs-12 col-sm-4">

			<div class="thumbnail">

				<img src="${images}/${product.code}.jpg" class="img img-responsive" />

			</div>

		</div>
		<!-- Product description -->
		<div class="col-xs-12 col-sm-8">

			<h3>${product.name}</h3>
			<hr />

			<p>${product.description}</p>
			<hr />
			<h4>
				Price <strong>${product.unitPrice } /-</strong>
			</h4>
			<hr />
			<h6>Qty. Available: ${product.quantity}</h6>

			<a href="${contextRoot}/cart/add/${product.id}/product"
				class="btn btn-success"> <span
				class="glyphicon glyphicon-shopping-cart"></span> Add to Cart
			</a> <a href="${contextRoot}/show/all/products" class="btn btn-primary">
				Back </a>
		</div>
	</div>

</div>