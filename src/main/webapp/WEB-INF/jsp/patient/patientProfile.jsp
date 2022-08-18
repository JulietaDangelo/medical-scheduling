<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h1>Personal Profile</h1>

<h2>Your Personal Information</h2>


<label for="firstName">First Name:</label>
<input id="firstName" name="firstName" type="text" value="${patient.firstName}">
<label for="lastName">Last Name:</label>
<input id="lastName" name="lastName" type="text" value="${patient.lastName}">
<label for="email">Email:</label>
<input id="email" name="email" type="text" value="${patient.email}">
<label for="age">Age:</label>
<input id="age" name="age" type="number" value="${patient.age}">
<label for="gender">Gender:</label>
<input id="gender" name="gender" type="text" value="${patient.gender}">



<c:import url="/WEB-INF/jsp/common/footer.jsp" />