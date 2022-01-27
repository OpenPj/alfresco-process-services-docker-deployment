FROM tomcat:9.0.56-jdk11-openjdk

ARG TOMCAT_DIR=/usr/local/tomcat
ARG USERNAME=alfresco
ARG USERID=33007

USER root

RUN useradd -c "Alfresco APS" -M -s "/bin/bash" -u "${USERID}" -o "${USERNAME}"

RUN rm -rf $TOMCAT_DIR/webapps/activiti-app

#Uncomment below if you need to deploy an APS Extensions JAR
#COPY --chown=${USERNAME} extensions/aps-extensions-jar-${project.version}.jar $TOMCAT_DIR/lib

COPY --chown=${USERNAME} jdbc-driver/*.* $TOMCAT_DIR/lib/
COPY --chown=${USERNAME} logging/logback.xml $TOMCAT_DIR/lib
COPY --chown=${USERNAME} properties/activiti-app.properties $TOMCAT_DIR/lib
COPY --chown=${USERNAME} properties/activiti-ldap.properties $TOMCAT_DIR/lib
COPY --chown=${USERNAME} extensions/activiti-app.war $TOMCAT_DIR/webapps
COPY --chown=${USERNAME} activiti-license/*.* $TOMCAT_DIR/lib/

RUN chown ${USERNAME}:${USERNAME} -R ${TOMCAT_DIR}

USER ${USERNAME}
