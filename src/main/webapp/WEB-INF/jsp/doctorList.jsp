<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<h2 class="text-center title-doctor-list">Doctor List</h2>

<div class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
        Filter by speciality
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
        <c:forEach var="specialty" items="${specialtyList}">
            <c:url var="medicalSpecialtyUrl" value="/doctor-list"> <c:param name="specialty" value="${specialty}" /></c:url>
            <li><a href="${medicalSpecialtyUrl}">${specialty}</a></li>
        </c:forEach>
    </ul>
</div>


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

