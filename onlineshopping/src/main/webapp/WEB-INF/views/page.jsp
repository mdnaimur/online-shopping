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
<meta name="author" content="Md Naimur Rahman">

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>Online Shopping-${title}</title>

<script type="text/javascript">
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}';
</script>

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
	
	
<link href ="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    
<!-- Bootstrap core CSS


<link href="${css}/bootstrap.min.css" rel="stylesheet">
<link href="${css}/bootstrap.flaty.them.css" rel="stylesheet">


<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">
 -->
<!-- Custom styles for this template -->

<link href="${css}/myapp.css" rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico">
</head>
<body>
	<div class="wrapper">
		<!-- Navigation -->
		<%@include file="./shared/navbar.jsp"%>
		<!-- Page Content -->
		<div class="content">
			<!-- loading home content -->
			<c:if test="${userClickHome==true}"><%@include file="home.jsp"%></c:if>


			<!-- loading about content -->
			<c:if test="${userClickAbout==true}"><%@include
					file="about.jsp"%></c:if>

			<!-- loading Contact us content -->
			<c:if test="${userClickContact==true}"><%@include
					file="contact.jsp"%></c:if>


			<!-- loading Contact us content -->
			<c:if
				test="${userClickAllProducts==true or userClickCategoryProducts==true}"><%@include
					file="listProducts.jsp"%></c:if>

			<!-- loading Single Product  -->
			<c:if test="${userClickShowProduct==true}"><%@include
					file="singleProduct.jsp"%></c:if>

			<c:if test="${userClickManageProducts==true}"><%@include
					file="manageProducts.jsp"%></c:if>


			<c:if test="${userClickShowCart==true}"><%@include
					file="cart.jsp"%></c:if>
		</div>
		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>
		<!-- Bootstrap core JavaScript -->
		<script src="${js}/jquery-3.3.1.min.js"></script>

		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
			integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
			crossorigin="anonymous"></script>

		<!--  -->
		<script
			src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
			
			
			<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
			
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
			<script src="https://use.fontawesome.com/518ddb4c0a.js"></script>
		<!--  -
		<script src="${js}/bootstrap.bundle.min.js"></script>
		
		<script src="${js}/jquery.dataTables.js"></script>
		<script src="${js}/dataTables.bootstrap.js"></script>
		<script src="${js}/bootbox.min.js"></script>
		<script src="${js}/jquery.validate.js"></script>
->
		<!-- self coded js -->
		<script src="${js}/myapp.js"></script>
	</div>
</body>
</html>