<%@ page import="java.sql.Connection" %>
<%@ page import="com.vehicleservice.vehicleservicereservationapp.db.DBConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Upcoming Reservations</title>
</head>
<body>

<h1>Delete Upcoming Reservations</h1>

<%-- Display the error message if it exists --%>
<% if (request.getAttribute("error") != null) { %>
<div class="error-message" style="color: red;">
    <%= request.getAttribute("error") %><br><br>
</div>
<% } %>

<%-- Display the success message--%>
<% if (request.getAttribute("success") != null) { %>
<div class="error-message" style="color: green;">
    <%= request.getAttribute("success") %><br><br>
</div>
<% } %>

<%
    Connection connection = DBConnection.getConnection();
    String userName = (String) session.getAttribute("userName");

    if(userName != null && connection != null){

        try{
            String sql = "SELECT * FROM vehicle_service WHERE username = ? AND date >= CURDATE()";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, userName);
            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next() == false){
                out.println("<h3>You have no upcoming reservations.</h3>");
            }else{

                %>
                    <table border="1">

                        <tr>
                            <th>Vehicle owner</th>
                            <th>Booking id</th>
                            <th>Booking Date</th>
                            <th>Booking time</th>
                            <th>Service location</th>
                            <th>Vehicle number</th>
                            <th>Mileage</th>
                            <th>Delete reservation</th>
                        </tr>
                        <%
                            do{%>
                        <tr>
                            <td><%=resultSet.getString(8)%></td>
                            <td><%=resultSet.getString(1)%></td>
                            <td><%=resultSet.getString(2)%></td>
                            <td><%=resultSet.getString(3)%></td>
                            <td><%=resultSet.getString(4)%></td>
                            <td><%=resultSet.getString(5)%></td>
                            <td><%=resultSet.getString(6)%></td>
                            <td>
                                <form action="delete-reservation-servlet" method="post">
                                    <input type="hidden" name="bookingId" value="<%=resultSet.getString(1)%>">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>
                        </tr><%

                        }while (resultSet.next());%>
                    </table>

<%
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }else {
                out.println("Connection failed");
    }

%>
<br><br>
<a href="home.jsp">Back to home</a> <br><br>
<a href="logout?SAML2.HTTPBinding=HTTP-POST">Logout</a>

</body>
</html>
