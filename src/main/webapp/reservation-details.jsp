<%@ page import="java.sql.Connection" %>
<%@ page import="com.vehicleservice.vehicleservicereservationapp.db.DBConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.owasp.html.PolicyFactory" %>
<%@ page import="org.owasp.html.HtmlPolicyBuilder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservation Details</title>
    <link rel="stylesheet" href="css/reservation-details.css" type="text/css">
</head>
<body>

    <h1>Reservation Details</h1>

    <%
        //Establish database connection
        Connection connection = DBConnection.getConnection();
        String userName = (String) session.getAttribute("userName");
        if(userName != null && userName.length()>0){
            //Escape special characters
            userName = userName.replaceAll("'", "''");
        }else{
            response.sendRedirect("index.html");
        }

        PolicyFactory sanitizer = new HtmlPolicyBuilder().toFactory();


        if (connection != null) {
            try {
                String sql = "SELECT booking_id,date,time,location,vehicle_no,mileage,username FROM vehicle_service " +
                        "WHERE username = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1,userName);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next() == false){

                    out.println("No reservations found");
                }else {

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

                    </tr>

                    <%
                        do{%>
                            <tr>
                                <td><c:out value="${sanitizer.sanitize(resultSet.getString(7))}"></td>
                                <td><c:out value="${sanitizer.sanitize(resultSet.getString(1))}"></td>
                                <td><c:out value="${sanitizer.sanitize(resultSet.getString(2))}"></td>
                                <td><c:out value="${sanitizer.sanitize(resultSet.getString(3))}"></td>
                                <td><c:out value="${sanitizer.sanitize(resultSet.getString(4))}"></td>
                                <td><c:out value="${sanitizer.sanitize(resultSet.getString(5))}"></td>
                                <td><c:out value="${sanitizer.sanitize(resultSet.getString(6))}"></td>
                            </tr><%

                        }while (resultSet.next());%>
                </table>

        <%
                }

            }catch (Exception e){
                e.printStackTrace();
            }

        } else {
            out.println("Connection failed");
        }
    %>
<br><br> <a href="home.jsp">Back to home</a><br><br>
    <a href="logout?SAML2.HTTPBinding=HTTP-POST">Logout</a>
</body>
</html>
