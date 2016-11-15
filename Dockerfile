FROM ubuntu
RUN apt-get update
RUN apt-get -y install tomcat7
expose 8080
entrypoint service tomcat7 restart || tail -f /var/log/tomcat7/catalina.out && bash
EXPOSE 8080
