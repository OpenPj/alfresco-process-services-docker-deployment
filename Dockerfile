FROM alfresco/process-services:2.0.1

ARG TOMCAT_DIR=/usr/local/tomcat

USER root

#Uncomment the following lines for deploying extensions
#RUN rm -rf $TOMCAT_DIR/webapps/activiti-app
#COPY extensions/aps-extensions-jar-${project.version}.jar $TOMCAT_DIR/webapps/activiti-app/WEB-INF/lib
#COPY extensions/activiti-app.war $TOMCAT_DIR/webapps

COPY logging/logback.xml $TOMCAT_DIR/lib

COPY properties/activiti-app.properties $TOMCAT_DIR/lib
COPY properties/activiti-ldap.properties $TOMCAT_DIR/lib

COPY activiti-license/*.* $TOMCAT_DIR/lib/
