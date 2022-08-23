<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>iSchedule | Medical Appointments</title>
<link rel="icon" type="favicon" href="https://img.favpng.com/21/21/14/computer-icons-royalty-free-clip-art-png-favpng-tJrUW2TtD8vR3HeBAgCDdLpPz.jpg">
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
	<nav class="d-flex flex-wrap align-items-center justify-content-md-between py-3 border-bottom">
		<c:url var="homePageHref" value="/" />
		<a href="${homePageHref}">
			<c:url var="imgSrc" value="/img/logo.png" />
			<img src="${imgSrc}" class="img-fluid" style="height: 100px;" />
		</a>
		<div class="d-flex align-items-center justify-content-md-between">
			<c:url var="home" value="/" />
			<c:url var="doctorProfile" value="/doctor/profile" />
			<c:url var="patientProfile" value="/patient/profile" />
			<c:url var="doctorList" value="/doctor-list" />
			<c:url var="doctorAppointments" value="/doctor/appointments" />
			<c:url var="patientAppointments" value="/patient/appointments" />
			<c:url var="reviews" value="/doctor/reviews" />
			<c:url var="patientPrescriptions" value="/patient/prescriptions" />

			<ul class="nav justify-content-center d-flex flex-nwrap">
				<c:if test="${not empty currentUser && currentUser.isDoctor()}">
					<li class="nav-item"><a class="nav-link px-2 link-secondary text-nowrap" href="${doctorAppointments}">Appointments</a></li>
					<li class="nav-item"><a class="nav-link px-2 link-secondary text-nowrap" href="${reviews}">Reviews</a></li>
					<li class="nav-item"><a class="nav-link px-2 link-secondary text-nowrap" href="${doctorProfile}">My profile</a></li>
				</c:if>

				<c:if test="${not empty currentUser && currentUser.isPatient()}">
					<li class="nav-item"><a class="nav-link px-2 link-secondary text-nowrap" href="${doctorList}">Doctors List</a></li>
					<li class="nav-item"><a class="nav-link px-2 link-secondary text-nowrap" href="${patientAppointments}">Appointments</a></li>
					<li class="nav-item"><a class="nav-link px-2 link-secondary text-nowrap" href="${patientPrescriptions}">Prescriptions</a></li>
					<li class="nav-item"><a class="nav-link px-2 link-secondary text-nowrap" href="${patientProfile}">My profile</a></li>
				</c:if>

				<c:if test="${empty currentUser}">
					<li class="nav-item"><a class="nav-link px-2 link-secondary text-nowrap" href="${doctorList}">Doctors List</a></li>
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
	<div class="container">