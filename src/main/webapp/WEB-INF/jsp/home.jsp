<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<section class="homepage">
    <div class="homepage-text">
        <h1>Welcome to iSchedule</h1>
        <p>The best medical professionals in one place<br>Start now</p>
        <c:url var="doctorList" value="/doctor-list" />
        <c:if test="${!currentUser.isDoctor()}">
            <a href="${doctorList}"><button class="btn btn-primary homepage-button">Find a Doctor</button></a>
        </c:if>
    </div>
</section>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />