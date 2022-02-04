FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install default-jdk -y default-jdk
RUN apt-get install tomcat9 -y tomcat9
RUN apt-get install maven -y maven
RUN apt-get install git -y git
RUN cd /home/kupa
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello/
RUN mvn package
RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 80
CMD []