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
		</div>
		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>
		<!-- Bootstrap core JavaScript -->
		<script src="${js}/jquery-3.3.1.min.js"></script>
		<script src="${js}/bootstrap.bundle.min.js"></script>
		<!-- Data Tables plugin -->
		<script src="${js}/jquery.dataTables.js"></script>
		<script src="${js}/dataTables.bootstrap.js"></script>


		<!-- self coded js -->
		<script src="${js}/myapp.js"></script>
	</div>
</body>
</html>