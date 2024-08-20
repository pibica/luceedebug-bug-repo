# https://hub.docker.com/r/lucee/lucee/tags
# FROM lucee/lucee:6.1.0.243-light-tomcat9.0-jdk11-temurin-focal
FROM lucee/lucee:6.1.0.243-light-nginx-tomcat9.0-jdk21-temurin-jammy

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/softwareCobbler/luceedebug/releases/download/agent%2F2.0.12/luceedebug-2.0.12.jar -O /opt/luceedebug.jar
ENV LUCEE_JAVA_OPTS=-javaagent:/opt/luceedebug.jar=jdwpHost=localhost,jdwpPort=9999,debugHost=0.0.0.0,debugPort=10000,jarPath=/opt/luceedebug.jar

ENV JPDA_ADDRESS=9999
ENV JPDA_TRANSPORT=dt_socket

EXPOSE 8888
EXPOSE 10000

# 
CMD ["catalina.sh", "jpda", "run"]

