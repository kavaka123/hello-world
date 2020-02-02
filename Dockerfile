# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "avant.aditya@gmail.com" 
COPY ./webapp.war /usr/local/tomcat/webapps
