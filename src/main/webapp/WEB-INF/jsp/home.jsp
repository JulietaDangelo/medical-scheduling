<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<section class="homepage">
    <div class="homepage-text">
        <h1>Welcome to iSchedule</h1>
        <p>The best medical professionals in one place<br>Start now</p>
        <c:url var="doctorList" value="/doctor-list" />
        <c:if test="${!currentUser.isDoctor()}">
            <a href="${doctorList}"><button class="btn btn-primary homepage-button">Find a Doctor</button></a>
        </c:if>
    </div>
</section>

<c:if test="${not empty currentUser && currentUser.isDoctor()}">
    <c:forEach var="appointment" items="${appointments}" begin="1" end="1">

        <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="position: absolute; top:200px; right: 20px;" id="notification">
            <div class="toast-header">
                <strong class="mr-auto">New Appointment!</strong>
                <small>${appointment.key.dayOfWeek}</small>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close" onclick="myFunction()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body">
                You have a new appointment ${appointment.key.dayOfWeek} at ${appointment.key.startingTime}hs.
            </div>
        </div>

    </c:forEach>
</c:if>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />