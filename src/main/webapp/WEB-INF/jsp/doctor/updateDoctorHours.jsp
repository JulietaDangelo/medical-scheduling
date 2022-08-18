<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 18/8/2022
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h1>Update Available Hours</h1>

<p><strong>Available Hours: </strong> Monday to Friday, from ${availability.startingTime} to ${availability.endingTime}</p>

<c:url var="formAction" value="/users/profile/update"/>
<form method="POST" action="${formAction}" modelAttribute="availability">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="row">
        <div class="col-sm-4">
            <div class="form-group">

                <label for="startingTime">From: </label>

                <input type="time" id="startingTime" name="startingTime"
                       min="09:00" max="18:00" required>
            </div>

            <div class="form-group">

                <label for="endingTime">From: </label>

                <input type="time" id="endingTime" name="endingTime"
                       min="09:00" max="18:00" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Hours</button>
        </div>
    </div>

</form>




<c:import url="/WEB-INF/jsp/common/footer.jsp" />

