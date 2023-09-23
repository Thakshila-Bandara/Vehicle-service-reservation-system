<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vehicle Service Reservation</title>
</head>
<body>

  <h1>Vehicle Service Reservation</h1>

  <%-- Display the error message if it exists --%>
  <% if (request.getAttribute("error") != null) { %>
  <div class="error-message" style="color: red;">
      <%= request.getAttribute("error") %><br><br>
  </div>
  <% } %>

  <form action="reservation-servlet" method="post">

      <label for="custname">Customer Name<span style="color: red;" >*</span>:</label>
      <input type="text" name="custname" id="custname" required><br><br>
      <label for="date">Contact no<span style="color: red;" >*</span>:</label>
      <input type="date" name="date" id="date" required min="2023-09-01" max="2023-12-31"><br><br>
      <label for="time">Preferred time<span style="color: red;" >*</span>:</label>
      <select name="time" id="time" required>
          <option value="10.00a.m">10.00 A.M</option>
          <option value="11.00a.m">11.00 A.M</option>
          <option value="12.00p.m">12.00 P.M</option>
      </select><br><br>
      <label for="location">Preferred location<span style="color: red;" >*</span>:</label>
      <select name="location" id="location" required>
          <option value="Gampaha">Gampaha</option>
          <option value="Kalutara">Kalutara</option>
          <option value="Colombo">Colombo</option>
      </select><br><br>
      <label for="regno">Vehicle registration no<span style="color: red;" >*</span>:</label>
      <input type="text" name="regno" id="regno" required><br><br>
      <label for="mileage">Current mileage<span style="color: red;" >*</span>:</label>
      <input type="text" name="mileage" id="mileage" required><br><br>
      <label for="message">Message:</label>
      <textarea name="message" id="message" rows="5" cols="30"></textarea><br><br>
      <input type="submit" value="Reserve">

  </form>
</body>
</html>
