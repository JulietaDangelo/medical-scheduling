<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 18/8/2022
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />


<h1>Indicate your available hours from Monday to Friday </h1>

<c:url var="formAction" value="/users/new/doctor/availability"/>
<form method="POST" action="${formAction}" modelAttribute="availability">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <div class="form-group">
                <label path="startingTime">From: </label>
                <select  path="startingTime">
                    <option value="08:00:00">08:00</option>
                    <option value="09:00">09:00</option>
                    <option value="10:00">10:00</option>
                    <option value="11:00">11:00</option>
                    <option value="12:00">12:00</option>
                    <option value="13:00">13:00</option>
                    <option value="14:00">14:00</option>
                    <option value="15:00">15:00</option>
                    <option value="16:00">16:00</option>
                    <option value="17:00">17:00</option>
                    <option value="18:00">18:00</option>
                </select>
            </div>

            <div class="form-group">
                <label path="endingTime">To: </label>
                <select  path="endingTime">
                    <option value="08:00">08:00</option>
                    <option value="09:00">09:00</option>
                    <option value="10:00">10:00</option>
                    <option value="11:00">11:00</option>
                    <option value="12:00">12:00</option>
                    <option value="13:00">13:00</option>
                    <option value="14:00">14:00</option>
                    <option value="15:00">15:00</option>
                    <option value="16:00">16:00</option>
                    <option value="17:00">17:00</option>
                    <option value="18:00:00">18:00</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Update Hours</button>
        </div>
        <div class="col-sm-4"></div>
    </div>
</form>




<c:import url="/WEB-INF/jsp/common/footer.jsp" />
