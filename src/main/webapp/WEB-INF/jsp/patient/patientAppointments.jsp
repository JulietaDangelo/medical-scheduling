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
        <p><strong>Doctor:</strong> ${appointment.value.firstName} ${appointment.value.lastName}</p>
      </div>

    </c:forEach>

  </div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />