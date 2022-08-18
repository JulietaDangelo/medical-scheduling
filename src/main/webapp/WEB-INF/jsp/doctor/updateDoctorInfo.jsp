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

<h1>Update Personal Information</h1>

<c:url var="formAction" value="/users/update/doctor" />
<form method="POST" action="${formAction}">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <div class="form-group">
                <label for="email">Email: </label>
                <input type="text" id="email" name="email" placeHolder="Email" class="form-control" />
            </div>
            <div class="form-group">
                <label for="address">Address: </label>
                <input type="text" id="address" name="address" placeHolder="Address" class="form-control" />
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number: </label>
                <input type="number" id="phoneNumber" name="phoneNumber" placeHolder="Phone Number" class="form-control" />
            </div>
            <div class="form-group">
                <label for="medicalSpecialty">Medical Specialty:</label>
                <select name="medicalSpecialty"	id="medicalSpecialty">
                    <c:forEach var="specialty" items="${specialtyList}">
                        <c:if test="${!specialty.equals('All')}">
                            <option value="${specialty}">${specialty} </option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="hourCost">Cost Per Hour: </label>
                <input type="number" id="hourCost" name="hourCost" placeHolder="Cost Per Hour" class="form-control" />
            </div>

            <button type="submit" class="btn btn-primary">Update Profile</button>
        </div>
        <div class="col-sm-4"></div>
    </div>
</form>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />