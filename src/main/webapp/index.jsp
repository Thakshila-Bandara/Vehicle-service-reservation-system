<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Service</title>
</head>
<body>
<h1><%= "Vehicle Service Reservation" %></h1>
<br/>

<% if (request.getAttribute("success") != null) { %>
<div class="success-message" style="color: green;">
    <%= request.getAttribute("success") %><br><br>
</div>
<% } %>

<a href="service-reservation-form.jsp">Reserve a service</a>
</body>
</html>