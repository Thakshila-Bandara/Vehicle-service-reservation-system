package com.vehicleservice.vehicleservicereservationapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="reservation-servlet")
public class ReservationServerlet extends HttpServlet {

        //retrieve data from the form
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("contact");
                String time = request.getParameter("time");
                String location = request.getParameter("location");
                String regno = request.getParameter("regno");
                String mileage = request.getParameter("mileage");
                String message = request.getParameter("message");

                //perform server-side validation
                if(name.isEmpty() || email.isEmpty() || phone.isEmpty() || time.isEmpty() || location.isEmpty() || regno.isEmpty() || mileage.isEmpty()) {

                        request.setAttribute("error", "Please fill in all required fields");
                        request.getRequestDispatcher("service-reservation-form.jsp").forward(request, response);
                        return;
                } else if (!name.matches("^^[a-zA-Z ]+$")) {

                        request.setAttribute("error", "Name should only contain letters and spaces");
                        request.getRequestDispatcher("service-reservation-form.jsp").forward(request, response);
                        return;
                }
        }


}
