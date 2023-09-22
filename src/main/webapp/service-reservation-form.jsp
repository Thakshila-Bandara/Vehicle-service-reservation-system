<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vehicle Service Reservation</title>
</head>
<body>

  <h1>Vehicle Service Reservation</h1>
  <form action="reservation.jsp" method="post">

      <label for="name">Name:</label>
      <input type="text" name="name" id="name" required><br><br>
      <label for="email">Email:</label>
      <input type="email" name="email" id="email" required><br><br>
      <label for="contact">Contact no:</label>
      <input type="text" name="contact" id="contact" required><br><br>
      <label for="time">Preferred time:</label>
      <select name="time" id="time" required>
          <option value="10.00a.m">10.00 A.M</option>
          <option value="11.00a.m">11.00 A.M</option>
          <option value="12.00p.m">12.00 P.M</option>
      </select><br><br>
      <label for="location">Preferred location:</label>
      <select name="location" id="location" required>
          <option value="Gampaha">Gampaha</option>
          <option value="Kalutara">Kalutara</option>
          <option value="Colombo">Colombo</option>
      </select><br><br>
      <label for="regno">Vehicle registration no:</label>
      <input type="text" name="regno" id="regno" required><br><br>
      <label for="mileage">Current mileage:</label>
      <input type="text" name="mileage" id="mileage" required><br><br>
      <label for="message">Message:</label>
      <textarea name="message" id="message" rows="5" cols="30"></textarea><br><br>
      <input type="submit" value="Reserve">

  </form>
</body>
</html>
