<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Online Shopping-${title}</title>

<script type="text/javascript">
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}';
</script>
<!-- Bootstrap core CSS -->






<link href="${css}/bootstrap.min.css" rel="stylesheet">


<link href="${css}/bootstrap.flaty.them.css" rel="stylesheet">
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico">
</head>
<body>
	<div class="wrapper">
		<!-- Navigation -->

		<nav class="navbar navbar-inverse navbar-fixed-tp" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="${contextRoot}/home">Home</a>
				</div>
			</div>

		</nav>
		<!-- Page Content -->

		<div class="content">

			<div class="container">

				<c:if test="${not empty message}">
					<div class="row">
						<div class="col-xs-8 col-md-4 mx-auto -cente">
							<div class="alert alert-danger ">${message}</div>
						</div>
					</div>
				</c:if>

				<c:if test="${not empty logout}">
					<div class="row">
						<div class="col-xs-8 col-md-offset-2 col-md-4 mx-auto ">
							<div class="alert alert-success">${logout}</div>
						</div>
					</div>
				</c:if>

				<div class="row">

					<div class="col-md-offset-3 col-md-6 mx-auto">

						<div class="panel panel-primary">

							<div class="panel-heading">
								<h4>Login</h4>
							</div>

							<div class="panel-body">
								<form action="${contextRoot}/login" method="POST"
									class="form-horizontal" id="loginForm">
									<div class="form-group">
										<label for="username" class="col-md-4 control-label">Email:
										</label>
										<div class="col-md-8">
											<input type="text" name="username" id="username"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="col-md-4 control-label">Password:
										</label>
										<div class="col-md-8">
											<input type="password" name="password" id="password"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-4 col-md-8">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" /> <input type="submit"
												value="Login" class="btn btn-primary" />
										</div>
									</div>
								</form>

							</div>
							<div class="panel-footer">
								<div class="text-center">
									New User - <a class="text-white" href="${contextRoot}/register">Register Here</a>
								</div>
							</div>

						</div>

					</div>

				</div>

			</div>




			<!-- Bootstrap core JavaScript -->
			<script src="${js}/jquery-3.3.1.min.js"></script>


			<script
				src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>

			<script src="${js}/bootstrap.bundle.min.js"></script>

			<script src="${js}/jquery.validate.js"></script>

			<!-- self coded js -->
			<script src="${js}/myapp.js"></script>
		</div>
</body>
</html>