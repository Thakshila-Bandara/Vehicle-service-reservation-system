<%@ page import="java.sql.Connection" %>
<%@ page import="com.vehicleservice.vehicleservicereservationapp.db.DBConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservation Details</title>
</head>
<body>

    <h1>Reservation Details</h1>

    <%
        //Establish database connection
        Connection connection = DBConnection.getConnection();

        if (connection != null) {
            try {
                String sql = "SELECT booking_id,date,time,location,vehicle_no,mileage,username FROM vehicle_service";
                PreparedStatement statement = connection.prepareStatement(sql);
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
                                <td><%=resultSet.getString(7)%></td>
                                <td><%=resultSet.getString(1)%></td>
                                <td><%=resultSet.getString(2)%></td>
                                <td><%=resultSet.getString(3)%></td>
                                <td><%=resultSet.getString(4)%></td>
                                <td><%=resultSet.getString(5)%></td>
                                <td><%=resultSet.getString(6)%></td>
                            </tr><%

                        }while (resultSet.next());%>
                </table>

        <%
                }
            connection.close();
            }catch (Exception e){
                e.printStackTrace();
            }

        } else {
            out.println("Connection failed");
        }
    %>
<br><br> <a href="index.jsp">Back to home</a>
</body>
</html>
