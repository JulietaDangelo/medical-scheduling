<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Critter</title>
<c:url var="bootstrapCss" value="/css/bootstrap.min.css" />
<c:url var="siteCss" value="/css/site.css" />

<c:url var="jQueryJs" value="/js/jquery.min.js" />
<c:url var="jqValidateJs" value="/js/jquery.validate.min.js" />
<c:url var="jqvAddMethJs" value="/js/additional-methods.min.js" />
<c:url var="jqTimeagoJs" value="/js/jquery.timeago.js" />
<c:url var="popperJs" value="/js/popper.min.js" />
<c:url var="bootstrapJs" value="/js/bootstrap.min.js" />


<link rel="stylesheet" type="text/css" href="${bootstrapCss}">
<link rel="stylesheet" type="text/css" href="${siteCss}">

<script src="${jQueryJs}"></script>
<script src="${jqValidateJs}"></script>
<script src="${jqvAddMethJs}"></script>
<script src="${jqTimeagoJs}"></script>
<script src="${popperJs}"></script>
<script src="${bootstrapJs}"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("time.timeago").timeago();

		$("#logoutLink").click(function(event) {
			$("#logoutForm").submit();
		});

		var pathname = window.location.pathname;
		$("nav a[href='" + pathname + "']").parent().addClass("active");

	});
</script>

</head>
<body>
	<nav class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		<c:url var="homePageHref" value="/" />
		<a class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none" href="${homePageHref}">
			<c:url var="imgSrc" value="/img/logo.png" />
			<img src="${imgSrc}" class="img-fluid" style="height: 100px;" />
		</a>
		<div class="d-flex align-items-center justify-content-md-between">
			<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<c:if test="${not empty currentUser && currentUserRole == 'doctor'}">
					<c:url var="link1" value="/" />
					<li class="nav-item"><a class="nav-link px-2 link-secondary" href="${link1}">Appointments</a></li>
					<c:url var="link2" value="/" />
					<li class="nav-item"><a class="nav-link px-2 link-secondary" href="${link2}">Reviews</a></li>
					<c:url var="link3" value="/" />
					<li class="nav-item"><a class="nav-link px-2 link-secondary" href="${link3}">Edit Office Hours</a></li>
					<c:url var="link4" value="/" />
					<li class="nav-item"><a class="nav-link px-2 link-secondary" href="${link4}">My profile</a></li>
				</c:if>
				<c:if test="${not empty currentUser && currentUserRole == 'patient'}">
					<c:url var="link1" value="/" />
					<li class="nav-item"><a class="nav-link px-2 link-secondary" href="${link1}">Doctors List</a></li>
					<c:url var="link2" value="/" />
					<li class="nav-item"><a class="nav-link px-2 link-secondary" href="${link2}">Appointments</a></li>
					<c:url var="link3" value="/" />
					<li class="nav-item"><a class="nav-link px-2 link-secondary" href="${link3}">My profile</a></li>
				</c:if>
				<c:if test="${empty currentUser}">
					<c:url var="link1" value="/" />
					<li class="nav-item"><a class="nav-link px-2 link-secondary" href="${link1}">Doctors List</a></li>
				</c:if>
			</ul>

			<ul class="col-md-3 text-end">
				<c:choose>
					<c:when test="${empty currentUser}">
						<c:url var="newUserHref" value="/users/new" />
						<li class="nav-item"><a class="btn btn-outline-primary me-2" href="${newUserHref}">Sign Up</a></li>
						<c:url var="loginHref" value="/login" />
						<li class="nav-item"><a class="btn btn-primary" href="${loginHref}">Log In</a></li>
					</c:when>
					<c:otherwise>
						<c:url var="logoutAction" value="/logout" />
						<form id="logoutForm" action="${logoutAction}" method="POST">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
						</form>
						<li class="nav-item"><a class="btn btn-outline-primary me-2" id="logoutLink" href="#">Log Out</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
<<<<<<< HEAD

	<c:if test="${not empty currentUser}">
		<p id="currentUser">Current User: ${currentUser}</p>
	</c:if>
	<div>
=======
	<div class="container">
>>>>>>> juliana
