FROM ubuntu
MAINTAINER  mukki
RUN apt-get update 
#RUN apt-get install -y tomcat7
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get -y update
RUN apt-get -y install oracle-java7-installer
RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/default/tomcat7
ADD keystore /etc/pki/keystore
ADD server.xml /etc/tomcat7/server.xml
CMD service tomcat7 restart && tail -f /var/lib/tomcat7/logs/catalina.out
EXPOSE 8080
