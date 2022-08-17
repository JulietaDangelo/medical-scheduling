<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 16/8/2022
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<c:url var="formAction" value="/users/new/patient" />
<form method="POST" action="${formAction}">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <div class="form-group">
                <label for="firstName">First Name: </label>
                <input type="text" id="firstName" name="firstName" placeHolder="First Name" class="form-control" />
            </div>
            <div class="form-group">
                <label for="lastName">Last Name: </label>
                <input type="text" id="lastName" name="lastName" placeHolder="Last Name" class="form-control" />
            </div>
            <div class="form-group">
                <label for="email">Email: </label>
                <input type="text" id="email" name="email" placeHolder="Email" class="form-control" />
            </div>
            <div class="form-group">
                <label for="age">Age: </label>
                <input type="number" id="age" name="age" placeHolder="Age" class="form-control" />
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select name="gender"	id="gender">
                    <option value="Male">Male </option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Create Patient Profile</button>
        </div>
        <div class="col-sm-4"></div>
    </div>
</form>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />

