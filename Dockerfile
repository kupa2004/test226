FROM tomcat:latest
RUN apt-get update
RUN apt-get install default-jdk -y default-jdk
RUN apt-get install maven -y maven
RUN apt-get install git -y git
WORKDIR /home
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR target
RUN cp hello-1.0.war /usr/local/tomcat/webapps
ENTRYPOINT ["catalina.sh", "jpda", "run"]