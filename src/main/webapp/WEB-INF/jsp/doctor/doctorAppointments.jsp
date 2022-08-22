<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h2 class="text-center title-doctor-list">Upcoming Appointments</h2>

<div class="doctor-list-centre">
  <div class="div-complete-doctor-list">

    <c:forEach var="appointment" items="${appointments}">

      <div>
        <p>Day: ${appointment.key.dayOfWeek}</p>
        <p>Hour: ${appointment.key.startingTime}</p>
        <p>Patient: ${appointment.value.firstName} ${appointment.value.lastName}</p>
        <p>
          <c:url var="linkPrescription" value="/doctor/appointments/prescription?id=${appointment.key.patientId}" />
          <a href="${linkPrescription}"><button type="button" class="btn btn-primary">Make prescription</button></a>
          <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            View patient info
          </button>
        </p>
        <div class="collapse" id="collapseExample">
          <div class="card card-body">
            <div><strong>Age:</strong> ${appointment.value.age}</div>
            <div><strong>Gender:</strong> ${appointment.value.gender}</div>
            <div><strong>Email:</strong> ${appointment.value.email}</div>
          </div>
        </div>
      </div>

    </c:forEach>

  </div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />