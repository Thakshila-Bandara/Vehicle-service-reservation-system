# Vehicle-service-reservation-system
A secure vehicle service reservation application created using JSP and integrated with cloud-based IDP WSO2 Asgardeo.

Let me show you how to set up this dynamic web application according to your credentials.

First of all, you need to add your database credentials to the DBConnection.java file like below.

```java
String dbUrl = "jdbc:mysql:<your db url>";
String dbUser = <database username>;
String dbPassword = <database password>;
```

Then you need to format your reservation-app.properties file according to your WSO2 Asgardeo console's data. You can refer to my blog article to set up this properties file's credentials.

Blog article link: 

Also below I showed a sample code snippet for the properties file.

```
# The URL of the SAML 2.0 Assertion Consumer
SAML2.AssertionConsumerURL=http://localhost.com:8080/sample-app/home.jsp

# A unique identifier for this SAML 2.0 application
SAML2.SPEntityId=sample-app

# A unique identifier for this SAML 2.0 Identity Provider
SAML2.IdPEntityId=localhost

# The URL of the SAML 2.0 Identity Provider
SAML2.IdPURL=https://localhost:9443/samlsso

# Adanced Properties - Only need to be changed for advanced use cases.

# Url to do send SAML2 SSO AuthnRequest
SAML2SSOURL=samlsso

# URIs to skip SSOAgentFilter; comma separated values
SkipURIs=/sample-app/index.html

IndexPage=index.html

ErrorPage=/error.jsp

# Specify if Single Sign on is enabled/disabled
EnableSAML2SSOLogin=true

# Specify if SingleLogout is enabled/disabled
SAML2.EnableSLO=true

# This is the URL that is used for SLO
SAML2.SLOURL=logout

# Specify if SAMLResponse element is signed
SAML2.EnableResponseSigning=false

# Specify if SAMLAssertion element is signed
SAML2.EnableAssertionSigning=false

# Specify if SAMLAssertion element is encrypted
SAML2.EnableAssertionEncryption=false

# Specify if AuthnRequests and LogoutRequests should be signed
SAML2.EnableRequestSigning=false

# Specify if SAML request is a passive
SAML2.IsPassiveAuthn=false

# Pem content of the IDP public certificate
#IdPPublicCert=<CERTIFICATE_PEM_CONTENT>

# Password of the KeyStore for SAML and OpenID
KeyStorePassword=wso2carbon

# Alias of the IdP's public certificate
IdPPublicCertAlias=wso2carbon

# Alias of the SP's private key
PrivateKeyAlias=wso2carbon

# Private key password to retrieve the private key used to sign AuthnRequest and LogoutRequest messages
PrivateKeyPassword=wso2carbon
```
Remember to replace SAML2.AssertionConsumerURL, SAML2.SPEntityId, SAML2.IdPEntityId, SAML2.IdPURL, SkipURIs, and IndexPage according to your application credentials registered in the WSO2 Asgardeo console.
Since this project created using Intellij IDEA you can run this project using IDE. Make sure to add Tomcat server to the IDE and add the project to the server. Then you can run the project using the IDE.


