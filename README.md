# Vehicle-service-reservation-system
A secure vehicle service reservation application created using JSP and integrated with cloud-based IDP WSO2 Asgardeo.

Let me show you how to set up this dynamic web application according to your credentials.

First of all, you need to add your database credentials to the DBConnection.java file like below.

```java
String dbUrl = "jdbc:mysql:<your db url>";
String dbUser = <database username>;
String dbPassword = <database password>;
```

Then you need to format your reservation-app.properties file according to your WSO2 Asgardeo console's data. You can refer my blog article to set up this properties file's credentials.

Blog article link: 
