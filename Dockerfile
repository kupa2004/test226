FROM ubuntu:20.04
RUN apt-get update
ADD jdk-8u201-linux-x64.rpm /usr/local/src
WORKDIR /usr/local/src
RUN rpm -ivh jdk-8u201-linux-x64.rpm
ENV JAVA_HOME /usr/java/jdk1.8.0_201-amd64
ENV CLASSPATH $JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
ENV PATH $JAVA_HOME/bin:$PATH
ADD apache-tomcat-9.0.16.tar.gz /usr/local/src
RUN mv apache-tomcat-9.0.16/ /usr/local/tomcat9
ENV PATH /usr/local/tomcat9/bin/:$PATH
ADD tomcat9.run.sh /usr/local/src
RUN chmod 755 /usr/local/src/tomcat9.run.sh
RUN apt-get install maven -y maven
RUN apt-get install git -y git
WORKDIR /home
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR target
RUN cp hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 8080
CMD ["/usr/local/src/tomcat9.run.sh"]