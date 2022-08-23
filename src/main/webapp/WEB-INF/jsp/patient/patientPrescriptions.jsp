<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h2 class="text-center title-doctor-list">Prescriptions</h2>

<div class="doctor-list-centre">
    <div class="div-complete-doctor-list">

        <c:forEach var="prescription" items="${prescription}">

            <div>
                <p><strong>Prescription name:</strong> ${prescription.key.prescriptionName}</p>
                <p><strong>Cost:</strong> $${prescription.key.cost}</p>
                <p><strong>Doctor name:</strong> ${prescription.value.firstName} ${prescription.value.lastName}</p>
            </div>

        </c:forEach>

    </div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />