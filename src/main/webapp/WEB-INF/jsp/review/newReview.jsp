<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h1>${doctor.firstName} ${doctor.lastName}</h1>

<button type="button" class="btn btn-info button-doctor-list" onclick="history.back()">Go Back</button>

<c:url var="formAction" value="/doctor-list/public-profile/review?id=${doctor.doctorId}" />
<form method="POST" action="${formAction}">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">

            <div class="form-group">
                <label for="title">Title: </label>
                <input type="text" id="title" name="title" class="form-control" maxlength="50" />
            </div>

            <div class="form-group">
                <label for="description">Description: </label>
                <textarea id="description" name="description" class="form-control" maxlength="100"></textarea>
            </div>

            <div class="form-group">
                <label for="rating">Rating: </label>
                <input type="number" id="rating" name="rating" min="0" max="5" class="form-control" />
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        <div class="col-sm-4"></div>
    </div>
</form>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />