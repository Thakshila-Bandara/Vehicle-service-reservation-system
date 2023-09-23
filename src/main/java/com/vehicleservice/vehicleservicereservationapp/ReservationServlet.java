package com.vehicleservice.vehicleservicereservationapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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


                //perform server-side validation
                if(name.isEmpty() || time.isEmpty() || location.isEmpty() || regno.isEmpty() || mileage.isEmpty()) {

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
                }


        }


}
