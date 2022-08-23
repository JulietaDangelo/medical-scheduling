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
        <c:if test="${appointment.key.confirmed}">
          <p>Status: Confirmed</p>
        </c:if>
        <c:if test="${!appointment.key.confirmed}">
          <p>Status: Canceled</p>
        </c:if>


        <p>
          <button type="button" class="btn btn-primary">Make prescription</button>
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

        <c:if test="${appointment.key.confirmed}">


        <button type="button" class="btn btn-info btn-danger" data-toggle="modal" data-target="#myModal">Cancel Appointment</button>

          <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Cancel Appointment</h4>
            </div>
            <div class="modal-body">
              <p>Do you want to cancel your appointment for ${appointment.key.dayOfWeek} at ${appointment.key.startingTime} for Patient:  ${appointment.value.firstName} ${appointment.value.lastName} ?</p>
            </div>
            <div class="modal-footer">
              <c:url var="deleteAppointment" value="/doctor/appointments?id=${appointment.key.appointmentId}"/>
              <form id="logoutForm" action="${deleteAppointment}" method="POST">
                <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
                <button type="submit" class="btn btn-default" href="#"> Confirm</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Go back</button>
              </form>
            </div>
          </div>
        </div>
          </c:if>
      </div>

    </c:forEach>

  </div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />