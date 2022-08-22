<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />


<h4 class="text-center">Indicate your available hours from Monday to Friday </h4>

<p class="text-center">Appointments can only be scheduled on the hour (e.g. 10am)</p>

<div class="div-doctor-hours">
    <c:url var="formAction" value="/users/new/doctor/availability"/>
    <form method="POST" action="${formAction}" modelAttribute="availability" class="form-doctor-hour">
        <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label for="startingTime">From: </label>
                    <input type="time" id="startingTime" name="startingTime"
                           min="09:00" max="18:00" required>
                </div>
                <div class="form-group">
                    <label for="endingTime">To: </label>
                    <input type="time" id="endingTime" name="endingTime"
                           min="09:00" max="18:00" required>
                </div>
                <button type="submit" class="btn btn-primary button-doctor-hour">Update Hours</button>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </form>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />
