<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h1>${doctor.firstName} ${doctor.lastName}</h1>
<p><strong>Medical Specialty: </strong> ${doctor.medicalSpecialty}</p>
<p><strong>Available Hours: </strong> Monday to Friday, from ${startTime}:00 to ${endTime}:00</p>

<c:url var="goBack" value="/doctor-list/public-profile?id=${doctor.doctorId}"/>
<button type="button" class="btn btn-info button-doctor-list"><a href="${goBack}">Go Back</a></button>

<c:url var="formAction" value="/appointment/doctor/${doctor.doctorId}" />
<form method="POST" action="${formAction}">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="container-appointments">
        <div class="row">
            <div class="col-12">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">Hours</th>
                        <th scope="col">Monday</th>
                        <th scope="col">Tuesday</th>
                        <th scope="col">Wednesday</th>
                        <th scope="col">Thursday</th>
                        <th scope="col">Friday</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach begin="${startTime}" end="${endTime - 1}" var="step">
                        <tr>
                            <td>
                                ${step}:00
                            </td>
                            <td>
                                <div class="custom-control custom-checkbox">
                                    <input type="radio" class="custom-control-input" value="Monday-${step}" name="appOption" >
                                    <label class="custom-control-label" for="monday-${step}">Select Appointment</label>
                                </div>
                            </td>
                            <td>
                                <div class="custom-control custom-checkbox">
                                        <input type="radio" class="custom-control-input " value="Tuesday-${step}" name="appOption" >
                                    <label class="custom-control-label" for="tuesday-${step}">Select Appointment</label>
                                </div>
                            </td>
                            <td>
                                <div class="custom-control custom-checkbox">
                                    <input type="radio" class="custom-control-input" value="Wednesday-${step}" name="appOption" >
                                    <label class="custom-control-label" for="wednesday-${step}">Select Appointment</label>
                                </div>
                            </td>
                            <td>
                                <div class="custom-control custom-checkbox">
                                    <input type="radio" class="custom-control-input" value="Thursday-${step}" name="appOption" >
                                    <label class="custom-control-label" for="thursday-${step}">Select Appointment</label>
                                </div>
                            </td>
                            <td>
                                <div class="custom-control custom-checkbox">
                                    <input type="radio" class="custom-control-input " value="Friday-${step}" name="appOption"  >
                                    <label class="custom-control-label" for="friday-${step}">Select Appointment</label>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <span class="div-button-doctor-list">
                    <button type="submit" class="btn btn-primary">Create an Appointment</button>
                </span>
            </div>
        </div>
    </div>
</form>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />
