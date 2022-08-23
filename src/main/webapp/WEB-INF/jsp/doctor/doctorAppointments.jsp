<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h2 class="text-center title-doctor-list">Upcoming Appointments</h2>

<div class="doctor-list-centre">
  <div class="container-upcoming-appointments">

    <c:forEach var="appointment" items="${appointments}">

      <div class="container-upcoming-appointment">
        <p><strong>Day:</strong> ${appointment.key.dayOfWeek}</p>
        <p><strong>Hour:</strong> ${appointment.key.startingTime}</p>
        <p><strong>Patient:</strong> ${appointment.value.firstName} ${appointment.value.lastName}</p>
        <p>
          <c:url var="linkPrescription" value="/doctor/appointments/prescription?id=${appointment.key.patientId}" />
          <a href="${linkPrescription}"><button type="button" class="btn btn-primary">Make prescription</button></a>
          <button class="btn btn-primary" type="button" onclick="toggleContent(this)" aria-expanded="false" aria-controls="collapseExample">
            View patient info
          </button>
        </p>
        <div class="collapse" id="collapseExample">
          <div class="card card-body">
            <p><strong>Age:</strong> ${appointment.value.age}</p>
            <p><strong>Gender:</strong> ${appointment.value.gender}</p>
            <p><strong>Email:</strong> ${appointment.value.email}</p>
          </div>
        </div>
      </div>

    </c:forEach>

  </div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />