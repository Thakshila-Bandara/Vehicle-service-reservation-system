<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Vehicle Service Reservation</title>
    <link rel="stylesheet" href="css/service-reservation-form.css" type="text/css">
</head>
<body>
<div class="body__container">
  <h1>Vehicle Service Reservation</h1>

  <%
      String userName = (String) session.getAttribute("userName");
      out.println("Hello " + userName + "!");
      out.println("Make a Reservation. <br><br>");
  %>

  <%-- Display the error message if it exists --%>
  <% if (request.getAttribute("error") != null) { %>
  <div class="error-message" style="color: red;">
      <%= request.getAttribute("error") %><br><br>
  </div>
  <% } %>
</div>
  <form action="reservation-servlet" method="post">

      <label for="date">Date<span style="color: red;" >*</span>:</label>
      <input type="date" name="date" id="date" required min="2023-09-01" max="2023-12-31"><br><br>
      <label for="time">Preferred time<span style="color: red;" >*</span>:</label>
      <select name="time" id="time" required>
          <option value="" disabled selected>Select a time</option>
          <option value="10:00:00">10 A.M</option>
          <option value="11:00:00">11 A.M</option>
          <option value="12:00:00">12 P.M</option>
      </select><br><br>
      <label for="location">Preferred location<span style="color: red;" >*</span>:</label>
      <select name="location" id="location" required>
          <option value="" disabled selected>Select a location</option>
          <option value="Gampaha">Gampaha</option>
          <option value="Kalutara">Kalutara</option>
          <option value="Colombo">Colombo</option>
          <option value="Kandy">Kandy</option>
          <option value="Kurunegala">Kurunegala</option>
          <option value="Galle">Galle</option>
      </select><br><br>
      <label for="regno">Vehicle registration no<span style="color: red;" >*</span>:</label>
      <input type="text" name="regno" id="regno" required><br><br>
      <label for="mileage">Current mileage(12xxx)<span style="color: red;" >*</span>:</label>
      <input type="text" name="mileage" id="mileage" required><br><br>
      <label for="message">Message:</label>
      <textarea name="message" id="message" rows="5" cols="30"></textarea><br><br>
      <input type="submit" value="Reserve">

  </form> <br><br>
<div class="body__container__a" style="display: ">
<a href="home.jsp">Back to home</a> <br><br>
  <a href="logout?SAML2.HTTPBinding=HTTP-POST">Logout</a>
</div>
</body>
</html>
