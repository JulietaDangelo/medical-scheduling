<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h2 class="text-center title-doctor-list">Doctor List</h2>


<div class="div-complete-doctor-list">
<c:forEach var="doctor" items="${doctors}">

  <div class="list-group w-50 p-3 div-doctor-list">
    <a href="#" class="list-group-item list-group-item-action align-items-start">
      <div class="">
        <h3 class="mb-1">${doctor.firstName} ${doctor.lastName}</h3>
          <h4 class="card-subtitle mb-2 text-muted">| ${doctor.medicalSpecialty}</h4>
      </div>
      <div class="doctor-data">
          <div class="doctor-data-info"><div>Address:</div> ${doctor.address}</div>
          <div class="doctor-data-info"><div>Phone number:</div> ${doctor.phoneNumber}</div>
          <div class="doctor-data-info"><div>Hourly rate:</div> $${doctor.hourCost}</div>
          <div class="doctor-data-info"><div>Rating:</div></div>
      </div>
      <button type="button" class="btn btn-info btn-sm button-doctor-list">See Profile</button>
    </a>
  </div>


</c:forEach>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />

<%--
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action align-items-start">
    <div class="">
      <h3 class="mb-1">${doctor.firstName} ${doctor.lastName}  |  ${doctor.medicalSpecialty}</h3>
    </div>
    <p class="mb-1">Address: ${doctor.address}</p>
    <p class="mb-1">Phone number: ${doctor.phoneNumber}</p>
    <p class="mb-1">Hourly rate: $${doctor.hourCost}</p>
    <p class="mb-1">Rating: </p>
    <button type="button" class="btn btn-info btn-sm">See Profile</button>
  </a>
</div>--%>
