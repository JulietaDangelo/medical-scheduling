<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h2>Make a review for ${doctor.firstName} ${doctor.lastName}</h2>

<button type="button" class="btn btn-outline-primary me-2 button-doctor-list" onclick="history.back()">Go Back</button>

<c:url var="formAction" value="/doctor-list/public-profile/review?id=${doctor.doctorId}" />
<form:form method="POST" action="${formAction}" modelAttribute="review">

    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">

            <div class="form-group">
                <form:label path="title">Title: </form:label>
                <form:input path="title" cssClass="form-control" maxlength="50" />
                <form:errors path="title" cssClass="error" />
                <label id="reviewTitleFilledError" class="error">The title is required.</label>
            </div>

            <div class="form-group">
                <form:label path="description">Description: </form:label>
                <form:textarea path="description" cssClass="form-control" maxlength="100" />
                <form:errors path="description" cssClass="error" />
                <label id="reviewDescriptionFilledError" class="error">The description is required.</label>
            </div>

            <div class="form-group">
                <form:label path="rating">Rating: </form:label>
                <form:input path="rating" cssClass="form-control" min="0" max="5" />
                <form:errors path="rating" cssClass="error" />
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        <div class="col-sm-4"></div>
    </div>
</form:form>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />