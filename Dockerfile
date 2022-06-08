From tomcat:9.0
RUN apt update
RUN apt install maven git -y
WORKDIR /tmp/
RUN git clone https://github.com/B-Software/Ward.git
WORKDIR /tmp/Ward/
RUN mvn package
WORKDIR /tmp/Ward/target//usr/local/tomcat/webapps/
RUN rm -rf /usr/local/tomcat/webapps/*
RUN cp hello-1.0.war
#RUN chmod u+x ./ward-1.8.8.jar
#RUN cp ward-1.8.8.jar /usr/local/tomcat/webapps/
#RUN apt install jarwrapper -y
#CMD ./ward-1.8.8.jar