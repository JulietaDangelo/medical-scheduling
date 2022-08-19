<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 18/8/2022
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h1>${doctor.firstName} ${doctor.lastName}</h1>
<p><strong>Medical Specialty: </strong> ${doctor.medicalSpecialty}</p>
<p><strong>Available Hours: </strong> Monday to Friday, from ${startTime}:00 to ${endTime}:00</p>

<c:url var="goBack" value="/doctor-list/public-profile?id=${doctor.doctorId}"/>
<button type="button" class="btn btn-info button-doctor-list"><a href="${goBack}">Go Back</a></button>

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
                                <input type="radio" class="custom-control-input " id="customCheck" name="appOption" >
                                <label class="custom-control-label" for="customCheck">Select Appointment</label>
                            </div>
                        </td>
                        <td>
                            <div class="custom-control custom-checkbox">
                                <input type="radio" class="custom-control-input " id="customCheck11" name="appOption" >
                                <label class="custom-control-label" for="customCheck11">Select Appointment</label>
                            </div>
                        </td>
                        <td>
                            <div class="custom-control custom-checkbox">
                                <input type="radio" class="custom-control-input" id="customCheck12" name="appOption" >
                                <label class="custom-control-label" for="customCheck12">Select Appointment</label>
                            </div>
                        </td>
                        <td>
                            <div class="custom-control custom-checkbox">
                                <input type="radio" class="custom-control-input" id="customCheck13" name="appOption" >
                                <label class="custom-control-label" for="customCheck13">Select Appointment</label>
                            </div>
                        </td>
                        <td>
                            <div class="custom-control custom-checkbox">
                                <input type="radio" class="custom-control-input " id="customCheck14" name="appOption"  >
                                <label class="custom-control-label" for="customCheck14">Select Appointment</label>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
