FROM ubuntu:16.04

# Install prerequisites
RUN apt-get -y update; apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN apt-get -y install curl
RUN mkdir /opt/tomcat/
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp; tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.73/* /opt/tomcat/
RUN rm -rf /opt/tomcat/webapps/*

EXPOSE 8080
# java
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Define default command.
CMD ["bash"]

MAINTAINER mogunu@gmail.com


WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/mogunu/mogunsample/raw/main/moguntest.war


CMD ["/opt/tomcat/bin/catalina.sh", "run"]
