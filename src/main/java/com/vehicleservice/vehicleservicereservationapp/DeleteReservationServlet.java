package com.vehicleservice.vehicleservicereservationapp;

import com.vehicleservice.vehicleservicereservationapp.db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name="delete-reservation-servlet")
public class DeleteReservationServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String recordId = request.getParameter("bookingId");
        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("userName");

        //delete the record from the database
        Connection connection = DBConnection.getConnection();

        if (userName != null && recordId != null && connection != null) {


            try {
                String sql = "DELETE FROM vehicle_service WHERE booking_id = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, recordId);

                int rowsAffected = preparedStatement.executeUpdate();

                //check if the record was deleted successfully
                if (rowsAffected > 0) {
                    request.setAttribute("success", "Record deleted successfully");
                    request.getRequestDispatcher("delete-upcoming-reservations.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Error deleting record");
                    request.getRequestDispatcher("delete-upcoming-reservations.jsp").forward(request, response);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }else{

            request.setAttribute("error", "Error deleting record");
            request.getRequestDispatcher("delete-upcoming-reservations.jsp").forward(request, response);
        }
    }
}
