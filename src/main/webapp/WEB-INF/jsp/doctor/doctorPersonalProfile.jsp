<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 17/8/2022
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h1 class="text-center title-doctor-list">Personal Profile</h1>

<h2 class="text-center title-doctor-list">Your Personal Information</h2>

<div class="table-profile">
    <ul class="list-group">
        <li class="list-group-item"><strong>First Name: </strong> ${doctor.firstName}</li>
        <li class="list-group-item"><strong>Last Name: </strong> ${doctor.lastName}</li>
        <li class="list-group-item"><strong>Email: </strong> ${doctor.email}</li>
        <li class="list-group-item"><strong>Address: </strong> ${doctor.address}</li>
        <li class="list-group-item"><strong>Phone Number: </strong> ${doctor.phoneNumber}</li>
        <li class="list-group-item"><strong>Medical Specialty: </strong> ${doctor.medicalSpecialty}</li>
        <li class="list-group-item"><strong>Hourly Cost: </strong>$ ${doctor.hourCost}</li>
    </ul>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
