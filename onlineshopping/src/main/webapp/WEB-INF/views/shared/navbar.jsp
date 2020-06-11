<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${contextRoot}/home">Online Shopping
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item" id="home"><a
					class="nav-link category-item" href="${contextRoot}/home">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item" id="about"><a
					class="nav-link category-item" href="${contextRoot}/about">About</a></li>

				<li class="nav-item"><a class="nav-link category-item"
					id="listProducts" href="${contextRoot}/show/all/products">View
						Product</a></li>
				<li class="nav-item"><a class="nav-link category-item"
					id="contact" href="${contextRoot}/contact">Contact</a></li>
				<security:authorize access="hasAuthority('ADMIN')">
					<li class="nav-item"><a class="nav-link category-item"
						id="manageProducts" href="${contextRoot}/manage/products">Manage
							Products</a></li>
				</security:authorize>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<security:authorize access="isAnonymous()">

					<li id="register"><a href="${contextRoot}/register"
						class="nav-link category-item">Sign up</a></li>
					<li id="login"><a href="${contextRoot}/login"
						class="nav-link category-item">Login</a></li>
				</security:authorize>

				<security:authorize access="isAuthenticated()">

					<li class="dropdown border border-dark" id="userCart"><a
						style="background: white;" href="javacript:void(0)"
						class="btn btn-default dropdown-toggle" id="dropdownMeul"
						data-toggle="dropdown"> <span class="caret">${userModel.fullname}</span>

					</a>
						<ul class="dropdown-menu px-3">
							<security:authorize access="hasAuthority('USER')">
								<hr>
								<li><a href="${contextRoot}/cart/show" class="category-item"> <span
										class="glyphicon glyphicon-shopping-cart" style="width:10px; height:10px"> </span> <span
										class="badge display-3">${userModel.cart.cartLines }</span> 
										<span style="font-size:15px">&#2547; -
										${userModel.cart.grandTotal}</span>
								</a></li>
								<hr>
								<li class="divider" role="separator"></li>
							</security:authorize>
							<hr/>
							<li><a href="${contextRoot}/perform-logout" class="category-item">Logout</a></li>
							<hr/>
						</ul></li>
				</security:authorize>
			</ul>
		</div>
	</div>
</nav>

<script>
	window.userRole = '${userModel.role}'
</script>
