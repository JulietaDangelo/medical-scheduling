<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h1>${doctor.firstName} ${doctor.lastName}</h1>
<p><strong>Medical Specialty: </strong> ${doctor.medicalSpecialty}</p>
<p><strong>Available Hours: </strong> Monday to Friday, from ${startTime}:00 to ${endTime}:00</p>

<button type="button" class="btn btn-info button-doctor-list" onclick="history.back()">Go Back</button>

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
c                        <th scope="col">Friday</th>
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
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Make appointment</button>
                </span>
                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Confirm appointment</h4>
                            </div>
                            <div class="modal-body">
                                <p>Do you want to confirm your appointment with ${doctor.firstName} ${doctor.lastName}?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-default">Confirm</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Go back</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />
