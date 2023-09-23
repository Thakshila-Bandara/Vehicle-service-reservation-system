package com.vehicleservice.vehicleservicereservationapp;

import com.vehicleservice.vehicleservicereservationapp.db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name="reservation-servlet")
public class ReservationServlet extends HttpServlet {

        //retrieve data from the form
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                String name = request.getParameter("custname");
                String date = request.getParameter("date");
                String time = request.getParameter("time");
                String location = request.getParameter("location");
                String regno = request.getParameter("regno");
                String mileage = request.getParameter("mileage");
                String message = request.getParameter("message");

                int nameMinlength = 3;
                int nameMaxlength = 50;

                // Parse the user-selected date to a Date object
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date selectedDate = null;
                try {
                        selectedDate = dateFormat.parse(date);
                } catch (ParseException e) {
                        // Handle date parsing error
                        e.printStackTrace();
                }

                Date minDate = new Date(); //current date

                //Establish database connection
                Connection connection = DBConnection.getConnection();


                //perform server-side validation
                if(name.isEmpty() || date.isEmpty() || time.isEmpty() || location.isEmpty() || regno.isEmpty() || mileage.isEmpty()) {

                        request.setAttribute("error", "Please fill in all required fields");
                        request.getRequestDispatcher("service-reservation-form.jsp").forward(request, response);
                        return;
                } else if (!name.matches("^^[a-zA-Z ]+$")) {

                        request.setAttribute("error", "Name should only contain letters and spaces");
                        request.getRequestDispatcher("service-reservation-form.jsp").forward(request, response);
                        return;
                } else if (name.length() < nameMinlength || name.length() > nameMaxlength) {

                        request.setAttribute("error", "Name must between 3 and 50 characters");
                        request.getRequestDispatcher("service-reservation-form.jsp").forward(request, response);
                        return;
                } else if (selectedDate.before(minDate)) {

                        request.setAttribute("error", "Date must be after today");
                        request.getRequestDispatcher("service-reservation-form.jsp").forward(request, response);
                        return;
                }else if(!regno.matches("^(?>[a-zA-Z]{1,3}|(?!0*-)[0-9]{1,3})-[0-9]{4}(?<!0{4})") || regno.length() > 8 || regno.length() < 7) {

                        request.setAttribute("error", "Invalid registration number");
                        request.getRequestDispatcher("service-reservation-form.jsp").forward(request, response);
                        return;
                }else if (!mileage.matches("^\\d+,?(\\d|X|k)+\\smiles$") || mileage.length() > 10) {

                        request.setAttribute("error", "Invalid mileage");
                        request.getRequestDispatcher("service-reservation-form.jsp").forward(request, response);
                        return;
                } else if (!message.matches("^[a-zA-Z0-9\\\\s.,!?()-]*$") || message.length() > 250) {

                        request.setAttribute("error", "Invalid message");
                        request.getRequestDispatcher("service-reservation-form.jsp").forward(request, response);
                        return;
                }else{

                        if(connection != null){

                                try {
                                        String sql = "INSERT INTO reservation (date, time, location, vehicle_no, " +
                                                "mileage, message, username) " +
                                                "VALUES (?, ?, ?, ?, ?, ?, ?)";
                                        PreparedStatement preparedStatement = connection.prepareStatement(sql);
                                        preparedStatement.setString(1, date);
                                        preparedStatement.setString(2, time);
                                        preparedStatement.setString(3, location);
                                        preparedStatement.setString(4, regno);
                                        preparedStatement.setString(5, mileage);
                                        preparedStatement.setString(6, message);
                                        preparedStatement.setString(7, name);

                                        //Execute the query
                                        int rowsAffected = preparedStatement.executeUpdate();

                                        if (rowsAffected > 0) {
                                                response.sendRedirect("index.jsp");
                                        } else {

                                                request.setAttribute("error", "Failed to insert data into the database");
                                                request.getRequestDispatcher("service-reservation-form.jsp").forward(request, response);
                                        }
                                    }catch (Exception e){
                                        e.printStackTrace();
                                    }
                        }else{
                                request.setAttribute("error", "Failed to establish a database connection");
                                request.getRequestDispatcher("service-reservation-form.jsp").forward(request, response);
                        }


                }






        }


}