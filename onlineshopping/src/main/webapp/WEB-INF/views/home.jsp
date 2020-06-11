<!-- DataTable Bootstrap Script -->
<script src="${js}/angular.js"></script>

<!-- DataTable Bootstrap Script -->
<script src="${js}/productsController.js"></script>
<div class="container" ng-app="ShoppingApp"
	ng-controller="ProductController as pCtrl">

	<div class="row" ng-init="pCtrl.fetchProducts()">

		<div class="col-md-3">
			<%@include file="./shared/categorybar.jsp"%>
		</div>

		<div class="col-lg-9">

			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="7"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="${images}/banner1.jpg"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="${images}/banner2.jpg"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="${images}/banner3.jpg"
							alt="Third slide">
					</div>
						<div class="carousel-item">
						<img class="d-block img-fluid" src="${images}/banner4.jpg"
							alt="Third slide">
					</div>
						<div class="carousel-item">
						<img class="d-block img-fluid" src="${images}/banner5.jpg"
							alt="Third slide">
					</div>
						<div class="carousel-item">
						<img class="d-block img-fluid" src="${images}/banner6.jpg"
							alt="Third slide">
					</div>
						<div class="carousel-item">
						<img class="d-block img-fluid" src="${images}/banner7.jpg"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>


			<div class="row">
				<div class="col-xs-12">
					<h3>Our Most Viewed Products</h3>
					<hr />
				</div>
			</div>

			<div class="row is-table-row">

				<div class="col-sm-4" ng-repeat="product in pCtrl.mvProducts">
					<div class="thumbnail">
						<img ng-src="${images}/{{product.code}}.jpg"
							alt="{{product.name}}" class="landingImg">
						<h6 class="shadow p-4 mb-4 bg-white">{{product.name}}</h6>
						<hr />
						<div class="caption">
							<h4 class="pull-right">&#2547;{{product.unitPrice}}</h4>
							<p
								style="width: 150px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">{{product.description}}</p>
							<a ng-href="${contextRoot}/show/{{product.id}}/product"
								class="btn btn-primary pull-right">View</a>
						</div>
					</div>

				</div>

				<div class="col-sm-4 col-lg-4 col-md-4">
					<h4>Checkout more products!</h4>
					<hr />
					<a class="btn btn-primary" href="${contextRoot}/show/all/products">More
						Products</a>
				</div>

			</div>

			<div class="row">
				<div class="col-xs-12">
					<h3>Our Most Purchased Products</h3>
					<hr />
				</div>
			</div>
			<div class="row is-table-row">

				<div class="col-sm-4" ng-repeat="product in pCtrl.mpProducts">
					<div class="thumbnail">
						<img ng-src="${images}/{{product.code}}.jpg"
							alt="{{product.name}}" class="landingImg">
						<h6  class="shadow p-4 mb-4 bg-white">{{product.name}}</h6>
						<hr />
						<div class="caption">
							<h4 class="pull-right">&#2547; {{product.unitPrice}}</h4>
							<p style="width: 150px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">{{product.description}}</p>
							<a ng-href="${contextRoot}/show/{{product.id}}/product"
								class="btn btn-primary pull-right">View</a>
						</div>
					</div>
				</div>

				<div class="col-sm-4 col-lg-4 col-md-4">
					<h4>Checkout more products!</h4>
					<hr />
					<a class="btn btn-primary" href="${contextRoot}/show/all/products">More
						Products</a>
				</div>

			</div>

		</div>

	</div>

</div>
<!-- /.container -->
