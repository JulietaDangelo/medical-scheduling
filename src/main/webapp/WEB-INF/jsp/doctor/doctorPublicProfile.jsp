<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 17/8/2022
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h1>${doctor.firstName} ${doctor.lastName} </h1>

<h2>Doctors Information</h2>

<p><strong>First Name: </strong> ${doctor.firstName}</p>
<p><strong>Last Name: </strong> ${doctor.lastName}</p>
<p><strong>Email: </strong> ${doctor.email}</p>
<p><strong>Address: </strong> ${doctor.address}</p>
<p><strong>Phone Number: </strong> ${doctor.phoneNumber}</p>
<p><strong>Medical Specialty: </strong> ${doctor.medicalSpecialty}</p>
<p><strong>Hourly Cost: </strong> $${doctor.hourCost}</p>
<p><strong>Available Hours: </strong> Monday to Friday, from ${availability.startingTime} to ${availability.endingTime}</p>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
