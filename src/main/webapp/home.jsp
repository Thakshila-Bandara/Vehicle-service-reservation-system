<%@ page import="io.asgardeo.java.saml.sdk.bean.LoggedInSessionBean" %>
<%@ page import="io.asgardeo.java.saml.sdk.util.SSOAgentConstants" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Service</title>
</head>
<body>
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

    //creating a session
    session.setAttribute("userName", username);

    out.println("Welcome " + firstName + " " + lastName + "!");
%>

<br><br>
<a href="service-reservation-form.jsp">Reserve a service</a>
<a href="reservation-details.jsp">View Reservation Details</a> <br><br>
<a href="logout?SAML2.HTTPBinding=HTTP-POST">Logout</a>
</body>
</html>