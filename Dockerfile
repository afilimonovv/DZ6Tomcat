From tomcat:9.0
RUN apt update
RUN apt install maven git -y
WORKDIR /tmp/
RUN git clone https://github.com/B-Software/Ward.git
WORKDIR /tmp/Ward/
RUN mvn package
WORKDIR /tmp/Ward/target/
RUN chmod u+x ./ward-1.8.8.jar
RUN cp ward-1.8.8.jar /usr/local/tomcat/webapps/
RUN apt install jarwrapper -y
CMD ./ward-1.8.8.jar