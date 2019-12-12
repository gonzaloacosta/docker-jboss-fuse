FROM jboss/base-jdk:8

ENV JBOSS_EAP_VERSION 6.4.0
ENV JBOSS_HOME /opt/jboss/jboss-eap
ENV JBOSS_EXTRACT_FOLDER jboss-eap-6.4

COPY jboss-eap-${JBOSS_EAP_VERSION}.zip /tmp/

COPY fuse-eap-installer-6.2.1.redhat-084.jar /tmp/

RUN unzip /tmp/jboss-eap-${JBOSS_EAP_VERSION}.zip -d /opt/jboss && \
    mv /opt/jboss/$JBOSS_EXTRACT_FOLDER $JBOSS_HOME

RUN $JBOSS_HOME/bin/add-user.sh admin admin123! --silent

WORKDIR $JBOSS_HOME

RUN java -jar /tmp/fuse-eap-installer-6.2.1.redhat-084.jar

ENV LAUNCH_JBOSS_IN_BACKGROUND true

EXPOSE 9990 9999 8080

CMD ["/opt/jboss/jboss-eap/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
