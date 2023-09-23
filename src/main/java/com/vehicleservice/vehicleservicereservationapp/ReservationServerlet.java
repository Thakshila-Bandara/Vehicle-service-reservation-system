package com.vehicleservice.vehicleservicereservationapp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="/resrevation-serverlet")
public class ReservationServerlet extends HttpServlet {

        //retrieve data from the form
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("contact");
                String time = request.getParameter("time");
                String location = request.getParameter("location");
                String regno = request.getParameter("regno");
                String mileage = request.getParameter("mileage");
                String message = request.getParameter("message");
        }

        //perform server-side validation
}
