<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h1 class="text-center title-doctor-list">${doctor.firstName} ${doctor.lastName} </h1>

<h2 class="text-center title-doctor-list">Doctor Information</h2>

<div class="table-profile">
    <ul class="list-group">
        <li class="list-group-item"><strong>First Name: </strong> ${doctor.firstName}</li>
        <li class="list-group-item"><strong>Last Name: </strong> ${doctor.lastName}</li>
        <li class="list-group-item"><strong>Email: </strong> ${doctor.email}</li>
        <li class="list-group-item"><strong>Address: </strong> ${doctor.address}</li>
        <li class="list-group-item"><strong>Phone Number: </strong> ${doctor.phoneNumber}</li>
        <li class="list-group-item"><strong>Medical Specialty: </strong> ${doctor.medicalSpecialty}</li>
        <li class="list-group-item"><strong>Hourly Cost: </strong>$ ${doctor.hourCost}</li>
        <li class="list-group-item"><strong>Available Hours: </strong> Monday to Friday, from ${startTime}:00 to ${endTime}:00</li>
    </ul>
</div>

<button type="button" class="btn btn-info button-doctor-list" onclick="history.back()">Go Back</button>

<c:if test="${not empty currentUser && currentUser.isPatient()}">
    <span class="div-button-doctor-list">
        <c:url var="makeAppointment" value="/appointment/doctor?id=${doctor.doctorId}"/>
        <button type="button" class="btn btn-info button-doctor-list"><a href="${makeAppointment}">Make An Appointment</a></button>
    </span>
</c:if>
<c:if test="${empty currentUser}">
    <c:url var="loginHref" value="/login" />
    <button class="nav-item"><a class="btn btn-primary" href="${loginHref}">Log In to book an appointment</a></button>
</c:if>

<div>
    <ul>
        <c:forEach var="review" items="${reviews}">
            <li>
                <h3>${review.title}</h3>
                <div class="rating">
                    <c:forEach begin="1" end="5" var="rating">
                        <span class="${rating<= review.rating? 'filled':'' }">&#9734;</span>
                    </c:forEach>
                </div>
                <p>${review.description}</p>
            </li>
        </c:forEach>
    </ul>
    <c:if test="${not empty currentUser && currentUser.isPatient()}">
    <span class="div-button-doctor-list">
        <c:url var="makeReview" value="/doctor-list/public-profile/review?id=${doctor.doctorId}"/>
        <button type="button" class="btn btn-info button-doctor-list"><a href="${makeReview}">Make a Review</a></button>
    </span>
    </c:if>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />
