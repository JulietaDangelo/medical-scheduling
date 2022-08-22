<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h2 class="text-center title-doctor-list">Your Reviews</h2>

<div class="doctor-list-centre">
    <div class="div-complete-doctor-list">

        <c:forEach var="review" items="${reviews}">

            <div class="list-group w-50 p-3 div-doctor-list">
                <h3>${review.title}</h3>
                <div class="rating">
                    <c:forEach begin="1" end="5" var="rating">
                        <span class="${rating<= review.rating? 'filled':'' }">&#9734;</span>
                    </c:forEach>
                </div>
                <p>${review.description}</p>
            </div>

        </c:forEach>

    </div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />