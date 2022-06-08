From tomcat:9.0
RUN apt update
RUN apt install maven git -y
From tomcat:9.0
RUN apt update
RUN apt install maven git -y
WORKDIR /tmp/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /tmp/boxfuse-sample-java-war-hello/
RUN mvn package
WORKDIR /tmp/boxfuse-sample-java-war-hello/target/
# RUN rm -rf /usr/local/tomcat/webapps/*
COPY /tmp/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
#WORKDIR /usr/libexec/tomcat9/
WORKDIR /var/lib/tomcat9/webapps
ENV CATALINA_BASE:   /usr/local/tomcat
ENV CATALINA_HOME:   /usr/local/tomcat
ENV CATALINA_TMPDIR: /usr/local/tomcat/temp
ENV JRE_HOME:        /usr
ENV CLASSPATH:       /usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar
CMD ["catalina.sh", "run"]