From tomcat:9.0
RUN apt update
RUN apt install maven git -y
WORKDIR /tmp/
RUN git clone https://github.com/B-Software/Ward.git
WORKDIR /tmp/Ward/
RUN mvn package
WORKDIR /tmp/Ward/target//usr/local/tomcat/webapps/
RUN rm -rf /usr/local/tomcat/webapps/*
WORKDIR /tmp/Ward/target/
RUN chmod u+x ward-1.8.8.jar
RUN cp ward-1.8.8.jar /usr/local/tomcat/webapps/
EXPOSE 8080
RUN apt install jarwrapper -y
RUN ./ward-1.8.8.jar