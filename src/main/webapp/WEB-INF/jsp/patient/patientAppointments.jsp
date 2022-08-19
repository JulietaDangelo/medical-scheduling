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
        <p>Doctor: ${appointment.value.firstName} ${appointment.value.lastName}</p>
      </div>

    </c:forEach>

  </div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />