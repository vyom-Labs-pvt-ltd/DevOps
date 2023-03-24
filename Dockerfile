# Pull base image 
FROM tomcat9 

# Maintainer
MAINTAINER "ruturaj.jagtap@vyomlabs.com" 

# Copy war file on to container 
COPY /target/*.war /usr/local/tomcat/webapps/

# Expose tomcat port
EXPOSE 8080
