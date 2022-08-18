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



<c:import url="/WEB-INF/jsp/common/footer.jsp" />

