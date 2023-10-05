<%@ page import="io.asgardeo.java.saml.sdk.bean.LoggedInSessionBean" %>
<%@ page import="io.asgardeo.java.saml.sdk.util.SSOAgentConstants" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Service</title>
    <link rel="stylesheet" href="css/home-page.css" type="text/css">
</head>
<body>
<div class="body__container">
    <h1><%= "Vehicle Service Reservation" %></h1>
    <br/>

    <% if (request.getAttribute("success") != null) { %>
    <div class="success-message" style="color: green;">
        <%= request.getAttribute("success") %><br><br>
    </div>
    <% } %>

    <%
        // Retrieve the session bean.
        LoggedInSessionBean sessionBean = (LoggedInSessionBean) session.getAttribute(SSOAgentConstants.SESSION_BEAN_NAME);

        // SAML response
        LoggedInSessionBean.SAML2SSO samlResponse = sessionBean.getSAML2SSO();

        // Autheticated username
        String subjectId = samlResponse.getSubjectId();

        // Authenticated user's attributes
        Map<String, String> saml2SSOAttributes = samlResponse.getSubjectAttributes();

        // Authenticated username
        String username = saml2SSOAttributes.get("http://wso2.org/claims/username");

        //Authenticating user's first name
        String firstName = saml2SSOAttributes.get("http://wso2.org/claims/givenname");

        //Authenticating user's last name
        String lastName = saml2SSOAttributes.get("http://wso2.org/claims/lastname");

        //Authenticating user's email
        String email = saml2SSOAttributes.get("http://wso2.org/claims/emailaddress");

        //Authenticating user's mobile number
        String mobile = saml2SSOAttributes.get("http://wso2.org/claims/mobile");

        //Authenticating user's country
        String country = saml2SSOAttributes.get("http://wso2.org/claims/country");

        //Authenticating user's token
        String token = saml2SSOAttributes.get("isk");



        if (token == null && token.isEmpty()) {

            response.sendRedirect("index.html");

        } else{

            //creating a session
            session.setAttribute("userName", username);

            out.println("Welcome " + firstName + " " + lastName + "!<br><br>");
            out.println("Username: " + username + "<br><br>");
            out.println("Email: " + email + "<br><br>");
            out.println("Mobile: " + mobile + "<br><br>");
            out.println("Country: " + country + "<br><br>");
            //for (Map.Entry<String, String> entry : saml2SSOAttributes.entrySet()) {
            //   out.println(entry.getKey() + " : " + entry.getValue());
            //}
        }%>


    <br><br>
    <a href="service-reservation-form.jsp">Reserve a service</a>
    <a href="reservation-details.jsp">My Reservation Details</a>
    <a href="delete-upcoming-reservations.jsp">Delete upcoming reservations</a> <br><br><br>
<%--    <form action="db-connection-close-servlet" method="post">--%>
<%--        <input type="submit" value="Logout">--%>
<%--    </form>--%>
    <a href="logout?SAML2.HTTPBinding=HTTP-POST">Logout</a>
</div>
</body>
</html>








