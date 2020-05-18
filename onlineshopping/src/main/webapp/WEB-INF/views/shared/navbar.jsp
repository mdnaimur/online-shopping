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
				<li class="nav-item" id="home"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item" id="about"><a class="nav-link"
					href="${contextRoot}/about">About</a></li>

				<li class="nav-item"><a class="nav-link" id="listProducts"
					href="${contextRoot}/show/all/products">View Product</a></li>
				<li class="nav-item"><a class="nav-link" id="contact"
					href="${contextRoot}/contact">Contact</a></li>
	<security:authorize access="hasAuthority('ADMIN')">
				<li class="nav-item"><a class="nav-link" id="manageProducts"
					href="${contextRoot}/manage/products">Manage Products</a></li>
					</security:authorize>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<security:authorize access="isAnonymous()">

					<li id="register"><a href="${contextRoot}/register"
						class="nav-link">Sign up</a></li>
					<li id="login"><a href="${contextRoot}/login" class="nav-link">Login</a></li>
				</security:authorize>

				<security:authorize access="isAuthenticated()">

					<li class="dropdown"><a href="javacript:void(0)"
						class="btn btn-default dropdown-toggle" id="dropdownMeul"
						data-toggle="dropdown"> ${userModel.fullname}<span
							class="caret"></span>

					</a>
						<ul class="dropdown-menu">
							<security:authorize access="hasAuthority('USER')">

								<li><a href="${contextRoot}/cart"> <span
										class="glyphicon glyphicon-shopping-cart"> </span> <span
										class="badge">${userModel.cart.cartLines }</span>
										${userModel.cart.grandTotal} /-
								</a></li>

								<li class="divider" role="separator"></li>
							</security:authorize>
							<li><a href="${contextRoot}/perform-logout">Logout</a></li>

						</ul></li>
				</security:authorize>
			</ul>
		</div>
	</div>
</nav>

<script>

window.userRole = '${userModel.role}'

</script>
